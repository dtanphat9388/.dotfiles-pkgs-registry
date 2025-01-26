# export FZF_COMPLETION_TRIGGER='**'

export FZF_BASE="$HOME/.fzf"

if [[ $(command -v fd) ]]; then
  export FZF_CTRL_T_COMMAND='fd --type d --strip-cwd-prefix'
fi

# fzf theme editor: https://minsw.github.io/fzf-color-picker
FZF_DEFAULT_THEME='--color=dark,fg:#8E8E93,hl:#35C759:bold,hl+:#35C759:bold,bg+:-1,fg+:#FFFFFF:bold,header:#F8CE46:bold,query:#007AFF:bold,marker:#34C759 --pointer=" " --marker=" " --info=inline'
FZF_DEFAULT_KEYS='--bind ctrl-t:toggle-all,esc:abort,enter:accept'
FZF_DEFAULT_BEHAVIOR='--multi --exact --cycle --layout=reverse'
FZF_DEFAULT_OPTS+=" $FZF_DEFAULT_THEME $FZF_DEFAULT_KEYS $FZF_DEFAULT_BEHAVIOR"
export FZF_DEFAULT_OPTS

# used by fzf as web server
# export FZF_API_KEY="abcxyz"
