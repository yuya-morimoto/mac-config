return {
	"akinsho/toggleterm.nvim",
	version = "*",
	keys = {
		{ "<leader>tt", "<cmd>ToggleTerm<CR>", desc = "ターミナルをトグル", mode = { "n", "t" } },
	},
	opts = {
		size = function(term)
			if term.direction == "horizontal" then
				return 15
			elseif term.direction == "vertical" then
				return vim.o.columns * 0.4
			end
		end,
		direction = "float",
		float_opts = {
			border = "curved",
		},
		shade_terminals = false,
	},
}
