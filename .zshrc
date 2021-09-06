# adjust trackpoint speed

xinput --set-prop "TPPS/2 IBM TrackPoint" "libinput Accel Profile Enabled" 1, 0
xinput --set-prop "TPPS/2 IBM TrackPoint" "libinput Accel Speed" 0.1

alias ll="ls -l"
alias la="ls -la"

export EDITOR='nvim'
export VISUAL='nvim'

vipsql() {
    nvim -c 'setlocal ft=sql | VipsqlOpenSession '"$*" $(mktemp -t vipsql.XXXXX)
}

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=30000
setopt autocd extendedglob nomatch notify
unsetopt beep
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/steve/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
source ~/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/steve/miniconda/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/steve/miniconda/etc/profile.d/conda.sh" ]; then
        . "/home/steve/miniconda/etc/profile.d/conda.sh"
    else
        export PATH="/home/steve/miniconda/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

