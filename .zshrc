# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="/home/kconston/.oh-my-zsh"

# ZSH_THEME="spaceship"
ZSH_THEME="powerlevel10k/powerlevel10k"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

plugins=(git zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

SPACESHIP_PROMPT_ADD_NEWLINE="true" 
#SPACESHIP_CHAR_SYMBOL=" \uf0e7" 
#SPACESHIP_CHAR_PREFIX="\uf296" 
#SPACESHIP_CHAR_SUFFIX=(" ") 
#SPACESHIP_CHAR_COLOR_SUCCESS="yellow" 
SPACESHIP_PROMPT_DEFAULT_PREFIX="$USER" 
SPACESHIP_PROMPT_FIRST_PREFIX_SHOW="true" 
SPACESHIP_USER_SHOW="true"

export LS_COLORS="di=34;40:ln=36;40:so=35;40:pi=33;40:ex=32;40:bd=1;33;40:cd=1;33;40:su=0;41:sg=0;43:tw=0;42:ow=34;40:"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

#DOCKER_DISTRO="Debian"
#DOCKER_DIR=/mnt/wsl/shared-docker
#DOCKER_SOCK="$DOCKER_DIR/docker.sock"
#export DOCKER_HOST="unix://$DOCKER_SOCK"
#if [ ! -S "$DOCKER_SOCK" ]; then
#    mkdir -pm o=,ug=rwx "$DOCKER_DIR"
#    chgrp docker "$DOCKER_DIR"
#    /mnt/c/Windows/System32/wsl.exe -d $DOCKER_DISTRO sh -c "nohup sudo -b dockerd < /dev/null > $DOCKER_DIR/dockerd.log 2>&1"
#fi

alias vim='nvim'
alias vi='nvim'
alias nv='nv.sh'
alias browse='explorer.exe .'

alias settings='cd $HOME/git/linux-settings'

if [ -z "SSH_AUTH_SOCK" ] ; then
  eval `ssh-agent -s`
  eval `ssh-add`
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
