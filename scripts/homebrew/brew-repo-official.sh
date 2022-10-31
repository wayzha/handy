#重置brew.git:
cd "$(brew --repo)"
git remote set-url origin https://github.com/Homebrew/brew.git

#重置homebrew-core.git:
cd "$(brew --repo)/Library/Taps/homebrew/homebrew-core"
git remote set-url origin https://github.com/Homebrew/homebrew-core.git

#重置homebrew-cask.git：
cd "$(brew --repo)"/Library/Taps/homebrew/homebrew-cask
git remote set-url origin https://github.com/Homebrew/homebrew-cask
#Caskroom 的 Git 地址在 2018年5月25 日从 https://github.com/caskroom/homebrew-cask 迁移到了 https://github.com/Homebrew/homebrew-cask

#最后注释掉/.zshrc_mac里的homebrew-bottles并保存，以bash为例
# cd ~
# open .zshrc_mac

#更新.zshrc_mac
# source .zshrc_mac
