# 説明

Macでの開発に利用するツールとセットアップ手順をまとめたリポジトリ。

## セットアップ
 
### 1. Mac設定

#### ソフトウェアアップデート

```bash
# 確認
softwareupdate -l
# アップデート
softwareupdate -ia
```

#### 設定

##### Mac基本設定

```bash
# 起動時のドゥ〜ンを停止
sudo nvram StartupMute=%01
# 関連ディレクトリを作成
mkdir -p ~/Workspaces ~/Obsidian ~/Data
```

##### Dock

```bash
# Dockサイズを変更
defaults write com.apple.dock tilesize -int 32
# Dockの自動表示/非表示有効化
defaults write com.apple.dock autohide -bool true
# Dockの表示速度最速化
defaults write com.apple.dock autohide-delay -int 0
# Dock再起動で反映
killall Dock
```

##### Finder

```bash
# 拡張子表示
defaults write NSGlobalDomain AppleShowAllExtensions -bool true
# 隠しファイルを表示
defaults write com.apple.Finder AppleShowAllFiles -bool true
# パス表示
defaults write com.apple.finder ShowPathbar -bool true
# Finder再起動で反映
killall Finder
```

##### Keyboard

```bash
# 入力度最速
defaults write -g InitialKeyRepeat -int 11 && defaults write -g KeyRepeat -int 1
# CapsLockによる入力ソース切替
defaults write -g AppleLanguagesSwitchKeyAction -int 1
```

### 2. Homebrewインストール&パッケージインストール

参考: https://brew.sh/ja/

```bash
# Homebrewインストール
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
# .BrewfileをHomeディレクトリへ移動
mv -i ./configs/Homebrew/.Brewfile ~/.Brewfile
# パッケージインストール
brew bundle --global
```

### 3. Git設定

```bash
git config --global user.name 'yuya-morimoto'
git config --global user.email 'your@email.com'
```

### 4. Neovim設定

```bash
# すでに設定が存在する場合はバックアップ（タイムスタンプ付き）
[ -d ~/.config/nvim ] && mv ~/.config/nvim ~/.config/nvim.bak.$(date +%Y%m%d%H%M%S)

# 設定を移動
cp -r ./nvim ~/.config/nvim

# Neovimを起動するとlazy.nvimがプラグインを自動インストール
nvim
```

### 5. Zed設定

```bash
# すでに設定が存在する場合はバックアップ（タイムスタンプ付き）
[ -f ~/.config/zed/settings.json ] && mv ~/.config/zed/settings.json ~/.config/zed/settings.json.bak.$(date +%Y%m%d%H%M%S)

# 設定を配置
mkdir -p ~/.config/zed
cp ./zed/settings.json ~/.config/zed/settings.json
```

### 6. Ghostty設定

```bash
# すでに設定が存在する場合はバックアップ（タイムスタンプ付き）
[ -f ~/.config/ghostty/config ] && mv ~/.config/ghostty/config ~/.config/ghostty/config.bak.$(date +%Y%m%d%H%M%S)

# 設定を配置
mkdir -p ~/.config/ghostty
cp ./ghostty/config ~/.config/ghostty/config
```

### 7. 各種ツールインストール

[利用ツール](#利用ツール)を見て必要なツールをインストールしていく

## 利用ツール

### 📦 パッケージ管理

| ツール名 | 説明 | セットアップ |
| -------- | ---- | --------------- |
| Homebrew | パッケージマネージャ | CLI |

### 🌐 ブラウザ

| ツール名 | 説明 | セットアップ |
| -------- | ---- | --------------- |
| Chrome | ブラウザ | [ダウンロード](https://www.google.com/chrome/) |
| Brave | プライバシー重視ブラウザ | [ダウンロード](https://brave.com/ja/download/) |

### 🛠️ 開発

| ツール名 | 説明 | セットアップ |
| -------- | ---- | --------------- |
| Xcode | iOS/macOSアプリ開発IDE | [ダウンロード](https://developer.apple.com/download/all/?q=xcode) |
| Android Studio | Androidアプリ開発IDE | [ダウンロード](https://developer.android.com/studio?hl=ja) |
| Zed | コードエディタ | [ダウンロード](https://zed.dev/) |
| Ghostty | ターミナル | [ダウンロード](https://ghostty.org/) |
| DBeaver | DBクライアント | [ダウンロード](https://dbeaver.io/download/) |
| Cyberduck | FTPクライアント | [ダウンロード](https://cyberduck.io/download/) |

### 🚀 生産性

| ツール名 | 説明 | セットアップ |
| -------- | ---- | --------------- |
| Slack | チームコミュニケーション | [ダウンロード](https://slack.com/intl/ja-jp/downloads/mac) |
| Obsidian | ノート・ナレッジ管理 | [ダウンロード](https://obsidian.md/) |
| 1Password | パスワードマネージャ | [ダウンロード](https://1password.com/jp/downloads/mac) |
| AquaVoice | 音声入力ツール | [ダウンロード](https://aquavoice.com/download) |
