#set -gx fish_user_paths "$HOME/.rye/shims"
source (/usr/bin/starship init fish --print-full-init | psub)
set -Ua fish_user_paths "$HOME/.rye/shims"
umask 002
ufetch

# Automatically start or attach to tmux in interactive shells
# if status is-interactive
#     and not set -q TMUX
#     # Check if there are existing tmux sessions
#     if tmux has-session 2>/dev/null
#         exec tmux -u attach-session
#     else
#         exec tmux -uf /home/dez/.config/tmux/tmux.conf
#     end
# end
