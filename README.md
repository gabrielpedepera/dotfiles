# Dotfiles
## Installation

To get started please run:

```bash
sh -c "`curl -fsSL https://raw.githubusercontent.com/gabrielpedepera/dotfiles/main/install.sh`"
```
## Wait, you're not done! Do this:
#### Install iTerm Themes
Go to Profiles => Colors => Load Presets to pick:

* Lovelace
* Solarized Dark
#### Set up a system wide hotkey for iTerm (Keys=>Hotkey)
Recommended Cmd-Escape

#### In iTerm, uncheck "Native full screen windows" on General
This will give you fast full screen windows that are switchable without switching to spaces.

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

We automatically install a few useful packages including ctags, git, macvim, hub, and the silver searcher ('ag')
Note that our autocomplete plugin requires a MacVim that supports Lua. The installer knows how to install it, but if you had one installed before, you may need to manually remove your old MacVim.

### ZSH

Think of Zsh as a more awesome bash without having to learn anything new.
Automatic spell correction for your commands, syntax highlighting, and more.
We've also provided lots of enhancements:

* `Ctrl-x,Ctrl-l` to insert output of last command
* [fasd](https://github.com/clvv/fasd) integration - hit `z` and partial match for recently used directory. Tab completion enabled.
* `Ctrl-r` to use [fsd](https://github.com/junegunn/fzf) a general-purpose command-line fuzzy finder.
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

### RubyGems

A .gemrc is included. Never again type `gem install whatever --no-ri --no-rdoc`. `--no-ri --no-rdoc` is done by default.

### Vimization of everything

The provided inputrc and editrc will turn your various command line tools like mysql and irb into vim prompts. There's
also an included Ctrl-R reverse history search feature in editrc, very useful in irb, postgres command line, and etc.

### Github Issues: [ghi gem](https://github.com/stephencelis/ghi)

We include the `ghi` command. Try `ghi list` and have fun managing issues from command line!

### [Pry](https://pryrepl.org/)

Pry offers a much better out of the box IRB experience with colors, tab completion, and lots of other tricks. You can also use it
as an actual debugger by installing [pry-nav](https://github.com/nixme/pry-nav).
