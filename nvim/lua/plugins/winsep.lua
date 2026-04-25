-- アクティブウィンドウの周囲に色付きの枠線を表示 (colorful-winsep.nvim)
return {
	"nvim-zh/colorful-winsep.nvim",
	event = "WinNew",
	opts = {
		highlight = "#4ecca3",
	},
}
