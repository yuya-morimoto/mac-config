-- コメントトグル (Comment.nvim)
-- gcc でライン・gbc でブロックコメントをトグル
return {
	"numToStr/Comment.nvim",
	event = "BufReadPre",
	opts = {},
}
