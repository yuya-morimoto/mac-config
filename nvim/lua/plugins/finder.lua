-- ファジーファインダー (Telescope)
-- ファイル検索・grep・LSP ナビゲーションなどに使用
return {
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		opts = {
			pickers = {
				-- .gitignore 対象ファイルも検索対象に含める
				find_files = {
					no_ignore = true,
				},
			},
		},
	},
}
