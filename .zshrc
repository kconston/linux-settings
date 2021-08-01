sudo service docker status || sudo service docker start

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export EDITOR=nvim

export ZSH="/home/kconston/.oh-my-zsh"

# ZSH_THEME="spaceship"
ZSH_THEME="powerlevel10k/powerlevel10k"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

plugins=(git zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

export LS_COLORS="di=34;40:ln=36;40:so=35;40:pi=33;40:ex=32;40:bd=1;33;40:cd=1;33;40:su=0;41:sg=0;43:tw=0;42:ow=36:"
export LS_COLORS=$LS_COLORS:'ow=1;34:';
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

[ -d /mnt/wsl ] && export DOCKER_HOST="unix:///mnt/wsl/shared-docker/docker.sock"

alias vim='nvim'
alias vi='nvim'
#alias nv='nv.sh'
alias browse='explorer.exe .'
alias gitdir="cd $HOME/git"
alias nvmupgrade=". $HOME/git/linux-settings/scripts/nvm_upgrade.sh"
alias settings='cd $HOME/git/linux-settings'
#alias python=python3.9
alias lazygit="$HOME/go/bin/lazygit"
alias lg=lazygit
alias down="cd $HOME/Downloads"
alias plugins="cd $HOME/git/linux-settings/lua/plugins"

if [ -z "SSH_AUTH_SOCK" ] ; then
  eval `ssh-agent -s`
  eval `ssh-add`
fi

eval "$(direnv hook zsh)"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export NVM_DIR="$HOME/git/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completionr

export PATH="$HOME/.poetry/bin:$HOME/.local/bin:/usr/local/go/bin:$HOME/git/lazygit:$HOME/go/bin:$PATH"
