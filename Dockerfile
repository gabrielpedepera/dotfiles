FROM ubuntu:24.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    curl git sudo zsh ca-certificates unzip xz-utils fontconfig \
    && rm -rf /var/lib/apt/lists/*

RUN useradd -m -s /bin/zsh testuser \
    && echo "testuser ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

USER testuser
WORKDIR /home/testuser

# Install chezmoi
RUN sh -c "$(curl -fsLS get.chezmoi.io)" -- -b "$HOME/.local/bin"
ENV PATH="/home/testuser/.local/bin:${PATH}"

# Pre-configure chezmoi data to avoid interactive prompts
RUN mkdir -p "$HOME/.config/chezmoi" \
    && printf '[data]\n    name = "Test User"\n    email = "test@example.com"\n' \
    > "$HOME/.config/chezmoi/chezmoi.toml"

COPY --chown=testuser:testuser . /home/testuser/.dotfiles

RUN chezmoi init --source /home/testuser/.dotfiles --apply --exclude-entry-types=encrypted

# Smoke test: verify key commands are available
ENV PATH="/home/testuser/.local/bin:/home/testuser/.asdf/bin:/home/testuser/.atuin/bin:${PATH}"
RUN command -v nvim \
    && (command -v bat || command -v batcat) \
    && command -v fzf \
    && command -v tldr \
    && command -v duf \
    && command -v zsh \
    && command -v oh-my-posh \
    && command -v atuin \
    && command -v copilot \
    && command -v gh \
    && echo "All smoke tests passed!"
