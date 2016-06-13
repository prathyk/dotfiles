# this file is sourced by non-login interactive shells and ~/.bash_profile

# path setup
source ~/.config/shell/path-edit.sh
path_front ~/bin /usr/local/sbin /usr/local/bin
path_back /sbin /bin /usr/sbin /usr/bin

# completion setup
source ~/.config/shell/git-completion.bash

# run setup
source ~/.config/shell/run.sh

# show a fortune
source ~/.config/shell/fortune.sh

# cd options
shopt -s autocd cdspell dirspell

# glob options
shopt -s dotglob extglob globstar nocaseglob

# job options
shopt -s checkjobs huponexit

# shell options
shopt -s checkhash checkwinsize

# history
shopt -s cmdhist histappend histverify

HISTCONTROL=ignoreboth
# Unset for unlimited history
HISTSIZE=
HISTFILESIZE=
# Use separate history file to avoid truncation
HISTFILE=~/.local/shell/bash_history

# prompt setup
source ~/.config/shell/git-prompt.sh
PROMPT_DIRTRIM=2

GIT_PS1_SHOWDIRTYSTATE=1
GIT_PS1_SHOWUNTRACKEDFILES=1
GIT_PS1_SHOWCOLORHINTS=1
GIT_PS1_SHOWUPSTREAM=auto

set_prompt () {
    local last_command=$?
    PS1=''

    # save after every command
    history -a

    # color escape codes
    local color_off='\[\e[0m\]'
    local color_red='\[\e[0;31m\]'
    local color_green='\[\e[0;32m\]'
    local color_yellow='\[\e[0;33m\]'
    local color_blue='\[\e[0;34m\]'
    local color_purple='\[\e[0;35m\]'
    local color_cyan='\[\e[0;36m\]'

    # add purple exit code if non-zero
    if [[ $last_command != 0 ]]; then
        PS1+=$color_purple
        PS1+='$? '
        PS1+=$color_off
    fi

    # shortened working directory
    PS1+='\w '

    # add Git status with color hints
    PS1+="$(__git_ps1 '%s ')"

    # red for root, off for user
    if [[ $EUID == 0 ]]; then
        PS1+=$color_red
    else
        PS1+=$color_off
    fi

    # end of prompt
    PS1+='|-'
    PS1+=$color_red
    PS1+='/ '
    PS1+=$color_off
}
PROMPT_COMMAND='set_prompt'

# aliases
source ~/.config/shell/aliases.sh

# enable ls colors
if ls --color=auto &> /dev/null; then
    alias ls='ls --color=auto'
else
    export CLICOLOR=1
fi

# tag ag's matches
if hash tag 2>/dev/null; then
    tag() {
        TAG_CMD_FMT_STRING='e +{{.LineNumber}} {{.Filename}}' command tag "$@"
        source ${TAG_ALIAS_FILE:-/tmp/tag_aliases} 2>/dev/null
    }
    alias ag='tag'
fi

# uses 'thefuck' to fix common command mistakes
# https://github.com/nvbn/thefuck
alias fuck='eval $(thefuck $(fc -ln -1)); history -r'

# add FZF completions
if [[ -r ~/.fzf.bash ]]; then
    source ~/.fzf.bash
fi

# colored man pages
man() {
    env LESS_TERMCAP_mb=$'\E[01;31m' \
        LESS_TERMCAP_md=$'\E[01;38;5;74m' \
        LESS_TERMCAP_me=$'\E[0m' \
        LESS_TERMCAP_se=$'\E[0m' \
        LESS_TERMCAP_so=$'\E[38;5;246m' \
        LESS_TERMCAP_ue=$'\E[0m' \
        LESS_TERMCAP_us=$'\E[04;38;5;146m' \
        man "$@"
}

# disable flow control
stty -ixon

# source tokens
if [[ -r ~/.config/shell/tokens.sh ]]; then
    source ~/.config/shell/tokens.sh
fi

# source local configurations
if [[ -r ~/.config/shell/local.sh ]]; then
    source ~/.config/shell/local.sh
fi
