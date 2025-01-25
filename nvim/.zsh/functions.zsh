#!/bin/bash

__home=$1

# get path in current dir
# Or in zoxide
_vim_find_target() {
  local target=$1
  [[ -z $target ]] && echo $(pwd) && return
  [[ -d $target ]] && echo $target && return
  [[ -f $target ]] && echo $(pwd)/$target && return
  local cached=$(zshz -et $target)
  [[ -n $cached ]] && echo $cached && return
  return 127
}

# vims $NAME $PROJ_PATH
vims() {
  local project_dir=$1
  local project_name=$(basename $project_dir)
  if ! _tmux_has_session_name $project_name; then
    nvim_server="/tmp/nvim-server-${project_name}.pipe"
    _tmux_create_session_template $project_name $nvim_server $target
  fi
  _tmux_switch_to_session "${proj_name}:vim"
}

# -- [USECASE 2] start new workspace in window
# Tips: set window name in tmux (-n $name) instead nvim, tmux auto goto window name if exist
vimw() {
  local project_path=$1
  local project_name=$([[ -d $project_path ]] && basename $project_path || dirname $project_path)
  local session_name="$VIM_WORKSPACE_NAME"
  local nvim_server="/tmp/nvim-server-${project_name}.pipe"
  if _tmux_has_session_name $session_name; then
    tmux new-window -S -t "$session_name" -c "$project_path" -n "$project_name" nvim --listen "$nvim_server"
  else
    tmux new-session -d -s "$session_name" -c "$project_path" -n "$project_name" nvim --listen "$nvim_server"
  fi
  session_current=$(tmux display-message -p '#S')
  [[ "$session_current" != "$session_name" ]] && _tmux_switch_to_session "${session_name}"
}

# -- style:
#   - window: one project on separate tmux window (vimw <name> <path>)
#   - session: one project on separate tmux session (vims <name> <path>)
compdef vim=nvim
vim() {
  if [[ ! $TERM_PROGRAM == 'tmux' ]]; then
    nvim $@
    return
  fi
  local target=$1
  local project_dir=$(_vim_find_target $target)
  local _status=$?
  [[ -z $project_dir ]] && echo not found && return $_status
  if [[ $VIM_WORKSPACE_STYLE == "window" ]]; then
    vimw $project_dir
  else
    vims $project_dir
  fi
}

# -- nvim profile switcher (https://gist.github.com/elijahmanor/b279553c0132bfad7eae23e34ceb593b)
# -- set nvim profile
vimns() {
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

.vim() {
  _path=$DF_CONFIGS/nvim
  if [[ $DF_IS_TERM_VSCODE ]]; then
    code $_path
  else
    vim $_path
  fi
}

.nb() {
  vim $ZK_NOTEBOOK_DIR
}
