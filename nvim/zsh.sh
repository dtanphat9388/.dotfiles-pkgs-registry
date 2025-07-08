#!/bin/bash
# Requirements
# - tmux, fzf
# - add following envs to .zshenv
#   - VIM_WORKSPACE_NAME: will launch workspace in tmux session name

# -- Quick resolve recent path
_vim_resolve_path() {
  local target=$1
  _realpath=$(realpath "$target")
  if [[ -e "$_realpath" ]]; then
    echo "$_realpath"
  else
    _zpath=$(zshz -e "$target")
    # _zpath=$(zshz -le "$target" | awk '{print $2}')
    _numofzpath=$(echo "$_zpath" | wc -l)
    if [[ $_numofzpath -gt 1 ]]; then
      selected=$(echo "$_zpath" | fzf)
      echo "$selected"
    else
      echo "$_zpath"
    fi
  fi
}

compdef vi=nvim
vi() {
  if [[ ! $TERM_PROGRAM == 'tmux' ]]; then
    nvim "$@"
    return
  fi
  # resolve paths
  local target=$1
  local target_path=$(_vim_resolve_path "$target")
  [[ -z $target_path ]] && echo not found && return 127
  local workspace_name=$([[ -d $target_path ]] && basename "$target_path" || dirname "$target_path")
  # prepare tmux environment
  local session_name="$VIM_WORKSPACE_NAME"
  local nvim_server="/tmp/nvim-server-${workspace_name}.pipe"
  if (tmux has-session -t "=$session_name"); then
    tmux new-window -S -t "$session_name" -c "$target_path" -n "$workspace_name" nvim --listen "$nvim_server"
  else
    tmux new-session -d -s "$session_name" -c "$target_path" -n "$workspace_name" nvim --listen "$nvim_server"
  fi
  tmux switch-client -t "$session_name"
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
