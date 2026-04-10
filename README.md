# Dotfiles

Managed with [chezmoi](https://www.chezmoi.io/).

## Installation

```bash
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply --source=~/.dotfiles gabrielpedepera/dotfiles
```

## Updating

```bash
chezmoi update
```

## What's included?

### [Homebrew](https://brew.sh/)

Homebrew is _the missing package manager for macOS_. Installed automatically.

Packages: asdf, nvim, bat, git-delta, duf, tldr, oh-my-posh, atuin, fzf, zsh-autosuggestions, and font-hack-nerd-font.

### [Oh My Posh](https://ohmyposh.dev/)

Prompt theme engine using the [Catppuccin Frappé](https://github.com/catppuccin/oh-my-posh) theme. Configuration at `~/.config/zsh/themes/catppuccin_frappe.omp.json`.

### [Neovim](https://neovim.io/)

A minimal Neovim configuration with [lazy.nvim](https://github.com/folke/lazy.nvim) for plugin management and the [Catppuccin Frappé](https://github.com/catppuccin/nvim) colorscheme.

### [Atuin](https://atuin.sh/)

Shell history replacement. Press `Ctrl-r` or up arrow to search history with a navigable list.

### ZSH

Automatic spell correction, syntax highlighting, and more:

* [fasd](https://github.com/clvv/fasd) integration - hit `z` and partial match for recently used directory
* [fzf](https://github.com/junegunn/fzf) for general-purpose fuzzy finding
* Fish-like autosuggestions via [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions)

### Aliases

Two and three character mnemonic aliases:

    ae # alias edit
    ar # alias reload

### Git Customizations

Dotfiles will take over your `~/.gitconfig`, so put your user info into `~/.gitconfig.user`.

  * `git l` or `gl` - a much more usable git log
  * `git b` or `gb` - a list of branches with summary of last commit
  * `git r` - a list of remotes with info
  * `git t` or `gt` - a list of tags with info
  * `git nb` or `gnb` - checkout -b (new branch)
  * `git cp` or `gcp` - cherry-pick -x
  * `git simple` - clean format for changelogs
  * `git recent-branches` - recently worked on branches
  * `git unstage` / `guns` - remove from index
  * `git uncommit` / `gunc` - revert last commit (dangerous if pushed)
  * `gdmb` - delete all branches merged on current branch
