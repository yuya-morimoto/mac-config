-- 括弧・クォートの自動補完 (nvim-autopairs)
-- 入力開始時にロード
return {
	"windwp/nvim-autopairs",
	event = "InsertEnter",
	config = true,
}
