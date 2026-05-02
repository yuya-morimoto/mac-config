return {
	"sindrets/diffview.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewFileHistory" },
	keys = {
		{ "<leader>gd", "<cmd>DiffviewOpen<cr>", desc = "差分パネルを開く" },
		{ "<leader>gf", "<cmd>DiffviewFileHistory %<cr>", desc = "現在ファイルの履歴" },
		{ "<leader>gF", "<cmd>DiffviewFileHistory<cr>", desc = "リポジトリ全体の履歴" },
		{ "<leader>gx", "<cmd>DiffviewClose<cr>", desc = "diffviewを閉じる" },
	},
	config = function()
		require("diffview").setup()
	end,
}
