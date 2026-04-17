if [[ "$(uname)" == "Darwin" ]] && command -v brew &>/dev/null; then
  source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
elif [[ -f /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh ]]; then
  source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
fi
