-- バッファをタブとして上部に表示 (bufferline.nvim)
return {
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	event = "BufReadPre",
	opts = {
		options = {
			separator_style = "slant",
			show_buffer_close_icons = true,
			show_close_icon = false,
			diagnostics = "nvim_lsp",
			offsets = {
				{
					filetype = "oil",
					text = "File Explorer",
					highlight = "Directory",
				},
			},
		},
		highlights = {
			-- アクティブなバッファ
			buffer_selected = {
				fg = "#61afef", -- 青
				bold = true,
				italic = false,
			},
			indicator_selected = {
				fg = "#61afef",
				bg = "#2c313a",
			},
			-- 非アクティブなバッファ
			background = {
				fg = "#5c6370", -- グレー
				bg = "#21252b",
			},
			-- スラント区切り
			separator = {
				fg = "#21252b",
				bg = "#21252b",
			},
			separator_selected = {
				fg = "#21252b",
				bg = "#2c313a",
			},
			separator_visible = {
				fg = "#21252b",
				bg = "#21252b",
			},
			-- 塗りつぶし部分
			fill = {
				bg = "#21252b",
			},
			-- LSP エラーの色
			error = { fg = "#e06c75", bg = "#21252b" },
			error_selected = { fg = "#e06c75", bold = true },
			warning = { fg = "#e5c07b", bg = "#21252b" },
			warning_selected = { fg = "#e5c07b", bold = true },
		},
	},
}
