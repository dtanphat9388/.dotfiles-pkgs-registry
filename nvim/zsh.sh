#!/bin/bash

compdef vi=nvim
vi() {
  if [[ ! $TERM_PROGRAM == 'tmux' ]]; then
    nvim "$@"
    return
  fi
  local target=$1
  local _target_path=$(_vim_resolve_path $target)
  local _status=$?
  [[ -z $_target_path ]] && echo not found && return $_status
  if [[ $VIM_WORKSPACE_STYLE == "window" ]]; then
    _vimw "$_target_path"
  else
    _vims "$_target_path"
  fi
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

.vi() {
  vi $DF_CONFIGS/nvim
}

.nb() {
  vi "$ZK_NOTEBOOK_DIR"
}
_vim_resolve_path() {
  local target=$1
  _realpath=$(realpath "$target")
  if [[ -e "$_realpath" ]]; then
    echo "$_realpath"
  else
    _zpath=$(zshz -le "$target" | awk '{print $2}')
    _numofzpath=$(echo "$_zpath" | wc -l)
    if [[ $_numofzpath -gt 1 ]]; then
      selected=$(echo "$_zpath" | fzf)
      echo "$selected"
    else
      echo "$_zpath"
    fi
  fi
}

_vims() {
  local project_dir=$1
  local project_name=$(basename $project_dir)
  if ! _tmux_has_session_name $project_name; then
    nvim_server="/tmp/nvim-server-${project_name}.pipe"
    _tmux_create_session_template $project_name $nvim_server $target
  fi
  _tmux_switch_to_session "${proj_name}:vim"
}

_vimw() {
  local target=$1
  local target_name=$([[ -d $target ]] && basename "$target" || dirname "$target")
  local session_name="$VIM_WORKSPACE_NAME"
  local nvim_server="/tmp/nvim-server-${target_name}.pipe"
  if (tmux has-session -t "=$session_name"); then
    tmux new-window -S -t "$session_name" -c "$target" -n "$target_name" nvim --listen "$nvim_server"
  else
    tmux new-session -d -s "$session_name" -c "$target" -n "$target_name" nvim --listen "$nvim_server"
  fi
  tmux switch-client -t "$session_name"
}
