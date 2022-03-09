# reshleman/dotfiles

## Requirements

Set zsh as the login shell.

```
chsh -s /bin/zsh
```

Install [rcm](https://github.com/thoughtbot/rcm).

```
brew tap thoughtbot/formulae
brew install rcm
```

## Install

Clone:

```
git clone git://github.com/reshleman/dotfiles.git $HOME/Code/reshleman/dotfiles
```

Install:

```
env RCRC=$HOME/Code/reshleman/dotfiles/rcrc rcup
```

This command will create symlinks for [reshleman][reshleman/dotfiles] config
files in the home directory. The `RCRC` environment variable tells `rcup` to use
the configuration options from the `rcrc` file:

* Exclude the `README.md` and `LICENSE` files, which do not need to be symlinked.
* Give precedence to overrides in `private-dotfiles` over those in this
  repository.

After the initial installation, you can run `rcup` without the one-time variable
`RCRC` being set (`rcup` will symlink the [repo's `rcrc`][rcrc] to `~/.rcrc` for
future runs of `rcup`).

`rcup` can safely be run multiple times to update.

`rcup` should be run after pulling a new version of the repository to symlink
any new files in the repository.

[reshleman/dotfiles]: https://github.com/reshleman/dotfiles
[rcrc]: https://github.com/reshleman/dotfiles/blob/master/rcrc

## zsh Configurations

Additional zsh configuration can go under the `~/dotfiles-local/zsh/configs`
directory. This has two special subdirectories: `pre` for files that must be
loaded first, and `post` for files that must be loaded last.

## What's in it?

### [vim](http://www.vim.org/) configuration:

* Set `<leader>` to a single space.
* Use [vim-plug](https://github.com/junegunn/vim-plug) to manage plugins.
* [fzf](https://github.com/junegunn/fzf.vim) for fuzzy file/buffer/tag finding.
* [Rails.vim](https://github.com/tpope/vim-rails) for enhanced navigation of
  Rails file structure via `gf` and `:A` (alternate), `:Rextract` partials,
  `:Rinvert` migrations, etc.
* Run many kinds of tests [from vim]([https://github.com/janko-m/vim-test)
* Syntax highlighting for Markdown, HTML, JavaScript, Ruby, Go, Elixir, more.
* Use [Ag](https://github.com/ggreer/the_silver_searcher) instead of Grep when
  available.
* Map `<leader>ct` to re-index [Exuberant Ctags](http://ctags.sourceforge.net/).
* Use [vim-mkdir](https://github.com/pbrisbin/vim-mkdir) for automatically
  creating non-existing directories before writing the buffer.
* Ag plugin
* Solarized colorscheme
* Customizations for GUI Vim
* Switch between the last two files with space-space.

### [git](http://git-scm.com/) configuration:

* My name and email
* Adds a `create-branch` alias to create feature branches.
* Adds a `delete-branch` alias to delete feature branches.
* Adds a `merge-branch` alias to merge feature branches into master.
* Adds an `up` alias to fetch and rebase `origin/master` into the feature
  branch. Use `git up -i` for interactive rebases.
* Adds `post-{checkout,commit,merge}` hooks to re-index your ctags.
* Adds `trust-bin` alias to append a project's `bin/` directory to `$PATH`.

### tmux configuration:

* `C-s` prefix key
* More intuitive pane splitting with `prefix-minus` and `prefix-backslash`
* Vim-like keybindings for pane switching, with awareness of vim splits
* Resize panes with {`Shift`,`Ctrl`}-{`Left`,`Right`,`Up`,`Down`}
* Use `vim-tmux-runner`
* `<prefix>C-b` and `<prefix>K` to break and kill sessions without exiting tmux
* Integrate w/ system clipboard in copy mode

Much of this tmux configuration is based on the [Upcase tmux course] and
[Chris Toomey's dotfiles].

[Upcase tmux course]: https://upcase.com/tmux
[Chris Toomey's dotfiles]: https://github.com/christoomey/dotfiles/blob/master/tmux/tmux.conf

### [zsh](http://zsh.sourceforge.net/FAQ/zshfaq01.html) configuration and aliases:

* Prompt customization
* `b` for `bundle`.
* `g` with no arguments is `git status` and with arguments acts like `git`.
* `migrate` for `rake db:migrate && rake db:rollback && rake db:migrate`.
* `mcd` to make a directory and change into it.
* `replace foo bar **/*.rb` to find and replace within a given list of files.
* `tat` to attach to tmux session named the same as the current directory.
* `v` for `$VISUAL`.


## Thanks

Lots of this configuration is based on [thoughtbot/dotfiles].

[thoughtbot/dotfiles]: https://github.com/thoughtbot/dotfiles
