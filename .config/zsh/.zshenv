#
# .zprofile
#

[[ -f ./.zshrc ]] && . ./.zshrc

# Edited By yanosea

# EDITOR
export VISUAL=/usr/sbin/nvim
export EDITOR=/usr/sbin/nvim

# TERM
export TERM=xterm-256color

# HISTFILES
## less
export LESSHISTFILE=$XDG_STATE_HOME/less/.lesshst

## node
export NODE_REPL_HISTORY=$XDG_STATE_HOME/node/.node_repl_history

# PATH
## MY PROGRAM
export PATH=$PATH:$HOME/work/bin
source $XDG_CONFIG_HOME/zsh/functions/*

## go
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

## cargo
. $HOME/.cargo/env

## volta
export VOLTA_HOME=$HOME/.volta
export PATH=$PATH:$VOLTA_HOME/bin

## python
export PYENV_ROOT=$HOME/.pyenv
export PATH=$PATH:$PYENV_ROOT/bin
eval "$(pyenv init -)"

## fzf
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh

## OTHER
export PATH=$PATH:$HOME/.local/bin

## homebrew
eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)

# PREFERENCES
## PKG_CONFIG_PATH
export PKG_CONFIG_PATH=/usr/lib/pkgconfig:/usr/share/pkgconfig

## GITHUB_TOKEN
export GITHUB_TOKEN=`cat $HOME/work/credentials/GITHUB_TOKEN`

## OPENAI_API_KEY
export OPENAI_API_KEY=`cat $HOME/work/credentials/OPENAI_API_KEY`
