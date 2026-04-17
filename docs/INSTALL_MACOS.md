# macOS Installation

## Prerequisites

- [1Password](https://1password.com/downloads) installed and signed in
- [Homebrew](https://brew.sh/) installed

## Steps

### 1. Install the 1Password CLI and age

```bash
brew install --cask 1password-cli
brew install age
```

### 2. Restore the age decryption key from 1Password

```bash
mkdir -p ~/.config/chezmoi
op item get chezmoi-age-key --fields notesPlain > ~/.config/chezmoi/chezmoi-key.txt
chmod 600 ~/.config/chezmoi/chezmoi-key.txt
```

### 3. Initialize and apply dotfiles

```bash
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply --source=~/.dotfiles gabrielpedepera/dotfiles
```

### 4. Load your SSH key into the agent

This persists across reboots via macOS Keychain:

```bash
ssh-add --apple-use-keychain ~/.ssh/id_ed25519
```
