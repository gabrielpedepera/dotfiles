#!/bin/sh

if [ ! -d "$HOME/.dotfiles" ]; then
    echo "Installing Dotfiles for the first time"
    git clone --depth=1 git@github.com:gabrielpedepera/dotfiles.git "$HOME/.dotfiles"
    cd "$HOME/.dotfiles"
    export PATH="$/opt/homebrew/bin:$PATH"
    rake install
else
    echo "Dotfiles is already installed"
fi
