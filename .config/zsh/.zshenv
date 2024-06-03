#
# .zshenv
#

[[ -f ./.zshrc ]] && . ./.zshrc

# edited by yanosea

# os
export OS=$(uname)
# xdg config
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share
export XDG_STATE_HOME=$HOME/.local/state
# editor
if command -v lvim >/dev/null 2>&1; then
	export VISUAL="lvim"
	export EDITOR="lvim"
elif command -v nvim >/dev/null 2>&1; then
	export VISUAL="nvim"
	export EDITOR="nvim"
elif command -v vim >/dev/null 2>&1; then
	export VISUAL="vim"
	export EDITOR="vim"
else
	export VISUAL="vi"
	export EDITOR="vi"
fi
# term
export TERM=xterm-256color
# histfiles
## less
export LESSHISTFILE=$XDG_STATE_HOME/less/.lesshst
## node
export NODE_REPL_HISTORY=$XDG_STATE_HOME/node/.node_repl_history
# homebrew
export HOMEBREW_NO_INSTALL_FROM_API=1
# google drive
export GOOGLE_DRIVE=$HOME/GoogleDrive
# path
## usbinpath
if [[ "$OS" = "Darwin" ]]; then
	export USBINPATH=/opt/homebrew/bin
elif [[ "$OS" = "Linux" ]]; then
	source /etc/os-release
	if [[ "$ID" = "arch" ]]; then
		export USBINPATH=/usr/bin
	elif [[ "$ID" = "nixos" ]]; then
		export USBINPATH=/run/current-system/sw/bin
	fi
fi
## local
export PATH=$PATH:$HOME/.local/bin
export WORKSPACE=$HOME/ghq/github.com/yanosea/yanoLocalEnv
export PATH=$PATH:$WORKSPACE/bin
## zsh functions
### common
for file in $XDG_CONFIG_HOME/zsh/functions/*; do
	if [ -f "$file" ]; then
		source "$file"
	fi
done
### wsl
if [[ -n "${WSL_DISTRO_NAME:-}" ]]; then
	export PATH=$PATH:/mnt/c/Windows
	export PATH=$PATH:/mnt/c/Windows/System32
	for file in $XDG_CONFIG_HOME/zsh/functions_win/*; do
		source "$file"
	done
fi
## go
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
## cargo
export PATH=$PATH:$HOME/.cargo/bin
## volta
export VOLTA_HOME=$HOME/.volta
export PATH=$PATH:$VOLTA_HOME/bin
## pnpm
export PNPM_HOME=$XDG_DATA_HOME/pnpm
## python
export PYENV_ROOT=$HOME/.pyenv
export PATH=$PATH:$PYENV_ROOT/bin
# cabal
export CABAL_CONFIG="$XDG_CONFIG_HOME"/cabal/config
export CABAL_DIR="$XDG_CACHE_HOME"/cabal
## ghq
export GHQ_ROOT="$HOME"/ghq
## pkg config path
if [[ "$OS" = "Linux" && "$ID" = "arch" ]]; then
	export PKG_CONFIG_PATH=/usr/lib/pkgconfig:/usr/share/pkgconfig
fi
# credentials
## openai
export OPENAI_API_KEY=$(cat $XDG_DATA_HOME/credentials/OPENAI_API_KEY)
## gemini
export GEMINI_API_KEY=$(cat $XDG_DATA_HOME/credentials/GEMINI_API_KEY)
## spotify
export SPOTIFY_ID=$(cat $XDG_DATA_HOME/credentials/SPOTIFY_ID)
export SPOTIFY_SECRET=$(cat $XDG_DATA_HOME/credentials/SPOTIFY_SECRET)
export SPOTIFY_REDIRECT_URI=$(cat $XDG_DATA_HOME/credentials/SPOTIFY_REDIRECT_URI)
export SPOTIFY_REFRESH_TOKEN=$(cat $XDG_DATA_HOME/credentials/SPOTIFY_REFRESH_TOKEN)
## trello
export TRELLO_USER=$(cat $XDG_DATA_HOME/credentials/TRELLO_USER)
export TRELLO_KEY=$(cat $XDG_DATA_HOME/credentials/TRELLO_KEY)
export TRELLO_TOKEN=$(cat $XDG_DATA_HOME/credentials/TRELLO_TOKEN)
# starship
export STARSHIP_CONFIG=$XDG_CONFIG_HOME/starship/starship.toml
# karabiner and goku
if [[ "$OS" = "Darwin" ]]; then
	export GOKU_EDN_CONFIG_FILE=$XDG_CONFIG_HOME/karabiner/karabiner.edn
fi
