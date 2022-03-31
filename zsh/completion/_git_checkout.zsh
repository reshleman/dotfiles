# Override the Brew-provided git-checkout completion to suggest branch names
# that are with my username followed by the typed suffix.
#
# Ex:
# $ git checkout foo<tab>
# reshleman/foobar   reshleman/foobaz
#
# The overriddden completion function is managed by Homebrew and located at:
#
# - /usr/local/share/zsh/site-functions/_git
# - /usr/local/share/zsh/site-functions/git-completion.bash
#
# Note that because we are overriding an existing function, not defining a new
# completion, this file uses the `.zsh` extension, is sourced, and does not call
# `compdef`.
#
# We override the existing function following this example:
# https://unix.stackexchange.com/a/501111
#
# 1) Call the main _git completion wrapper function (which we do not override)
#    and also the _git_checkout function to make sure that they are loaded.
_git 2>/dev/null
_git_checkout 2>/dev/null

# 2) Save the original function we will override.
functions[_git_checkout-orig]=$functions[_git_checkout]

# 3) Redefine the checkout completion function referencing the original.
_git_checkout() {
  local prefixed_heads

  # Find any matching branches prefixed with my username and a slash.
  # __git_heads is defined in git-completion.bash
  prefixed_heads="$(__git_heads "" "$USER/$cur" "")"

  # If a match string was provided and we have prefixed matches, use them;
  # otherwise, use the original completion function to match non-prefixed
  # branches.
  if [[ -n $cur ]] && [[ -n $prefixed_heads ]]; then
    emulate -L zsh

    # Add the completions:
    #
    # The incantation in -M specifies how the characters in the string to be
    # completed map onto the list of matches produced by the completion code.
    # Specifically, this allows us to match later parts of the word.
    #
    # See:
    # - https://zsh.sourceforge.io/Doc/Release/Completion-Widgets.html#Completion-Matching-Control
    # - https://stackoverflow.com/q/68786631
    compadd -M 'r:|[._-]=* r:|=* l:|=* r:|=*' -- ${(f)prefixed_heads} && _ret=0
  else
    _git_checkout-orig "$@"
  fi
}
