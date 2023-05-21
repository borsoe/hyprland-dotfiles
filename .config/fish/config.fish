
set -U fish_greeting
set -g theme_date_format "+%H:%M"
set -g theme_title_display_user yes
set -g theme_title_display_process yes
set -g theme_nerd_fonts yes
set -g theme_color_scheme dracula 
if status is-interactive
    # Commands to run in interactive sessions can go here
    neofetch
    autojump > /dev/null 2>&1
end


#   █████╗ ██╗     ██╗ █████╗ ███████╗███████╗███████╗
#  ██╔══██╗██║     ██║██╔══██╗██╔════╝██╔════╝██╔════╝
#  ███████║██║     ██║███████║███████╗█████╗  ███████╗
#  ██╔══██║██║     ██║██╔══██║╚════██║██╔══╝  ╚════██║
#  ██║  ██║███████╗██║██║  ██║███████║███████╗███████║
#  ╚═╝  ╚═╝╚══════╝╚═╝╚═╝  ╚═╝╚══════╝╚══════╝╚══════╝

alias ll="ls -l"
alias lla="ls -a -l"
alias get="paru"
