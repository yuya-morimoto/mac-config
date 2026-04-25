-- ファイルエクスプローラー (oil.nvim)
-- ディレクトリをバッファとして開き、通常の編集操作でファイル操作できる
return {
	{
		"stevearc/oil.nvim",
		lazy = false,
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {
			default_file_explorer = true,
			columns = { "icon" },
			view_options = {
				show_hidden = true, -- ドットファイルを表示
			},
			float = {
				padding = 2,
				max_width = 90,
				max_height = 35,
				border = "rounded",
			},
			keymaps = {
				["<Space>"] = "actions.select",
				["<C-v>"] = { "actions.select", opts = { vertical = true } },
				["<C-h>"] = { "actions.select", opts = { horizontal = true } },
				["<C-t>"] = false, -- タブで開くのを無効化
				["q"] = "actions.close",
			},
		},
	},
}
