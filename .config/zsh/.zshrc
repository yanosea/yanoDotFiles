#
# .zshrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PROMPT='[%n@%m %~]$ '

# Edited By yanosea

# sheldon
eval "$(sheldon source)"

# zoxide
eval "$(zoxide init zsh)"

# alias
alias cat=bat
alias ls=lsd
alias nvimdiff='nvim -d'
alias reboot='sudo systemctl reboot'
alias rm=trash
alias shutdown='sudo systemctl poweroff'
alias zmv='noglob zmv -W'
alias dot="cd $HOME/dotfiles"
alias work="cd $HOME/work"

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
zstyle ':completion:*:default' menu select=2
## upper case or lowercase
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
## zmv
autoload -Uz zmv

# Powerlevel10k
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
[[ ! -f $XDG_CONFIG_HOME/zsh/.p10k.zsh ]] || source $XDG_CONFIG_HOME/zsh/.p10k.zsh
