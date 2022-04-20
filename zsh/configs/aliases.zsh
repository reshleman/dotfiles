# Unix
alias ll="ls -al"
alias ln="ln -v"
alias mkdir="mkdir -p"
alias e="$EDITOR"
alias v="$VISUAL"

# Git
alias gap="git add --patch"
alias pop="git stash pop"
alias gb='git checkout $(git branch -a | fzf)'

# Bundler
alias b="bundle"
alias be="bundle exec"

# Rails
alias migrate="rake db:migrate db:rollback && rake db:migrate db:test:prepare"
alias s="rspec"
alias f="foreman start"

# Pretty print the path
alias path='echo $PATH | tr -s ":" "\n"'

# Tmux
alias mux="tmuxinator"

# Neovim
alias vim="nvim"
