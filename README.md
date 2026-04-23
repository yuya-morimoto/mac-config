# 説明

Macでの開発に利用するツールとセットアップ手順をまとめたリポジトリ。

## 利用ツール

### 📦 パッケージ管理

| ツール名 | 説明 |
| -------- | ---- |
| Homebrew | パッケージマネージャ |

### 🌐 ブラウザ

| ツール名 | 説明 |
| -------- | ---- |
| Chrome | ブラウザ |
| Brave | プライバシー重視ブラウザ |

### 🛠️ 開発

| ツール名 | 説明 |
| -------- | ---- |
| Xcode | iOS/macOSアプリ開発IDE |
| Android Studio | Androidアプリ開発IDE |
| Zed | コードエディタ |
| Ghostty | ターミナル |
| DBeaver | DBクライアント |
| Cyberduck | FTPクライアント |

### 🚀 生産性

| ツール名 | 説明 |
| -------- | ---- |
| Slack | チームコミュニケーション |
| Obsidian | ノート・ナレッジ管理 |
| 1Password | パスワードマネージャ |
| AquaVoice | 音声入力ツール |

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
git config --global user.email 'ym20250421@gmail.com'
```

### 4. 各種ツールインストール
