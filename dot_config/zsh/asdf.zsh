# Source asdf
if [[ "$(uname)" == "Darwin" ]] && [[ -f /opt/homebrew/opt/asdf/libexec/asdf.sh ]]; then
  . /opt/homebrew/opt/asdf/libexec/asdf.sh
elif [[ -f "$HOME/.asdf/asdf.sh" ]]; then
  . "$HOME/.asdf/asdf.sh"
fi

## Erlang
if [[ "$(uname)" == "Darwin" ]]; then
  export CC=clang
  export CPP="clang -E"
  export wxUSE_MACOSX_VERSION_MIN=12.3
fi
export EGREP=egrep
export KERL_BUILD_DOCS=yes
export KERL_INSTALL_MANPAGES=yes
export KERL_USE_AUTOCONF=0

export KERL_CONFIGURE_OPTIONS="--disable-debug --disable-silent-rules --enable-dynamic-ssl-lib --enable-gettimeofday-as-os-system-time --enable-kernel-poll --without-javac --without-wx --without-odbc"
