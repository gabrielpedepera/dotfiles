# Linux Installation

## Prerequisites

- [1Password CLI](https://developer.1password.com/docs/cli/get-started/#install) installed and signed in

## Steps

### 1. Install age

```bash
sudo apt install age
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

```bash
ssh-add ~/.ssh/id_ed25519
```
