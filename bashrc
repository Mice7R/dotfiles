# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoredups

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=10000
HISTFILESIZE=20000
HISTIGNORE=

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto --quoting-style=literal'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    #alias fgrep='fgrep --color=auto'
    #alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -lFh'
alias la='ls -A'
#alias l='ls -CF'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# liquidpromt
. /opt/liquidprompt/liquidprompt

# Local bin
if [[ -d "$HOME/.local/bin" ]]; then
    export PATH=$HOME/.local/bin:$PATH
fi
if [[ -d "$HOME/.bin" ]]; then
    export PATH=$HOME/.bin:$PATH
fi

# DOTNET STUFF
export DOTNET_CLI_TELEMETRY_OPTOUT=1

# GO
export GOROOT=$HOME/.go/go
export GOPATH=$HOME/.go/packages
if [[ -d "$GOROOT/bin" ]]; then
    [[ -d "$GOPATH/bin" ]] || mkdir -p "$GOPATH"
    export PATH=$PATH:$GOROOT/bin:$GOPATH/bin
fi

# Python virtualenv
if [[ -z "$VIRTUAL_ENV" ]]; then
    _virtualenv=$(which virtualenvwrapper.sh)
    if [[ -s $_virtualenv && -x $_virtualenv ]]; then
        export WORKON_HOME=$HOME/.env
        mkdir -p "$WORKON_HOME"
        export VIRTUALENVWRAPPER_PYTHON=$(which python3)  # its python3
        source $_virtualenv
    fi
    unset _virtualenv
fi

# RUST
if [[ -d "$HOME/.cargo" && -d "$HOME/.rustup" ]]; then
    export PATH=$PATH:$HOME/.cargo/bin
fi

# gopass
if [[ $(type gopass 2>/dev/null) && ! -z "$(gopass completion bash)" ]]; then
    source <(gopass completion bash)
fi
