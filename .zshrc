if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(git z)

source $ZSH/oh-my-zsh.sh

export LANG=en_US.UTF-8

export EDITOR="nvim"

export ZSH="$HOME/.oh-my-zsh"

alias cat='bat --theme="base16"'

alias ll='ls -alh'

alias vim='nvim'
alias vi='nvim'
alias nv='nv.sh'
alias browse='explorer.exe .'

if [ -z "SSH_AUTH_SOCK" ] ; then
	eval `ssh-agent -s`
	eval `ssh-add`
fi

export JAVA_HOME="/usr/lib/jvm/java-8-openjdk-amd64/"
export PATH="$HOME/.local/bin:$PATH:/usr/local/go/bin/:$HOME/go/bin/"

export LS_COLORS=$LS_COLORS:'ow=4;36:';

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# To customize prompt, run `p10k configure` or edit ~/linux-settings/.p10k.zsh.
[[ ! -f ~/linux-settings/.p10k.zsh ]] || source ~/linux-settings/.p10k.zsh

alias luamake=/home/kconston/.local/share/lua-language-server/3rd/luamake/luamake
alias work=/mnt/e/Projects/Work_Stuff

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

eval "$(direnv hook zsh)"

export PATH="$HOME/.poetry/bin:$PATH"
