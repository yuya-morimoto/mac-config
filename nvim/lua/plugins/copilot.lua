return {
	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		event = "InsertEnter",
		opts = {
			-- blink-cmp-copilot 経由で補完候補に統合するため無効化
			suggestion = { enabled = false },
			panel = { enabled = false },
		},
	},
	{
		"giuxtaposition/blink-cmp-copilot",
		dependencies = { "zbirenbaum/copilot.lua" },
	},
	{
		"CopilotC-Nvim/CopilotChat.nvim",
		dependencies = {
			"zbirenbaum/copilot.lua",
			"nvim-lua/plenary.nvim",
		},
		opts = {
			window = {
				layout = "vertical",
				width = 0.38,
			},
		},
		keys = {
			{ "<leader>pt", "<cmd>CopilotChatToggle<cr>", desc = "Copilot Chat をトグル" },
			{ "<leader>pc", "<cmd>CopilotChatVisual<cr>", mode = "v", desc = "選択範囲を Copilot Chat に送信" },
			{
				"<leader>pf",
				function()
					require("CopilotChat").open({ context = "buffer" })
				end,
				desc = "現在ファイルを Copilot Chat に追加して開く",
			},
		},
	},
}
