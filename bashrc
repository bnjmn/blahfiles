#!/usr/bin/env bash
# bash run commands

get_dotfiles_dir () {
    # http://stackoverflow.com/a/246128
    local source="${BASH_SOURCE[1]}"
    while [ -h "$source" ]; do
        local dir="$( cd -P "$( dirname "$source" )" && pwd )"
        local source="$(readlink "$source")"
        [[ $source != /* ]] && source="$dir/$source"
    done
    local bash_dir="$( cd -P "$( dirname "$source" )" && pwd )"

    local dotfiles_dir="$( dirname $bash_dir)"
    echo "$dotfiles_dir"
}

DOTFILES_DIR=$(get_dotfiles_dir)

PATH=/usr/local/bin:$PATH
PATH="$DOTFILES_DIR/bin":$PATH

# heroku toolbelt, stop adding yourself please
if [ -d /usr/local/heroku/bin ]; then
    PATH="/usr/local/heroku/bin:$PATH"
fi

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

alias npm-exec='PATH=$(npm bin):$PATH'


# If virtualenvwrapper is installed
if [[ "$(type -P virtualenvwrapper.sh)" ]]; then
    # virtualenvwrapper for non-login shells as well
    export WORKON_HOME=$HOME/.venvs
    export PROJECT_HOME=$HOME/code
    source /usr/local/bin/virtualenvwrapper.sh
fi
# Make virtualenv list brief
alias lsvirtualenv='lsvirtualenv -b'

# GRUNT Work
# TODO: check for grunt first
eval "$(grunt --completion=bash)"

[ -f $HOME/.travis/travis.sh ] && source $HOME/.travis/travis.sh

export NVM_DIR=~/.nvm

# TODO: don't depend on brew
source $(brew --prefix nvm)/nvm.sh

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# If not running interactively, exit here
[ -z "$PS1" ] && return



shopt -s histappend     # append history rather than overwrite
shopt -s checkwinsize   # update LINES and COLUMNS after each command
# `**` match all recusively, only bash ver. >= 4, thanks OS X
[ ! "${BASH_VERSINFO}" -lt 4 ] && shopt -s globstar

HISTSIZE=100000
HISTFILESIZE=200000
HISTCONTROL=ignoreboth


# set command line to vi mode (default is emacs)
set -o vi
export EDITOR=vim
export VISUAL="$EDITOR"
# TODO: check for nvim 
alias vim="nvim"
alias vi='vim'

# Bash Completion is quite helpful when available
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

PIP_REQUIRE_VIRTUALENV=true
PIP_DOWNLOAD_CACHE=$HOME/.pip/cache

# pip bash completion start
_pip_completion()
{
    COMPREPLY=( $( COMP_WORDS="${COMP_WORDS[*]}" \
                   COMP_CWORD=$COMP_CWORD \
                   PIP_AUTO_COMPLETE=1 $1 ) )
}
complete -o default -F _pip_completion pip
# pip bash completion end


# ----------------------------------------------------------------------
#  ALIASES
# ----------------------------------------------------------------------

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# ls aliases
alias ll='ls -alF'
alias la='ls -A'        # list almost-all
alias l='ls -CF'        # list by column and classify
alias lh='ls -Alh'      # list with sizes for humans
alias l.='ls -d .*'     # list hidden files/dirs only
alias ll.='ls -dlF .*'  # list long hidden 

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
# TODO: this doesn't work on mac
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Quick source bashrc
alias srcbash='. $HOME/.bashrc && echo "BASHRC sourced"'

# Remove all symbolic links in current directory
#alias rmsymlinks='find . -maxdepth 1 -type l -exec rm {} \;'

# Recursively rm vim swp files with confirmation
alias remove-swp-files='find . -name *.swp -exec rm -i '{}' \;'

# Confirm overwrite when file exists
#alias mv='mv --interactive'
alias mv='mv -i'


# --------------------------------------------------------------------
# PATH MANIPULATION FUNCTIONS - by Ryan Tomayko
# --------------------------------------------------------------------

# Usage: pls [<var>]
# List path entries of PATH or environment variable <var>.
pls () { eval echo \$${1:-PATH} |tr : '\n'; }

# Usage: prm <path> [<var>]
# Remove <path> from PATH or environment variable <var>.
prm () { eval "${2:-PATH}='$(pls $2 |grep -v "^$1\$" |tr '\n' :)'"; }

# Usage: ppush <path> [<var>]
ppush () { eval "${2:-PATH}='$(eval echo \$${2:-PATH})':$1"; }

# Usage: puniq [<path>]
# Remove duplicate entries from a PATH style value while retaining
# the original order. Use PATH if no <path> is given.
puniq () {
    echo "$1" |tr : '\n' |nl |sort -u -k 2,2 |sort -n |
    cut -f 2- |tr '\n' : |sed -e 's/:$//' -e 's/^://'
}

# this is awesome
PATH=$(puniq $PATH)


# ----------------------------------------------------------------------
# PROMPT 
# ----------------------------------------------------------------------

# ----- Define COLORS ----- #
RED="\[\033[01;31m\]"
BROWN="\[\033[0;33m\]"
GREY="\[\033[0;97m\]"
BLUE="\[\033[01;34m\]"
GREEN="\[\033[01;32m\]"
BLACK="\[\033[0;30m\]"
CYAN="\[\033[0;36m\]"
PURPLE="\[\033[0;35m\]"
PS_CLEAR="\[\033[0m\]"
SCREEN_ESC="\[\033k\033\134\]"


if [ "$LOGNAME" = "root" ]; then
    COLOR1="${RED}"
    COLOR2="${BROWN}"
    P="#"
elif hostname | grep -q 'ip-'; then
    COLOR1="${BLUE}"
    COLOR2="${GREEN}"
    P="*"
else
    COLOR1="${BLUE}"
    COLOR2="${BROWN}"
    P="\$"
fi

prompt_simple() {
    unset PROMPT_COMMAND
    PS1="[\u@\h:\w]\$ "
    PS2="> "
}

prompt_compact() {
    unset PROMPT_COMMAND
    PS1="${COLOR1}${P}${PS_CLEAR} "
    PS2="> "
}

GIT_PS1_SHOWDIRTYSTATE=1
PS1_PWD_MAX=15
prompt_color() {
    #PS1="${GREY}[${COLOR1}\u${GREY}@${COLOR2}\h${GREY}:${COLOR1}\W${GREY}]${COLOR2}$P${PS_CLEAR} "
    #PS2="\[[33;1m\] \[[0m[1m\]> "
    __pwd_ps1() { echo -n $PWD | sed -e "s|${HOME}|~|" -e "s|\(/[^/]*/\).*\(/.\{${PS1_PWD_MAX}\}\)|\1...\2|"; }
    PS1='\[\033[01;34m\]$(__pwd_ps1)$(__git_ps1 " \[\033[01;31m\](%s)")$\[\033[00m\] '
    PS2="> "
}

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi
prompt_old() {
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
}

# Use the color prompt by default when interactive
test -n "$PS1" &&
prompt_color





### Experiments in OSX, or leave
[[ "$OSTYPE" =~ ^darwin ]] || return 1

alias ls='gls --group-directories-first --color=auto'

# up the user-system-wide resource limit
ulimit -n 1024

# TODO: remove dep on brew
if [ -f `brew --prefix`/etc/bash_completion ]; then
    . `brew --prefix`/etc/bash_completion
fi

export TERM=xterm-256color
export GREP_OPTIONS='--color=auto' GREP_COLOR='1;32'
export CLICOLOR=1

export LSCOLORS=ExGxFxDxCxHxHxCbCeEbEb
export LC_CTYPE=en_US.utf-8
export LC_ALL=en_US.utf-8

# Up and down search based on what was typed in so far
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'

echo "BLAHFILES"
