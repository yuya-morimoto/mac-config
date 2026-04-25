-- ステータスライン (lualine.nvim)
-- モード・Git・ファイル情報・LSP診断・カーソル位置を表示
return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {
		options = {
			theme = "onedark",
			component_separators = { left = "", right = "" },
			section_separators = { left = "", right = "" },
		},
		sections = {
			lualine_a = { "mode" }, -- 現在のモード (NORMAL / INSERT など)
			lualine_b = { "branch", "diff", "diagnostics" }, -- Git ブランチ・差分・LSP エラー数
			lualine_c = { { "filename", path = 1 } }, -- ルートからの相対パスでファイル名表示
			lualine_x = { "encoding", "fileformat", "filetype" }, -- 文字コード・改行コード・ファイルタイプ
			lualine_y = { "progress" }, -- ファイル内の進捗 (%)
			lualine_z = { "location" }, -- 行・列番号
		},
	},
}
