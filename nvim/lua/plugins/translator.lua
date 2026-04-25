-- 翻訳プラグイン (vim-translator)
-- <leader>t で選択テキストを日本語に翻訳
vim.g.translator_target_lang = "ja"
vim.g.translator_source_lang = "auto"
vim.g.translator_window_type = "popup"

return {
	{ "voldikss/vim-translator" },
}
