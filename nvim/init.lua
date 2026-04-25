-- プラグインマネージャーのセットアップ
require("config.lazy")
-- エディタの基本設定
require("config.options")
-- キーマップ定義
require("config.keymap")
-- クリップボードをシステムと共有
vim.opt.clipboard = "unnamedplus"
