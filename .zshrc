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

if [ -z "SSH_AUTH_SOCK" ] ; then
	eval `ssh-agent -s`
	eval `ssh-add`
fi

export PATH="$HOME/.local/bin:$PATH"

export LS_COLORS=$LS_COLORS:'ow=4;36:';

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
