-- Java LSP (nvim-jdtls)
-- mason でインストールされた jdtls を java ファイルを開いたときに起動
return {
	"mfussenegger/nvim-jdtls",
	ft = "java",
	config = function()
		local function start_jdtls()
			local jdtls = require("jdtls")

			local jdtls_path = vim.fn.expand("~/.local/share/nvim/mason/packages/jdtls")
			if vim.fn.isdirectory(jdtls_path) == 0 then
				vim.notify("jdtls not found. Run :MasonInstall jdtls", vim.log.levels.WARN)
				return
			end
			local lombok_jar = jdtls_path .. "/lombok.jar"
			if vim.fn.filereadable(lombok_jar) == 0 then
				vim.notify("Downloading lombok.jar...", vim.log.levels.INFO)
				vim.fn.system({
					"curl", "-L", "-o", lombok_jar,
					"https://projectlombok.org/downloads/lombok.jar",
				})
			end
			local launcher = vim.fn.glob(jdtls_path .. "/plugins/org.eclipse.equinox.launcher_*.jar")
			-- プロジェクトごとにワークスペースを分ける
			local workspace = vim.fn.expand("~/.local/share/nvim/jdtls-workspace/")
				.. vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
			-- OS に応じた設定ディレクトリを選択
			local os_config = vim.fn.has("mac") == 1 and "config_mac"
				or vim.fn.has("win32") == 1 and "config_win"
				or "config_linux"

			-- gradle-wrapper.jar のハッシュを動的に計算して自動信頼
			local root_dir = jdtls.setup.find_root({ ".git", "mvnw", "gradlew", "pom.xml", "build.gradle" })
			local checksums = {}
			if root_dir then
				local wrapper_jar = root_dir .. "/gradle/wrapper/gradle-wrapper.jar"
				if vim.fn.filereadable(wrapper_jar) == 1 then
					local sha = vim.fn.system("shasum -a 256 " .. vim.fn.shellescape(wrapper_jar)):match("^(%x+)")
					if sha then
						checksums = { { sha256 = sha, allowed = true } }
					end
				end
			end

			jdtls.start_or_attach({
				cmd = {
					"java",
					"-javaagent:" .. lombok_jar,
					"-Declipse.application=org.eclipse.jdt.ls.core.id1",
					"-Dosgi.bundles.defaultStartLevel=4",
					"-Declipse.product=org.eclipse.jdt.ls.core.product",
					"-Dlog.level=ALL",
					"-Xmx1g",
					"--add-modules=ALL-SYSTEM",
					"--add-opens",
					"java.base/java.util=ALL-UNNAMED",
					"--add-opens",
					"java.base/java.lang=ALL-UNNAMED",
					"-jar",
					launcher,
					"-configuration",
					jdtls_path .. "/" .. os_config,
					"-data",
					workspace,
				},
				root_dir = root_dir,
				settings = {
					java = {
						imports = {
							gradle = {
								wrapper = { checksums = checksums },
							},
						},
					},
				},
				handlers = {
					["window/showMessageRequest"] = function(err, result, ctx, config)
						if result and result.message and result.message:find("[Gg]radle") then
							return vim.NIL
						end
						return vim.lsp.handlers["window/showMessageRequest"](err, result, ctx, config)
					end,
					["window/showMessage"] = function(err, result, ctx, config)
						if result and result.message and result.message:find("[Gg]radle") then
							return
						end
						return vim.lsp.handlers["window/showMessage"](err, result, ctx, config)
					end,
				},
				on_attach = function(_, bufnr)
					local opts = { noremap = true, silent = true, buffer = bufnr }
					vim.keymap.set("n", "<leader>jo", jdtls.organize_imports, opts)
					vim.keymap.set("n", "<leader>jv", jdtls.extract_variable, opts)
					vim.keymap.set("v", "<leader>jv", function()
						jdtls.extract_variable(true)
					end, opts)
					vim.keymap.set("n", "<leader>jm", function()
						jdtls.extract_method(true)
					end, opts)
					vim.keymap.set("n", "<leader>jc", jdtls.extract_constant, opts)
				end,
			})
		end

		vim.api.nvim_create_autocmd("FileType", {
			pattern = "java",
			callback = start_jdtls,
		})
	end,
}
