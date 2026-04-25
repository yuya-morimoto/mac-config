-- カラーテーマ (onedark)
-- priority = 1000 で他プラグインより先にロードして色崩れを防ぐ
return {
	{
		"navarasu/onedark.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("onedark").setup({
				style = "dark",
				transparent = true, -- ターミナルの背景を透過
			})
			require("onedark").load()
		end,
	},
}
