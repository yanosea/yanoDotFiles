if status is-interactive

    # Commands to run in interactive sessions can go here

    # Edited By yanosea

    # alias
    alias ls='/usr/sbin/lsd'
    alias cat='/usr/sbin/bat'
    alias rm='/usr/sbin/trash'
    alias shutdown='sudo systemctl poweroff'
    alias reboot='sudo systemctl reboot'

    # theme
    set -g theme_color_scheme nord
    set -g theme_display_date yes
    set -g theme_date_format "+%F %H:%M:%S"
    set -g theme_display_git_default_branch yes
    set -g theme_nerd_fonts yes

end
