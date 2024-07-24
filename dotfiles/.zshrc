# enable zprof profiling if needed
# zmodload zsh/zprof

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block, everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=/usr/local/bin:$PATH
# export PATH=$HOME/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

if [[ "$LC_TERMINAL" == "iTerm2" ]]; then
	ZSH_THEME="powerlevel10k/powerlevel10k"
fi

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  autojump #brew install
  zsh-autosuggestions #git install
  zsh-syntax-highlighting #git install
  git
  tmux #brew install
  colorize
  colored-man-pages
  docker
  extract
  macos
  vi-mode
  asdf
  kubectl #potential performance issue with big sur
  helm
	sudo
  autoupdate
)

# source .zshrc_mac if that's marked as mac
if [[ -f ~/.zshrc_mac_mark && -f ~/.zshrc_mac ]]; then
  source ~/.zshrc_mac
fi

# source .zshrc_kali if that's marked as kali
if [[ -f ~/.zshrc_kali_mark && -f ~/.zshrc_kali ]]; then
  source ~/.zshrc_kali
fi

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# enable tmux autostart
ZSH_TMUX_AUTOSTART=true

# enable tmux iterm2 integration
if [[ "$LC_TERMINAL" == "iTerm2" ]]; then
	ZSH_TMUX_ITERM2=true
fi

# load oh-my-zsh
source $ZSH/oh-my-zsh.sh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export MANPATH="/usr/local/man:$MANPATH"

# Configure K8S
if [[ -d $HOME/.kube ]]; then
  export KUBECONFIG=`ls -p $HOME/.kube/config* | tr '\n' ':'`
fi
alias k='kubecolor'
alias kx='kubectx'
alias kn='kubens'


# Configure JAVA
if [[ -f /usr/libexec/java_home ]]; then
  #export JAVA_HOME=`/usr/libexec/java_home -v 1.8.0`
  export JAVA_HOME=`/usr/libexec/java_home -v 11`
  export PATH=$JAVA_HOME/bin:$PATH
fi

alias j8='unset JAVA_HOME; export JAVA_HOME=`/usr/libexec/java_home -v 1.8.0`; export PATH=$JAVA_HOME/bin:$PATH'
alias j11='unset JAVA_HOME; export JAVA_HOME=`/usr/libexec/java_home -v 11`; export PATH=$JAVA_HOME/bin:$PATH'

# Configure Python
if [[ -f $HOME/workspace/git/shady/scripts/pyenv.sh ]]; then
	source $HOME/workspace/git/shady/scripts/pyenv.sh
fi

# force CLI color
export CLICOLOR_FORCE=1

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='mvim'
fi
export SYSTEMD_EDITOR='vim'

# Configure compilation flags
# export ARCHFLAGS="-arch x86_64"

# helper functions
service_exists() {
  local n=$1
  if [[ $(systemctl list-units --all -t service --full --no-legend "$n.service" | sed 's/^\s*//g' | cut -f1 -d' ') == $n.service ]]; then
      return 0
  else
      return 1
  fi
}
scs_if_service_exists() {
	if service_exists $1; then
		scs $1
	fi
}

# Configure aliases
alias lt="sudo lsof -nP -iTCP -sTCP:LISTEN"
alias lt4="sudo lsof -nP -i4TCP -sTCP:LISTEN"
alias lu="sudo lsof -nP -iUDP"
alias lu4="sudo lsof -nP -i4UDP"

