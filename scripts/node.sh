#!bin/sh

if [[ $OSTYPE == 'darwin'* ]]; then
  # RUST_ANALYZER_GZ='rust-analyzer-aarch64-apple-darwin.gz'
  brew install node
  exit 0
fi

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash
source ~/.bashrc
nvm install latest
