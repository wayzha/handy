# handy

## manually run following scripts in a new environment
```shell
mkdir -p ~/workspace/git
cd ~/workspace/git
git clone https://github.com/wayzha/handy
cd ~/workspace/git/handy/dotfiles/
# switch from https to ssh
git remote set-url origin git@github.com:wayzha/handy.git
# install
./00-install-all.sh


```
## switch from https to ssh
```
git remote set-url origin git@github.com:wayzha/handy.git
```

## switch from ssh to https
```
git remote set-url origin https://github.com/wayzha/handy.git
```

## others might be useful
```
chsh -s $(which zsh)
```
