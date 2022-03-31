# load our own completion functions
fpath=(~/.zsh/completion /usr/local/share/zsh/site-functions $fpath)

# completion
autoload -U compinit
compinit

autoload -U bashcompinit && bashcompinit

# Sourced because we are overriding an existing completion function, not
# defining a new completion function:
source ~/.zsh/completion/_git_checkout.zsh
