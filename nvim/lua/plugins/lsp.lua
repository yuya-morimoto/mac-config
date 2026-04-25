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
		},
	},
	dependencies = {
		{ "mason-org/mason.nvim", opts = {} },
		"neovim/nvim-lspconfig",
	},
}
