#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

# Edited By yanosea

# EDITOR
export VISUAL=/usr/sbin/nvim
export EDITOR=/usr/sbin/nvim

# HISTFILE
## bash
export HISTFILE="$XDG_STATE_HOME"/bash/.bash_history

## less
export LESSHISTFILE="$XDG_STATE_HOME"/less/.lesshst

## node
export NODE_REPL_HISTORY="$XDG_STATE_HOME"/node/.node_repl_history

# PATH
## MY PROGRAM
export PATH=$PATH:$HOME/work/bin

## go
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

## cargo
. "$HOME/.cargo/env"

## fzf
source /usr/share/fzf/key-bindings.bash
source /usr/share/fzf/completion.bash

## homebrew
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# FISH START
exec fish
