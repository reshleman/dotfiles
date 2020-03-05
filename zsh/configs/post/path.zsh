# ensure dotfiles bin directory is loaded first
PATH="$HOME/.bin:/usr/local/sbin:$PATH"

# Load ASDF
if [ -f "$HOME/.asdf/asdf.sh" ]; then
  # Try loading ASDF from the regular home dir location
  . "$HOME/.asdf/asdf.sh"
elif which brew >/dev/null &&
  # If ASDF has been installed via Homebrew, the completions file is in a different place
  BREW_DIR="$(dirname $(which brew))/.." &&
  [ -f "$BREW_DIR/opt/asdf/asdf.sh" ]; then
  . "$BREW_DIR/opt/asdf/asdf.sh"
fi

# mkdir .git/safe in the root of repositories you trust
PATH=".git/safe/../../bin:$PATH"

# Added by the Heroku Toolbelt
PATH="/usr/local/heroku/bin:$PATH"

export -U PATH
