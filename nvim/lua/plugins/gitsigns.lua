return {
	"lewis6991/gitsigns.nvim",
	event = "BufReadPre",
	config = function()
		require("gitsigns").setup({
			signs = {
				add = { text = "│" },
				change = { text = "│" },
				delete = { text = "_" },
				topdelete = { text = "‾" },
				changedelete = { text = "~" },
			},
			on_attach = function(bufnr)
				local gs = package.loaded.gitsigns
				local function map(mode, l, r, opts)
					opts = opts or {}
					opts.buffer = bufnr
					vim.keymap.set(mode, l, r, opts)
				end

				map("n", "]c", function()
					if vim.wo.diff then return "]c" end
					vim.schedule(function() gs.next_hunk() end)
					return "<Ignore>"
				end, { expr = true, desc = "次のhunkへ" })
				map("n", "[c", function()
					if vim.wo.diff then return "[c" end
					vim.schedule(function() gs.prev_hunk() end)
					return "<Ignore>"
				end, { expr = true, desc = "前のhunkへ" })

				map("n", "<leader>gs", gs.stage_hunk, { desc = "hunkをステージ" })
				map("n", "<leader>gr", gs.reset_hunk, { desc = "hunkをリセット" })
				map("v", "<leader>gs", function()
					gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
				end, { desc = "選択範囲をステージ" })
				map("v", "<leader>gr", function()
					gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
				end, { desc = "選択範囲をリセット" })
				map("n", "<leader>gu", gs.undo_stage_hunk, { desc = "ステージを取り消す" })
				map("n", "<leader>gp", gs.preview_hunk, { desc = "hunkをプレビュー" })
				map("n", "<leader>gb", function()
					gs.blame_line({ full = true })
				end, { desc = "blameをポップアップ表示" })
			end,
		})
	end,
}
