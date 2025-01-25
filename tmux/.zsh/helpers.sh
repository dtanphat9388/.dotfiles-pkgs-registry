#!/bin/bash
#shellcheck source=/dev/null

# TODO: handle nvim workspace
# syntax: _tmux_get_session_name_from_workspace {dir_path}
# dedicated: use _tmux_get_workspace_name

_tmux_get_session_name_from_workspace() {
    local nvim_workspace session_name
    nvim_workspace=$1
    session_name=$(basename "$nvim_workspace")
    echo "${session_name//./""}"
}

_tmux_get_workspace_name() {
    local target_path workspace_name
    target_path=$1
    [[ -f $target_path ]] && target_path=$(dirname "$target_path")
    workspace_name=$(basename "$target_path")
    echo "$workspace_name"
}

_tmux_get_current_session_name() {
    tmux display-message -p '#{session_name}'
}

# syntax: _tmux_has_session_name {session_name}
_tmux_has_session_name() {
    local session_name=$1
    # use '-t =...' for exact match
    tmux has-session -t "=$session_name" 2>/dev/null
    return $?
}

# SYNTAX: _tmux_create_new_session {session_name}
_tmux_create_new_session() {
    tmux new-session -d -s "$1" -c "${2:-"$(pwd)"}"
}

# SYNTAX: _tmux_create_windows_template {session_name} {nvim_server} {target}
_tmux_create_windows_template() {
    local session_name nvim_server target
    session_name=$1
    nvim_server=$2
    target=$3
    tmux rename-window -t "$session_name:1" 'vim'
    tmux send-keys -t "$session_name:vim" "nvim --listen $nvim_server $target" C-m
    tmux new-window -d -t "$session_name" -n "term"
}

# -- SYNTAX: _tmux_switch_to_session {session_name}
_tmux_switch_to_session() {
    tmux switch-client -t "$1"
}

_tmux_switch_to_default_session() {
    if ! _tmux_has_session_name "$TMUX_DEFAULT_SESSION_NAME"; then
        _tmux_create_new_session "$TMUX_DEFAULT_SESSION_NAME"
    fi
    _tmux_switch_to_session "$TMUX_DEFAULT_SESSION_NAME"
}

_tmux_kill_session() {
    tmux kill-session -t "$1"
}
