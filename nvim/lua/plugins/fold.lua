-- コード折りたたみ (nvim-ufo)
-- treesitter / LSP を使って賢くコードを折りたためる
return {
	"kevinhwang91/nvim-ufo",
	dependencies = { "kevinhwang91/promise-async" },
	event = "BufReadPost",
	opts = {
		-- treesitter を優先、フォールバックで indent を使用
		provider_selector = function(bufnr, filetype, buftype)
			return { "treesitter", "indent" }
		end,
	},
}
