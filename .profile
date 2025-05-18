# .profile
# @author nate zhou
# @since 2023,2024,2025
# bash specific profile

. $HOME/.config/shell/profile.sh

[[ -n "$BASH_VERSION" && -f "$HOME/.bashrc" ]] && . "$HOME/.bashrc"

[ -d "$XDG_STATE_HOME"/bash ] || mkdir -p $XDG_STATE_HOME/bash
export HISTFILE="$XDG_STATE_HOME/bash/history"
