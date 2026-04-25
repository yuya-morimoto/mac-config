-- Claude Code との統合 (claudecode.nvim)
-- Neovim 内で Claude Code CLI をトグル・ファイル/選択範囲の送信ができる
return {
	"coder/claudecode.nvim",
	opts = {
		split_side = "right",
		split_width_percentage = 0.38,
		log_level = "info",
	},
	keys = {
		{ "<leader>at", "<cmd>ClaudeCode<cr>", desc = "Claude Code をトグル" },
		{ "<leader>af", "<cmd>ClaudeCodeAdd %<cr>", desc = "現在ファイルを Claude に追加" },
		{ "<leader>as", "<cmd>ClaudeCodeSend<cr>", mode = "v", desc = "選択範囲を Claude に送信" },
	},
}
