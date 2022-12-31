#!/bin/sh

if [[ $OSTYPE == 'darwin'* ]]; then
  echo "clang is already installed"
  echo "if this is incorrect you can run:"
  echo '`brew install llvm`'
  exit 0
fi

sudo apt-get install clangd-12 && \
sudo update-alternatives --install /usr/bin/clangd clangd /usr/bin/clangd-12 100
