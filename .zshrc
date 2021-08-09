# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

ZSH_THEME="powerlevel10k/powerlevel10k"
plugins=(git zsh-autosuggestions)

export PATH="$HOME/.poetry/bin:$HOME/.local/bin:/usr/local/go/bin:$HOME/git/lazygit:$HOME/go/bin:$PATH"
export EDITOR=ewrap
export ZSH="/home/kconston/.oh-my-zsh"

source $ZSH/oh-my-zsh.sh

export LS_COLORS="di=34;40:ln=36;40:so=35;40:pi=33;40:ex=32;40:bd=1;33;40:cd=1;33;40:su=0;41:sg=0;43:tw=0;42:ow=36:"
export LS_COLORS=$LS_COLORS:'ow=1;34:';
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

alias vim='nvim'
alias vi='nvim'
#alias nv='nv.sh'
alias browse='explorer.exe .'
alias gitdir="cd $HOME/git"
alias nvmupgrade=". $HOME/git/linux-settings/scripts/nvm_upgrade.sh"
alias settings='cd $HOME/git/linux-settings'
alias lazygit="$HOME/go/bin/lazygit"
alias lg=lazygit
alias down="cd $HOME/Downloads"
alias plugins="cd $HOME/git/linux-settings/lua/plugins"
alias ls='nnn -de'

if [ -z "SSH_AUTH_SOCK" ] ; then
  eval `ssh-agent -s`
  eval `ssh-add`
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export NVM_DIR="$HOME/git/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completionr

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/home/kconston/.sdkman"
[[ -s "/home/kconston/.sdkman/bin/sdkman-init.sh" ]] && source "/home/kconston/.sdkman/bin/sdkman-init.sh"

export PATH=/home/kconston/bin:$PATH

[[ -e "/home/kconston/lib/oracle-cli/lib/python3.7/site-packages/oci_cli/bin/oci_autocomplete.sh" ]] && source "/home/kconston/lib/oracle-cli/lib/python3.7/site-packages/oci_cli/bin/oci_autocomplete.sh"

# NNN
n ()
{
    # Block nesting of nnn in subshells
    if [ -n $NNNLVL ] && [ "${NNNLVL:-0}" -ge 1 ]; then
        echo "nnn is already running"
        return
    fi

    # The default behaviour is to cd on quit (nnn checks if NNN_TMPFILE is set)
    # To cd on quit only on ^G, remove the "export" as in:
    #     NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"
    # NOTE: NNN_TMPFILE is fixed, should not be modified
    export NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"

    # Unmask ^Q (, ^V etc.) (if required, see `stty -a`) to Quit nnn
    # stty start undef
    # stty stop undef
    # stty lwrap undef
    # stty lnext undef

    nnn "$@"

    if [ -f "$NNN_TMPFILE" ]; then
            . "$NNN_TMPFILE"
            rm -f "$NNN_TMPFILE" > /dev/null
    fi
}

eval "$(direnv hook zsh)"
