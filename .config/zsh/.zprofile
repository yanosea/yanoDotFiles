#
# ~/.zprofile
#

[[ -f ./.zshrc ]] && . ./.zshrc

# Edited By yanosea

# ZSH
setopt autocd beep extendedglob nomatch notify

# EDITOR
export VISUAL=/usr/sbin/nvim
export EDITOR=/usr/sbin/nvim

# HISTFILE
## zsh
export HISTFILE="$XDG_STATE_HOME"/zsh/.histfile

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
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh

## homebrew
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# FISH START
exec fish
