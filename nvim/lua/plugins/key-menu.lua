-- キーマップのポップアップヒント (which-key.nvim)
-- プレフィックスキーを押して少し待つと使えるキー一覧をフロートで表示する
return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	opts = {
		delay = 500, -- 表示までの遅延（ミリ秒）
		spec = {
			{ "<leader>a", group = "AI" },
		},
	},
}
