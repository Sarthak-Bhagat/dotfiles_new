set -gx fish_user_paths "$HOME/.rye/shims"
source (/usr/bin/starship init fish --print-full-init | psub)