alias scd="sudo systemctl daemon-reload"
alias sclf="sudo systemctl list-unit-files --type=service --state=enabled"
alias sclfa="sudo systemctl list-unit-files --type=service"
alias sclu="sudo systemctl list-units --type=service --state=running"
alias sclua="sudo systemctl list-units --type=service"
function sce {
  [ -n "$1" ] && export SYSTEMD_SVC=$1
  sudo systemctl enable $SYSTEMD_SVC
}
function scr {
  [ -n "$1" ] && export SYSTEMD_SVC=$1
  sudo systemctl restart $SYSTEMD_SVC
}
function scs {
  [ -n "$1" ] && export SYSTEMD_SVC=$1
  sudo systemctl status --no-pager $SYSTEMD_SVC
}
function scl {
  scs_if_service_exists sshproxy@home-`hostname`
  scs_if_service_exists sshproxy@inet-`hostname`
  scs_if_service_exists sshd
  scs_if_service_exists v2ray
  scs_if_service_exists shadowsocks-rust-server@ss
  scs_if_service_exists shadowsocks-libev
}
function jcu {
  [ -n "$1" ] && export SYSTEMD_SVC=$1
  journalctl -efu $SYSTEMD_SVC -xe
}

function urlencode() {
  python -c 'import urllib, sys; print urllib.quote(sys.argv[1], sys.argv[2])' "$1" "$urlencode_safe"
}

function urldecode() {
	echo -n "$1" | python3 -c "import sys; from urllib.parse import unquote; print(unquote(sys.stdin.read()));"
}

alias cb="pbcopy"
alias cb17="ssh mb17 pbcopy"
alias cb17h="ssh h2mb17 pbcopy"
alias cb19="ssh mb19 pbcopy"
alias cb19h="ssh h2mb19 pbcopy"

alias jh="cd ~/workspace/git/handy"
alias jhd="cd ~/workspace/git/handy/dotfiles"
alias jhs="cd ~/workspace/git/handy/scripts"
alias js="cd ~/workspace/git/shady"
alias jsa="cd ~/workspace/git/shady/ansible/default"
alias jsd="cd ~/workspace/git/shady/dotfiles"
alias jss="cd ~/workspace/git/shady/scripts"
alias jsv="cd ~/workspace/git/shady/services"
alias jst="cd ~/workspace/git/shady/tools"
alias jw="cd ~/workspace/git/webby/web"
alias jt="cd ~/workspace/git/teddy"
alias jtd="cd ~/workspace/git/teddy/docker"
alias jtv="cd ~/workspace/git/teddy/vm"

alias rdp-ubt21="ssh -fNTL 3389:192.168.88.21:3389 h2rpi3"
alias rdp-win40="ssh -fNTL 3389:192.168.88.40:3389 h2rpi3"
alias rdp-mb14="ssh -fNTL 3389:127.0.0.1:3389 h2mb14"
alias rdp-list="lt|grep 'ssh.*127.0.0.1:3389';ps aux|grep 'ssh.*127.0.0.1:3389'|grep -v 'grep'"
alias rdp-kill="kill -9 $(lt|grep 'ssh.*127.0.0.1:3389'|cut -d' ' -f8)"

alias tpm-up="~/.tmux/plugins/tpm/bin/install_plugins;~/.tmux/plugins/tpm/bin/update_plugins all;~/.tmux/plugins/tpm/bin/clean_plugins"


if [[ $(command -v vim) != "" ]]; then
    alias vi="vim"
fi

# Configure asdf
if [[ -f /usr/local/opt/asdf/libexec/asdf.sh ]]; then
  source /usr/local/opt/asdf/libexec/asdf.sh
fi

# change TERM for tmux
if [ ! "$TMUX" = ""  ]; then export TERM=xterm-256color; fi

# load acme env
[[ ! -f ~/.acme.sh/acme.sh.env ]] || source ~/.acme.sh/acme.sh.env

# Env for CIC Nexus
# export NEXUS_USER=developer
# export NEXUS_PASSWORD=oApEuutzXvptjPXm

# source .zshrc_standard for SFSF development
# if [[ -f ~/.zshrc_standard ]]; then
#   source ~/.zshrc_standard
# fi

# reload .zshenv in the case of macos because /etc/zprofile removed the setting
# if [[ "$OSTYPE" == "darwin"* ]]; then
#   source ~/.zshenv
# fi

# source .zshenv if not sourced
if [[ $PATH != *workspace* ]]; then
  source ~/.zshenv
fi
