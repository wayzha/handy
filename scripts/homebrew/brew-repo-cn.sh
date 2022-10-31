# 替换brew.git:
cd "$(brew --repo)"
git remote set-url origin https://mirrors.aliyun.com/homebrew/brew.git

# 替换homebrew-core.git:
cd "$(brew --repo)"/Library/Taps/homebrew/homebrew-core
git remote set-url origin https://mirrors.aliyun.com/homebrew/homebrew-core.git

# 替换homebrew-cask.git:
cd "$(brew --repo)"/Library/Taps/homebrew/homebrew-cask
git remote set-url origin https://mirrors.ustc.edu.cn/homebrew-cask.git

# 替换homebrew-bottles:
# echo 'export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.ustc.edu.cn/homebrew-bottles' >> ~/.zshrc_mac

# 更新配置
# source ~/.zshrc_mac

# 验证
# brew update
