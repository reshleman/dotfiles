# ensure dotfiles bin directory is loaded first
PATH="$HOME/.bin:/usr/local/sbin:$PATH"

# Go
export GOPATH=$HOME/go
PATH="$GOPATH/bin:$PATH"

# Required for Claude Code
PATH="$HOME/.local/bin:$PATH"

# Load ASDF:
if [ -f "$HOME/.asdf/asdf.sh" ]; then
  # Try loading ASDF from the regular home dir location
  . "$HOME/.asdf/asdf.sh"
elif which brew >/dev/null &&
  # If ASDF has been installed via Homebrew, the completions file is in a different place
  [ -f "$(brew --prefix asdf)/libexec/asdf.sh" ]; then
  . "$(brew --prefix asdf)/libexec/asdf.sh"
fi

# mkdir .git/safe in the root of repositories you trust
PATH=".git/safe/../../bin:$PATH"

export -U PATH
