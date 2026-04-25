-- Java LSP (nvim-jdtls)
-- mason でインストールされた jdtls を java ファイルを開いたときに起動
return {
	"mfussenegger/nvim-jdtls",
	ft = "java",
	config = function()
		local function start_jdtls()
			local jdtls = require("jdtls")
			local mason_registry = require("mason-registry")

			local jdtls_path = mason_registry.get_package("jdtls"):get_install_path()
			local launcher = vim.fn.glob(jdtls_path .. "/plugins/org.eclipse.equinox.launcher_*.jar")
			-- プロジェクトごとにワークスペースを分ける
			local workspace = vim.fn.expand("~/.local/share/nvim/jdtls-workspace/")
				.. vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
			-- OS に応じた設定ディレクトリを選択
			local os_config = vim.fn.has("mac") == 1 and "config_mac"
				or vim.fn.has("win32") == 1 and "config_win"
				or "config_linux"

			jdtls.start_or_attach({
				cmd = {
					"java",
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
				root_dir = jdtls.setup.find_root({ ".git", "mvnw", "gradlew", "pom.xml", "build.gradle" }),
				settings = {
					java = {},
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

		start_jdtls()

		vim.api.nvim_create_autocmd("FileType", {
			pattern = "java",
			callback = start_jdtls,
		})
	end,
}
