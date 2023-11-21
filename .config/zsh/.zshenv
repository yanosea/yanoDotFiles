#
# .zshenv
#

[[ -f ./.zshrc ]] && . ./.zshrc

# Edited By yanosea

# OS
export OS=$(uname)
if [ "$OS" = "Linux" ]; then
    export USBINPATH=/usr/sbin
elif [ "$OS" = "Darwin" ]; then
    export USBINPATH=/opt/homebrew/bin
fi

# XDG CONFIG
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share
export XDG_STATE_HOME=$HOME/.local/state

# EDITOR
export VISUAL="$USBINPATH"/nvim
export EDITOR="$USBINPATH"/nvim

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

## brew
export HOMEBREW_NO_INSTALL_FROM_API=1

## go
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

## cargo
. $HOME/.cargo/env

## volta
export VOLTA_HOME=$HOME/.volta
export PATH=$PATH:$VOLTA_HOME/bin

## pnpm
export PNPM_HOME=$XDG_DATA_HOME/pnpm

## python
export PYENV_ROOT=$HOME/.pyenv
export PATH=$PATH:$PYENV_ROOT/bin
eval "$($USBINPATH/pyenv init -)"

## fzf
if [ "$OS" = "Linux" ]; then
    source /usr/share/fzf/key-bindings.zsh
    source /usr/share/fzf/completion.zsh
elif [ "$OS" = "Darwin" ]; then
    source $HOME/work/bin/key-bindings.zsh
    source $HOME/work/bin/completion.zsh
fi

# cabal
export CABAL_CONFIG="$XDG_CONFIG_HOME"/cabal/config
export CABAL_DIR="$XDG_CACHE_HOME"/cabal

## OTHER
export PATH=$PATH:$HOME/.local/bin

## homebrew
if [ "$OS" = "Linux" ]; then
    eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
elif [ "$OS" = "Darwin" ]; then
    eval $(/opt/homebrew/bin/brew shellenv)
fi

# PREFERENCES
## PKG_CONFIG_PATH
export PKG_CONFIG_PATH=/usr/lib/pkgconfig:/usr/share/pkgconfig

## GITHUB_TOKEN
export GITHUB_TOKEN=`cat $HOME/work/credentials/GITHUB_TOKEN`

## OPENAI_API_KEY
export OPENAI_API_KEY=`cat $HOME/work/credentials/OPENAI_API_KEY`

## SPOTIFY
### ID
export SPOTIFY_ID=`cat $HOME/work/credentials/SPOTIFY_ID`
### SECRET
export SPOTIFY_SECRET=`cat $HOME/work/credentials/SPOTIFY_SECRET`
### REDIRECT_URI
export SPOTIFY_REDIRECT_URI=`cat $HOME/work/credentials/SPOTIFY_REDIRECT_URI`
### REFRSH_TOKEN
export SPOTIFY_REFRESH_TOKEN=`cat $HOME/work/credentials/SPOTIFY_REFRESH_TOKEN`
