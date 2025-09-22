#!/bin/bash

# -- Quick resolve recent path
_vim_resolve_path() {
  local target=${1:-$PWD}
  local _realpath
  # 1. resolve exist path
  _realpath=$(realpath "$target")
  # 2. show recent path with highest score in zshz
  if [[ ! -e "$_realpath" ]]; then
    _realpath=$(zshz -e "$target")
  fi
  # 3. show list of path
  if [[ ! -e "$_realpath" ]]; then
    _realpath=$(zshz -l | awk '{print $2}' | fzf)
  fi
  echo "$_realpath"
}

_vim_exe() {
  local target_path=$1
  local session_name=$2
  local workspace=$([[ -d "$target_path" ]] && echo "$target_path" || echo $(dirname "$target_path"))
  local window_name=$(basename "$workspace")
  local nvim_server="/tmp/nvim-server-${window_name}.pipe"
  if (! tmux has-session -t "=$session_name" 2>/dev/null); then
    tmux new-session -d -s "$session_name" -c "$workspace" -n "$window_name" nvim --listen "$nvim_server" "$target_path"
  fi
  tmux new-window -S -t "$session_name" -c "$workspace" -n "$window_name" nvim --listen "$nvim_server" "$target_path"
  tmux switch-client -t "$session_name"
}

compdef vi=nvim
vi() {
  if [[ ! $TERM_PROGRAM == 'tmux' ]]; then
    exec nvim "$@"
  fi
  local session_name="$VIM_WORKSPACE_NAME"
  local target_path=$(_vim_resolve_path "$1")
  _vim_exe $target_path $session_name
}

# -- nvim profile switcher (https://gist.github.com/elijahmanor/b279553c0132bfad7eae23e34ceb593b)
# -- set nvim profile
vins() {
  items=$(ls $DF_CONFIGS/nvims)
  profile=$(printf "%s\n" "${items[@]}" | fzf --prompt=" Neovim Config  " --height=50% --layout=reverse --border --exit-0)
  if [[ -z $profile ]]; then
    echo "Nothing selected"
    return 0
  elif [[ $profile == "default" ]]; then
    profile="nvim"
  fi
  rm "$HOME/.config/nvim"
  rm -rf "$HOME/.local/share/nvim"
  ln -sf $(realpath $DF_CONFIGS/$profile) $HOME/.config/nvim
}
