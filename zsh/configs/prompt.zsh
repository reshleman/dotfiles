setopt promptsubst

# Color helpers
prompt_color()  { echo "%{$fg[$2]%}$1%{$reset_color%}" }
prompt_green()  { prompt_color "$1" green }
prompt_magenta(){ prompt_color "$1" magenta }
prompt_purple() { prompt_color "$1" purple }
prompt_red()    { prompt_color "$1" red }
prompt_cyan()   { prompt_color "$1" cyan }
prompt_blue()   { prompt_color "$1" blue }
prompt_yellow() { prompt_color "$1" yellow }
prompt_spaced() { [[ -n "$1" ]] && print " $@" }

# Show an asterisk if the working directory is not clean.
parse_git_dirty() {
  if [[ -n $(git status --porcelain) ]]; then
    echo -n "*"
  fi
}

# Show the branch name or short SHA if we're in a git repo
git_prompt_info() {
  local ref=$(git symbolic-ref --short HEAD 2> /dev/null || git rev-parse --short HEAD 2> /dev/null)
  if [[ -n $ref ]]; then
    prompt_yellow "($ref$(parse_git_dirty)) "
  fi
}

# Trailing portion of the current working directory, or ~.
dir_prompt_info() {
  prompt_green "%1~ "
}

# If the shell is running with priviliges (e.g., root), then #, else $.
prompt_info() {
  echo " %(!.#.$) "
}

# Concat the entire prompt
export PS1='$(dir_prompt_info)$(git_prompt_info)$(prompt_info)'
