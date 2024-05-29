#
# .zshrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PROMPT='[%n@%m %~]$ '

# edited by yanosea

# zellij
if command -v zellij &>/dev/null; then
	if [ -z "$INSIDE_ZELLIJ" ]; then
		export INSIDE_ZELLIJ=1
		exec zellij
	fi
fi
# homebrew
if [[ "$OS" = "Darwin" ]]; then
	eval $(/opt/homebrew/bin/brew shellenv)
elif [[ "$OS" = "Linux" ]]; then
	if [[ "$ID" = "arch" ]]; then
		eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
	fi
fi
# sheldon
eval "$(sheldon source)"
# zoxide
eval "$(zoxide init zsh)"
# python
eval "$($USBINPATH/pyenv init -)"
# alias
alias cat="$USBINPATH"/bat
alias ls="$USBINPATH"/lsd
alias nvimdiff="$USBINPATH/nvim -d"
alias reboot="sudo systemctl reboot"
alias rm="$USBINPATH"/trash
alias rrm="/bin/rm"
alias shutdown="sudo systemctl poweroff"
alias zmv="noglob zmv -W"
alias st="systemctl-tui"
alias trl="trello-tui -board yanoBoard"
## directories
alias repos="cd $HOME/ghq/github.com/yanosea"
alias dot="cd $HOME/ghq/github.com/yanosea/yanoDotFiles"
alias work="cd $WORKSPACE"
# history
HISTFILE=$XDG_STATE_HOME/zsh/.zhistory
HISTSIZE=1000
SAVEHIST=10000
# zshopt
## easy cd
setopt auto_cd
## choose completion with tab
setopt auto_menu
## add slash
setopt auto_param_slash
## completion in typing
setopt complete_in_word
## beep off
setopt no_beep
## correct typo
setopt correct
## enable glob
setopt extendedglob nomatch
## glob with dot
setopt globdots
## ignore history start with space
setopt hist_ignore_space
## disable C-d
setopt IGNORE_EOF
## show file type
setopt list_types
## completion with equal
setopt magic_equal_subst
## add slash
setopt mark_dirs
## notify background job status
setopt notify
## Japanese file name
setopt print_eight_bit
## choose completion with arrow keys
zstyle ":completion:*:default" menu select=2
## upper case or lowercase
zstyle ":completion:*" matcher-list "m:{a-z}={A-Z}"
## zmv
autoload -Uz zmv
