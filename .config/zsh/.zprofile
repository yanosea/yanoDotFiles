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
export HISTFILE=$XDG_STATE_HOME/zsh/.histfile

## less
export LESSHISTFILE=$XDG_STATE_HOME/less/.lesshst

## node
export NODE_REPL_HISTORY=$XDG_STATE_HOME/node/.node_repl_history

# PATH
## MY PROGRAM
export PATH=$PATH:$HOME/work/bin

## go
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

## cargo
. $HOME/.cargo/env

## volta
export VOLTA_HOME=$HOME/.volta
export PATH=$PATH:$VOLTA_HOME/bin

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

# FISH START
exec fish
