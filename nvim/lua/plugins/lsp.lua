-- LSP サーバーの自動インストール・設定
-- mason: LSP サーバーのインストーラー
-- mason-lspconfig: mason と nvim-lspconfig を繋ぐブリッジ
return {
	"mason-org/mason-lspconfig.nvim",
	opts = {
		ensure_installed = {
			"lua_ls", -- Lua
			"gopls", -- Go
			"vtsls", -- TypeScript / JavaScript
			"jdtls", -- Java
			"pyright", -- Python
			"rust_analyzer", -- Rust
			"terraformls", -- Terraform
			"ansiblels", -- Ansible
		},
		handlers = {
			-- go.work が新しいGoバージョンを要求する場合でも gopls が動作するよう GOTOOLCHAIN を設定
			["gopls"] = function()
				require("lspconfig").gopls.setup({
					settings = {
						gopls = {
							env = { GOTOOLCHAIN = "auto" },
						},
					},
				})
			end,
		},
	},
	dependencies = {
		{ "mason-org/mason.nvim", opts = {} },
		"neovim/nvim-lspconfig",
	},
}
