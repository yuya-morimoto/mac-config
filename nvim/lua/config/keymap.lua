local vim = vim

-- ファイル検索 (Telescope)
vim.keymap.set(
	"n",
	"<Leader>ff",
	"<cmd>Telescope find_files<CR>",
	{ noremap = true, silent = true, desc = "ファイル名で検索" }
)
vim.keymap.set(
	"n",
	"<Leader>fg",
	"<cmd>Telescope live_grep<CR>",
	{ noremap = true, silent = true, desc = "ファイル内容をgrep" }
)
vim.keymap.set(
	"n",
	"<Leader>fb",
	"<cmd>Telescope buffers<CR>",
	{ noremap = true, silent = true, desc = "バッファ一覧" }
)
vim.keymap.set(
	"n",
	"<Leader>fh",
	"<cmd>Telescope help_tags<CR>",
	{ noremap = true, silent = true, desc = "ヘルプタグ検索" }
)
vim.keymap.set(
	"n",
	"<leader>fc",
	"<cmd>Telescope current_buffer_fuzzy_find<CR>",
	{ noremap = true, silent = true, desc = "現在バッファ内を検索" }
)

-- ファイルエクスプローラー (oil.nvim)
vim.keymap.set("n", "-", "<cmd>Oil<CR>", { noremap = true, silent = true, desc = "親ディレクトリを開く" })
vim.keymap.set("n", "<C-n>", function()
	require("oil").toggle_float()
end, { noremap = true, silent = true, desc = "ファイラーをフロートで開く" })

-- バッファ移動 (bufferline)
vim.keymap.set(
	"n",
	"<Tab>",
	"<cmd>BufferLineCycleNext<CR>",
	{ noremap = true, silent = true, desc = "次のバッファへ" }
)
vim.keymap.set(
	"n",
	"<S-Tab>",
	"<cmd>BufferLineCyclePrev<CR>",
	{ noremap = true, silent = true, desc = "前のバッファへ" }
)
vim.keymap.set(
	"n",
	"<leader>bd",
	"<cmd>bdelete<CR>",
	{ noremap = true, silent = true, desc = "バッファを閉じる" }
)

-- ウィンドウ分割・移動
vim.keymap.set("n", "<C-\\>v", "<cmd>vsplit<CR>", { noremap = true, silent = true, desc = "垂直分割" })
vim.keymap.set("n", "<C-\\>h", "<cmd>split<CR>", { noremap = true, silent = true, desc = "水平分割" })
vim.keymap.set(
	"n",
	"<C-\\><C-\\>",
	"<C-w>w",
	{ noremap = true, silent = true, desc = "次のウィンドウへ移動" }
)

-- Git (LazyGit)
vim.keymap.set("n", "<Leader>gg", "<cmd>LazyGit<CR>", { noremap = true, silent = true, desc = "LazyGit を開く" })

-- LSP ナビゲーション
vim.keymap.set("n", "K", function()
	local winid = require("ufo").peekFoldedLinesUnderCursor()
	if not winid then
		vim.lsp.buf.hover()
	end
end, { noremap = true, silent = true, desc = "折りたたみプレビュー / ドキュメント表示" })
vim.keymap.set("n", "zR", function()
	require("ufo").openAllFolds()
end, { desc = "全て展開" })
vim.keymap.set("n", "zM", function()
	require("ufo").closeAllFolds()
end, { desc = "全て折りたたむ" })
vim.keymap.set("n", "gr", "<cmd>Telescope lsp_references<CR>", { noremap = true, silent = true, desc = "参照一覧" })
vim.keymap.set(
	"n",
	"gd",
	"<cmd>Telescope lsp_definitions<CR>",
	{ noremap = true, silent = true, desc = "定義へジャンプ" }
)
vim.keymap.set(
	"n",
	"gD",
	"<cmd>lua vim.lsp.buf.declaration()<CR>",
	{ noremap = true, silent = true, desc = "宣言へジャンプ" }
)
vim.keymap.set(
	"n",
	"gi",
	"<cmd>Telescope lsp_implementations<CR>",
	{ noremap = true, silent = true, desc = "実装へジャンプ" }
)
vim.keymap.set(
	"n",
	"gt",
	"<cmd>Telescope lsp_type_definitions<CR>",
	{ noremap = true, silent = true, desc = "型定義へジャンプ" }
)

-- LSP 編集
vim.keymap.set(
	"n",
	"<leader>rn",
	"<cmd>lua vim.lsp.buf.rename()<CR>",
	{ noremap = true, silent = true, desc = "シンボルをリネーム" }
)
vim.keymap.set(
	{ "n", "v" },
	"<leader>ca",
	"<cmd>lua vim.lsp.buf.code_action()<CR>",
	{ noremap = true, silent = true, desc = "コードアクション" }
)

-- LSP 診断
vim.keymap.set(
	"n",
	"<leader>e",
	"<cmd>lua vim.diagnostic.open_float()<CR>",
	{ noremap = true, silent = true, desc = "エラー詳細を表示" }
)
vim.keymap.set(
	"n",
	"[d",
	"<cmd>lua vim.diagnostic.goto_prev()<CR>",
	{ noremap = true, silent = true, desc = "前のエラーへ" }
)
vim.keymap.set(
	"n",
	"]d",
	"<cmd>lua vim.diagnostic.goto_next()<CR>",
	{ noremap = true, silent = true, desc = "次のエラーへ" }
)
vim.keymap.set(
	"n",
	"<leader>dl",
	"<cmd>Telescope diagnostics<CR>",
	{ noremap = true, silent = true, desc = "エラー一覧" }
)

-- Markdown プレビュー
vim.keymap.set(
	"n",
	"<leader>mt",
	"<cmd>RenderMarkdown toggle<CR>",
	{ noremap = true, silent = true, desc = "Markdownレンダリング切替" }
)

-- インサートモードを抜ける (macOS)
vim.keymap.set("i", "<D-S-j>", "<ESC>", { noremap = true, silent = true, desc = "ノーマルモードに戻る" })

-- 翻訳
vim.keymap.set(
	"v",
	"<Leader>t",
	":'<,'>TranslateW<CR>",
	{ noremap = true, silent = true, desc = "選択テキストを日本語に翻訳" }
)
