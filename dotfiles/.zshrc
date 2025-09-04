# enable zprof profiling if needed
# zmodload zsh/zprof

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will load a random theme
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

if [[ "$LC_TERMINAL" == "iTerm2" && "$OSTYPE" == "darwin"* ]]; then
	ZSH_THEME="powerlevel10k/powerlevel10k"

	# enable tmux iterm2 integration
	ZSH_TMUX_ITERM2=true

	# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
	# Initialization code that may require console input (password prompts, [y/n]
	# confirmations, etc.) must go above this block, everything else may go below.
	if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
	  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
	fi
fi

# zsh auto update
DISABLE_AUTO_UPDATE="false"
DISABLE_UPDATE_PROMPT="true"
export UPDATE_ZSH_DAYS=60

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  autojump #pkg mgr install
  zsh-autosuggestions #git install
  zsh-syntax-highlighting #git install
  git
  tmux #pkg mgr install
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

# force CLI color
export CLICOLOR_FORCE=1

# source .zshrc_mac if that's marked as mac
if [[ -f ~/.zshrc_mac_mark && -f ~/.zshrc_mac ]]; then
  source ~/.zshrc_mac
fi

# source .zshrc_kali if that's marked as kali
if [[ -f ~/.zshrc_kali_mark && -f ~/.zshrc_kali ]]; then
  source ~/.zshrc_kali
fi

# enable tmux autostart
ZSH_TMUX_AUTOSTART=true

# load oh-my-zsh if that's not launched from vscode
[[ "$TERM_PROGRAM" != "vscode" ]] && source $ZSH/oh-my-zsh.sh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# zsh bindkeys
bindkey '^F' autosuggest-accept


# manpath env
export MANPATH="/usr/local/man:$MANPATH"

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

# Configure alias for Linux
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
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
fi


# Configure aliases across OS
alias lt="sudo lsof -nP -iTCP -sTCP:LISTEN"
alias lt4="sudo lsof -nP -i4TCP -sTCP:LISTEN"
alias lu="sudo lsof -nP -iUDP"
alias lu4="sudo lsof -nP -i4UDP"

alias jh="cd ~/workspace/git/handy"
alias jhd="cd ~/workspace/git/handy/dotfiles"
alias jhs="cd ~/workspace/git/handy/scripts"
alias js="cd ~/workspace/git/shady"
alias jsa="cd ~/workspace/git/shady/ansible/default"
alias jsc="cd ~/workspace/git/shady/config"
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
alias rdp-kill="lt|grep 'ssh.*127.0.0.1:3389'|cut -d' ' -f8|xargs kill -9"

alias tpm-up="~/.tmux/plugins/tpm/bin/install_plugins;~/.tmux/plugins/tpm/bin/update_plugins all;~/.tmux/plugins/tpm/bin/clean_plugins"

if [[ $(command -v vim) != "" ]]; then
    alias vi="vim"
fi

# url encoding
function urlencode() {
  python3 -c 'import sys; from urllib.parse import quote; print(quote(sys.argv[1], sys.argv[2]))' "$1" "$urlencode_safe"
}
function urldecode() {
	echo -n "$1" | python3 -c "import sys; from urllib.parse import unquote; print(unquote(sys.stdin.read()));"
}

# base64url encoding
function base64url_encode {
  (if [ -z "$1" ]; then cat -; else echo -n "$1"; fi) |
    openssl base64 -e -A |
      sed s/\\+/-/g |
      sed s/\\//_/g |
      sed -E s/=+$//
}
function base64url_decode {
  INPUT=$(if [ -z "$1" ]; then echo -n $(cat -); else echo -n "$1"; fi)
  MOD=$(($(echo -n "$INPUT" | wc -c) % 4))
  PADDING=$(if [ $MOD -eq 2 ]; then echo -n '=='; elif [ $MOD -eq 3 ]; then echo -n '=' ; fi)
  echo -n "$INPUT$PADDING" |
    sed s/-/+/g |
    sed s/_/\\//g |
    openssl base64 -d -A
}

# Configure K8S
if [[ -d $HOME/.kube ]]; then
  export KUBECONFIG=`ls -p $HOME/.kube/*.yaml | tr '\n' ':'`

	alias k='kubecolor'
	alias kx='kubectx'
	alias kn='kubens'
fi
if [[ -d $HOME/.krew ]]; then
	export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"
fi

# Configure JAVA
if [[ -f /usr/libexec/java_home ]]; then
  #export JAVA_HOME=`/usr/libexec/java_home -v 1.8.0`
  export JAVA_HOME=`/usr/libexec/java_home -v 11`
  export PATH=$JAVA_HOME/bin:$PATH

	alias j8='unset JAVA_HOME; export JAVA_HOME=`/usr/libexec/java_home -v 1.8.0`; export PATH=$JAVA_HOME/bin:$PATH'
	alias j11='unset JAVA_HOME; export JAVA_HOME=`/usr/libexec/java_home -v 11`; export PATH=$JAVA_HOME/bin:$PATH'
	alias j17='unset JAVA_HOME; export JAVA_HOME=`/usr/libexec/java_home -v 17`; export PATH=$JAVA_HOME/bin:$PATH'
	alias j21='unset JAVA_HOME; export JAVA_HOME=`/usr/libexec/java_home -v 21`; export PATH=$JAVA_HOME/bin:$PATH'
fi

# Configure Python
if [[ -f $HOME/workspace/git/shady/scripts/pyenv.sh ]]; then
	source $HOME/workspace/git/shady/scripts/pyenv.sh
fi

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='mvim'
fi
export SYSTEMD_EDITOR='vim'

# Configure compilation flags
# export ARCHFLAGS="-arch x86_64"

# Configure asdf
if [[ -f /usr/local/opt/asdf/libexec/asdf.sh ]]; then
  source /usr/local/opt/asdf/libexec/asdf.sh
fi

# change TERM for tmux
if [ ! "$TMUX" = ""  ]; then export TERM=xterm-256color; fi

# mihomo SAFE_PATHS
export SAFE_PATHS=/usr/share/yacd-meta:/usr/share/metacubexd:/usr/share/clash-dashboard-git:/srv/clash/clash-dashboard

# load acme env
[[ ! -f ~/.acme.sh/acme.sh.env ]] || source ~/.acme.sh/acme.sh.env

# reload .zshenv in the case of macos because /etc/zprofile removed the setting
if [[ "$OSTYPE" == "darwin"* ]]; then
  source ~/.zshenv
fi

# source .zshenv if not sourced
if [[ $PATH != *workspace* ]]; then
  source ~/.zshenv
fi

# Load Angular CLI autocompletion.
if command -v ng >/dev/null 2>&1; then
  source <(ng completion script)
fi
