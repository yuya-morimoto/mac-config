# 概要

このリポジトリはmacOSのシステム設定や各種使用ツール、管理方法やセットアップの手順をまとめています。

# ディレクトリ構成

```
mac-config/
├── CLAUDE.md
├── README.md
├── ghostty/          # Ghostty ターミナルエミュレータの設定
│   └── config
├── homebrew/         # Homebrew パッケージ管理
│   └── .Brewfile
├── mise/             # mise ツールバージョン管理の設定
│   └── config.toml
├── nvim/             # Neovim 設定 (Lua)
│   ├── init.lua
│   ├── lazy-lock.json
│   ├── mise.toml
│   ├── KEYMAPS.md
│   ├── README.md
│   ├── lua/
│   │   ├── config/   # 基本設定 (keymap, options, lazy, prompt)
│   │   └── plugins/  # プラグイン設定
└── zed/              # Zed エディタの設定
    └── settings.json
```
