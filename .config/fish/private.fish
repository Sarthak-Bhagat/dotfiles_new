#set -gx fish_user_paths "$HOME/.rye/shims"
source (/usr/bin/starship init fish --print-full-init | psub)
set -Ua fish_user_paths "$HOME/.rye/shims"
umask 002
ufetch
#if status is-interactive
#    and not set -q TMUX
#    exec tmux -vvuf /home/dez/.config/tmux/tmux.conf
#end
