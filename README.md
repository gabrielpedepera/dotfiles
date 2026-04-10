# Dotfiles

## Installation

To get started please run:

```bash
sh -c "`curl -fsSL https://raw.githubusercontent.com/gabrielpedepera/dotfiles/main/install.sh`"
```
### Upgrading

Upgrading is easy.

```bash
cd ~/.dotfiles
git pull --rebase
rake update
```

## What's included, and how to customize?

### [Homebrew](https://brew.sh/)

Homebrew is _the missing package manager for macOS_. Installed automatically.

We automatically install a few useful packages including asdf, nvim, bat, git-delta, duf, tldr, oh-my-posh, and font-hack-nerd-font.

### [Oh My Posh](https://ohmyposh.dev/)

Oh My Posh is a prompt theme engine for any shell. We use the [Catppuccin Frappé](https://github.com/catppuccin/oh-my-posh) theme. The configuration is located at `zsh/themes/catppuccin_frappe.omp.json`.

### [Neovim](https://neovim.io/)

A minimal Neovim configuration with [lazy.nvim](https://github.com/folke/lazy.nvim) for plugin management and the [Catppuccin Frappé](https://github.com/catppuccin/nvim) colorscheme. The configuration is symlinked to `~/.config/nvim`.

### ZSH

Think of Zsh as a more awesome bash without having to learn anything new.
Automatic spell correction for your commands, syntax highlighting, and more.
We've also provided lots of enhancements:

* [fasd](https://github.com/clvv/fasd) integration - hit `z` and partial match for recently used directory. Tab completion enabled. Such as [autojump](https://github.com/wting/autojump)
* `Ctrl-r` or up arrow to search shell history with [Atuin](https://atuin.sh/) — shows a searchable list you can navigate with arrows
* Fish-like fast/unobtrusive autosuggestions for zsh through [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions)

### Aliases

Lots of things we do every day are done with two or three character
mnemonic aliases. Please feel free to edit them:

    ae # alias edit
    ar # alias reload

### Git Customizations:

Dotfiles will take over your `~/.gitconfig`, so if you want to store your usernames, please put them into `~/.gitconfig.user`

It is recommended to use this file to set your user info. Alternately, you can set the appropriate environment variables in your `~/.secrets`.

  * `git l` or `gl`- a much more usable git log
  * `git b` or `gb`- a list of branches with summary of last commit
  * `git r` - a list of remotes with info
  * `git t` or `gt`- a list of tags with info
  * `git nb` or `gnb`- a (n)ew (b)ranch - like checkout -b
  * `git cp` or `gcp`- cherry-pick -x (showing what was cherrypicked)
  * `git simple` - a clean format for creating changelogs
  * `git recent-branches` - if you forgot what you've been working on
  * `git unstage` / `guns` (remove from index) and `git uncommit` / `gunc` (revert to the time prior to the last commit - dangerous if already pushed) aliases
  * Some sensible default configs, such as improving merge messages, push only pushes the current branch, removing status hints, and using mnemonic prefixes in diff: (i)ndex, (w)ork tree, (c)ommit and (o)bject
  * Slightly improved colors for diff
  * `gdmb` (g)it (d)elete (m)erged (b)ranches - Deletes all branches already merged on current branch
