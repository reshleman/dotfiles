# reshleman/dotfiles

I use [thoughtbot/dotfiles] and [reshleman/dotfiles] together, following the
[`*.local` convention][dot-local] described in [thoughtbot/dotfiles].

[dot-local]: https://github.com/thoughtbot/dotfiles#make-your-own-customizations

## Requirements

Set zsh as the login shell.

```
chsh -s /bin/zsh
```

Install [rcm](https://github.com/thoughbot/rcm).

```
brew tap thoughtbot/formulae
brew install rcm
```

## Install

Clone the dotfiles repos:

```
git clone git://github.com/thoughtbot/dotfiles.git $HOME/Code/thoughtbot/dotfiles
git clone git://github.com/reshleman/dotfiles.git $HOME/Code/reshleman/dotfiles
```

Install:

```
env RCRC=$HOME/Code/reshleman/dotfiles/rcrc rcup
```

This command will create symlinks for [thoughtbot][thoughtbot/dotfiles] and
[reshleman][reshleman/dotfiles] config files in the home directory. The `RCRC`
environment variable tells `rcup` to use the configuration options from the
`rcrc` file:

* Exclude the `README.md` and `LICENSE` files, which do not need to be symlinked.
* Give precedence to personal overrides in this repository over those in
  [thoughtbot/dotfiles].

This `rcup` command can safely be run multiple times to update.

[thoughtbot/dotfiles]: https://github.com/thoughtbot/dotfiles
[reshleman/dotfiles]: https://github.com/reshleman/dotfiles

## What's in it?

### [vim](http://www.vim.org/) configuration:

* Solarized colorscheme
* Customizations for GUI Vim
* Ag and vim-dispatch plugins

### [git](http://git-scm.com/) configuration:

* My name and email

### tmux configuration:

* `C-s` prefix key
* More intuitive pane splitting with `prefix-minus` and `prefix-backslash`
* Vim-like keybindings for pane switching, with awareness of vim splits
* Resize panes with {`Shift`,`Ctrl`}-{`Left`,`Right`,`Up`,`Down`}
* Use `vim-tmux-runner` with `vim-rspec`

Much of this configuration is based on the [Upcase tmux course] and
[Chris Toomey's dotfiles].

[Upcase tmux course]: https://upcase.com/tmux
[Chris Toomey's dotfiles]: https://github.com/christoomey/dotfiles/blob/master/tmux/tmux.conf

### [zsh](http://zsh.sourceforge.net/FAQ/zshfaq01.html) configuration and aliases:

* Prompt customization
