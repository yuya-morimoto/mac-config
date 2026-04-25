-- インデントガイド (indent-blankline.nvim)
-- インデントの深さを縦線で可視化する
return {
	"lukas-reineke/indent-blankline.nvim",
	main = "ibl",
	event = "BufReadPre",
	opts = {
		indent = {
			char = "│", -- インデントを示す縦線の文字
		},
		scope = {
			enabled = true, -- 現在のスコープ（関数・ブロックなど）をハイライト
		},
	},
}
