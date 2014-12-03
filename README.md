# reshleman/dotfiles

I use [thoughtbot/dotfiles](https://github.com/thoughtbot/dotfiles) and
[reshleman/dotfiles](https://github.com/reshleman/dotfiles) together, using the
`*.local` convention described in thoughtbot/dotfiles.

## Requirements

Set zsh as your login shell.

```
chsh -s /bin/zsh
```

Install [rcm](https://github.com/thoughbot/rcm).

```
brew tap thoughtbot/formulae
brew install rcm
```

## Install

Clone onto your computer:

```
git clone git://github.com/thoughtbot/dotfiles.git $HOME/Code/thoughtbot/dotfiles
git clone git://github.com/reshleman/dotfiles.git $HOME/Code/reshleman/dotfiles
```

Install:

```
env RCRC=$HOME/Code/reshleman/dotfiles/rcrc rcup
```

This will create symlinks for thoughtbot and local (reshleman) config files in
your home directory, giving precedence to personal overrides in
reshleman/dotfiles.

Additionally, setting the RCRC environment variable tells rcup to use
configuration options from thoughtbot/dotfiles, such as skipping the README.md
and LICENSE files when symlinking.

You can safely run this `rcup` command multiple times to update.

(These commands use my preferred file paths; adjust per your preferences.)

## What's in it?

[vim](http://www.vim.org/) configuration:

* Solarized colorscheme
* Customizations for GUI Vim
* Ag and vim-dispatch plugins

[git](http://git-scm.com/) configuration:

* My name and email

[zsh](http://zsh.sourceforge.net/FAQ/zshfaq01.html) configuration and aliases:

* Chruby configuration
* Prompt customization
