# Aliases

## General

| Alias | Command | Description |
|-------|---------|-------------|
| `alias-edit` | `vim ~/.config/zsh/aliases.zsh` | Edit aliases file |
| `alias-reload` | `source ~/.config/zsh/aliases.zsh` | Reload aliases |
| `cls` | `clear;ls` | Clear screen and list files |
| `ll` | `ls -alGh` | Long listing with human sizes |
| `:q` | `exit` | Exit shell (vim habit) |

## Dotfiles (chezmoi)

| Alias | Command | Description |
|-------|---------|-------------|
| `dotfiles-apply` | `chezmoi apply` | Apply dotfiles to system |
| `dotfiles-update` | `chezmoi update` | Pull latest and apply |
| `dotfiles-edit` | `chezmoi edit` | Edit a managed file |
| `dotfiles-diff` | `chezmoi diff` | Show pending changes |
| `dotfiles-status` | `chezmoi status` | Show changed files |

## Git

| Alias | Command | Description |
|-------|---------|-------------|
| `gs` | `git status` | Status |
| `ga` | `git add -A` | Stage all changes |
| `gap` | `git add -p` | Stage interactively |
| `gcm` | `git ci -m` | Commit with message |
| `gca` | `git ammend` | Amend last commit |
| `gco` | `git co` | Checkout |
| `gnb` | `git nb` | New branch (checkout -b) |
| `gd` | `git diff` | Diff |
| `gdc` | `git diff --cached -w` | Diff staged changes |
| `gl` | `git l` | Pretty log |
| `gb` | `git b` | Branch list with summary |
| `gf` | `git fetch` | Fetch |
| `gpl` | `git pull` | Pull |
| `gps` | `git push` | Push |
| `gpsh` | `git push -u origin HEAD` | Push and set upstream |
| `gr` | `git rebase` | Rebase |
| `gra` | `git rebase --abort` | Abort rebase |
| `gst` | `git stash` | Stash |
| `gsp` | `git stash pop` | Stash pop |
| `guns` | `git unstage` | Unstage files |
| `gunc` | `git uncommit` | Undo last commit |
| `gdmb` | `git branch --merged \| xargs git branch -d` | Delete merged branches |
| `grb` | `git recent-branches` | Recently worked on branches |

## Remote Development (Azure VM)

| Alias | Command | Description |
|-------|---------|-------------|
| `remote-start` | `az vm start ...` | Start the VM |
| `remote-stop` | `az vm deallocate ...` | Stop and deallocate (stops billing) |
| `remote-status` | `az vm get-instance-view ...` | Show VM power state |
| `remote-ssh` | `ssh -t ubuntu-remote-dev "cd ~/Workspace && exec $SHELL -l"` | SSH into the VM (lands in ~/Workspace) |
| `remote-ip` | `az vm list-ip-addresses ...` | Show public IP |

## Homebrew

| Alias | Command | Description |
|-------|---------|-------------|
| `brewu` | `brew update && upgrade && cleanup && doctor` | Full Homebrew maintenance |
