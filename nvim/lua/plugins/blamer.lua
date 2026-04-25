-- Git blame をカーソル行に仮想テキストで表示 (blamer.nvim)
return {
	"z4p5a9/blamer.nvim",
	event = "BufReadPre",
	config = function()
		vim.g.blamer_enabled = 1
		vim.g.blamer_delay = 500 -- 表示までの遅延（ミリ秒）
		vim.g.blamer_show_in_visual_modes = 0
		vim.g.blamer_show_in_insert_modes = 0
		vim.g.blamer_prefix = " 👤 "
		vim.g.blamer_template = "<committer>, <committer-time> • <summary>"
		vim.g.blamer_relative_time = 1 -- 相対時間で表示（例: 3 days ago）
	end,
}
