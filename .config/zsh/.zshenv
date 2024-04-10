#
# .zshenv
#

[[ -f ./.zshrc ]] && . ./.zshrc

# edited by yanosea

# os
export OS=$(uname)
if [[ -n "$WSL_DISTRO_NAME" ]]; then
    export PATH=$PATH:/mnt/c/Windows
    export PATH=$PATH:/mnt/c/Windows/System32
    for file in $XDG_CONFIG_HOME/zsh/functions_win/*; do
        if [ -f "$file" ]; then
            source "$file"
        fi
    done
    if [[ "$WSL_DISTRO_NAME" = "Arch" ]]; then
        export USBINPATH=/usr/sbin
    elif [[ "$WSL_DISTRO_NAME" = "NixOS" ]]; then
        export USBINPATH=/run/current-system/sw/bin
    fi
elif [[ "$OS" = "Darwin" ]]; then
    export USBINPATH=/opt/homebrew/bin
fi
# xdg config
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share
export XDG_STATE_HOME=$HOME/.local/state
# google drive
export GOOGLE_DRIVE=$HOME/GoogleDrive
# editor
export VISUAL="$USBINPATH"/nvim
export EDITOR="$USBINPATH"/nvim
# term
export TERM=xterm-256color
# histfiles
## less
export LESSHISTFILE=$XDG_STATE_HOME/less/.lesshst
## node
export NODE_REPL_HISTORY=$XDG_STATE_HOME/node/.node_repl_history
# credentials
## openapi
export OPENAI_API_KEY=`cat $HOME/.local/credentials/OPENAI_API_KEY`
## gemini
export GEMINI_API_KEY=`cat $HOME/.local/credentials/GEMINI_API_KEY`
## brew
export HOMEBREW_NO_INSTALL_FROM_API=1
## spotify
export SPOTIFY_ID=`cat $HOME/.local/credentials/SPOTIFY_ID`
export SPOTIFY_SECRET=`cat $HOME/.local/credentials/SPOTIFY_SECRET`
export SPOTIFY_REDIRECT_URI=`cat $HOME/.local/credentials/SPOTIFY_REDIRECT_URI`
export SPOTIFY_REFRESH_TOKEN=`cat $HOME/.local/credentials/SPOTIFY_REFRESH_TOKEN`
# path
## local
export PATH=$PATH:$HOME/.local/bin
export WORKSPACE=$HOME/ghq/github.com/yanosea/yanoLocalEnv
export PATH=$PATH:$WORKSPACE/bin
## zsh functions
for file in $XDG_CONFIG_HOME/zsh/functions/*; do
    if [ -f "$file" ]; then
        source "$file"
    fi
done
## go
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
## cargo
if [[ -n "$WSL_DISTRO_NAME" && "$WSL_DISTRO_NAME" = "NixOS" ]]; then
    export PATH=$PATH:$HOME/.cargo/bin
else
    . $HOME/.cargo/env
fi
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
if [[ -n "$WSL_DISTRO_NAME" ]]; then
    if [[ "$WSL_DISTRO_NAME" = "Arch" ]]; then
        source /usr/share/fzf/key-bindings.zsh
        source /usr/share/fzf/completion.zsh
    elif [[ "$WSL_DISTRO_NAME" = "NixOS" ]]; then
        TARGET_PATH=$(readlink -f $(which fzf))
        ORIGINAL="/bin/fzf"
        REPLACEMENT="/share/fzf"
        FZF_PATH=${TARGET_PATH//$ORIGINAL/$REPLACEMENT}
        source $FZF_PATH/key-bindings.zsh
        source $FZF_PATH/completion.zsh
    fi
fi
# cabal
export CABAL_CONFIG="$XDG_CONFIG_HOME"/cabal/config
export CABAL_DIR="$XDG_CACHE_HOME"/cabal
# homebrew
export HOMEBREW_NO_INSTALL_FROM_API=1
if [[ -n "$WSL_DISTRO_NAME" ]]; then
    if [[ "$WSL_DISTRO_NAME" = "Arch" ]]; then
        eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
    fi
elif [[ "$OS" = "Darwin" ]]; then
    eval $(/opt/homebrew/bin/brew shellenv)
fi
## ghq
export GHQ_ROOT="$HOME"/ghq
## pkg config path
if [[ -n "$WSL_DISTRO_NAME" && "$WSL_DISTRO_NAME" = "Arch" ]]; then
    export PKG_CONFIG_PATH=/usr/lib/pkgconfig:/usr/share/pkgconfig
fi
# oatmeal
export OATMEAL_OPENAI_TOKEN=$OPENAI_API_KEY
export OATMEAL_GEMINI_TOKEN=$GEMINI_API_KEY
# bitwarden
export BW_SESSION=`cat $HOME/.local/credentials/BW_SESSION`
