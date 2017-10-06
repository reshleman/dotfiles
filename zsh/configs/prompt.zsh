setopt promptsubst

# Variables
ZSH_THEME_DIR_PROMPT_PREFIX="%{$fg[green]%}"
ZSH_THEME_DIR_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_DIR_PROMPT="%c"
ZSH_THEME_GIT_PROMPT_PREFIX=" %{$fg[yellow]%}("
ZSH_THEME_GIT_PROMPT_SUFFIX=")%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="*"
ZSH_THEME_GIT_PROMPT_CLEAN=""
ZSH_THEME_CMD_PROMPT=" %(!.#.$) "

# Is the working directory clean?
parse_git_dirty() {
  if [[ -n $(git status --porcelain) ]]; then
    echo -n $ZSH_THEME_GIT_PROMPT_DIRTY
  else
    echo -n $ZSH_THEME_GIT_PROMPT_CLEAN
  fi
}

# Show the branch name or short SHA if we're in a git repo
git_prompt_info() {
  ref=$(git symbolic-ref --short HEAD 2> /dev/null || git rev-parse --short HEAD 2> /dev/null)
  if [[ -n $ref ]]; then
    echo "$ZSH_THEME_GIT_PROMPT_PREFIX${ref}$(parse_git_dirty)$ZSH_THEME_GIT_PROMPT_SUFFIX"
  fi
}

# Concat the directory portion of the prompt
dir_prompt_info() {
  echo "$ZSH_THEME_DIR_PROMPT_PREFIX$ZSH_THEME_DIR_PROMPT$ZSH_THEME_DIR_PROMPT_SUFFIX"
}

# Concat the entire prompt
export PS1='$(dir_prompt_info)$(git_prompt_info)$ZSH_THEME_CMD_PROMPT'
