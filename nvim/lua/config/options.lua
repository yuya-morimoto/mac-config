-- 背景を透過（ターミナルの背景を活かす）
vim.cmd([[
  highlight Normal guibg=none
  highlight NonText guibg=none
  highlight Normal ctermbg=none
  highlight NonText ctermbg=none
  highlight NormalNC guibg=none
  highlight NormalSB guibg=none
]])

-- アクティブウィンドウの現在行をハイライト
vim.opt.cursorline = true

-- モードごとに cursorline をソリッドな色で塗る（透過背景対応）
local mode_hl = {
	n = "#1e4d30", -- normal: 深緑
	i = "#1a3a5c", -- insert: 深青
	v = "#6b3fa0", -- visual: statusline の紫に合わせた色
	V = "#6b3fa0",
	["\22"] = "#6b3fa0",
	R = "#5c1f1f", -- replace: 深赤
}
local function apply(mode)
	local m = mode:sub(1, 1)
	vim.api.nvim_set_hl(0, "CursorLine", { bg = mode_hl[m] or mode_hl.n })
end
vim.api.nvim_create_autocmd("ModeChanged", {
	callback = function()
		apply(vim.v.event.new_mode)
	end,
})
vim.api.nvim_create_autocmd({ "BufEnter", "WinEnter" }, {
	callback = function()
		apply(vim.fn.mode())
	end,
})
apply("n")

-- カラースキームリロード後も色を維持
vim.api.nvim_create_autocmd("ColorScheme", {
	pattern = "*",
	callback = function()
		vim.api.nvim_set_hl(0, "Visual", { bg = "#4a2a7a" })
		apply(vim.fn.mode())
	end,
})
vim.api.nvim_set_hl(0, "Visual", { bg = "#4a2a7a" })

-- 分割ウィンドウ上部にファイル名を表示
vim.opt.winbar = "%=%t%m"

-- 行番号を表示
vim.opt.number = true

-- nvim-ufo に必要な fold 設定
vim.o.foldcolumn = "0"
vim.o.foldlevel = 99 -- デフォルトで全て展開した状態にする
vim.o.foldlevelstart = 99
vim.o.foldenable = true

-- インデント: スペース2つ
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2

-- LSP 診断の表示設定
vim.diagnostic.config({
	virtual_text = true, -- 行末にエラーメッセージを表示
	signs = true, -- 行番号横にアイコンを表示
	underline = true, -- 該当箇所に下線
	update_in_insert = false, -- 入力中は更新しない（パフォーマンス対策）
	severity_sort = false,
})
