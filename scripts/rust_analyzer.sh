#!/bin/sh

RUST_ANALYZER_GZ='rust-analyzer-x86_64-unknown-linux-gnu.gz'

if [[ $OSTYPE == 'darwin'* ]]; then
  # RUST_ANALYZER_GZ='rust-analyzer-aarch64-apple-darwin.gz'
  brew install rust-analyzer
  exit 0
fi

mkdir -p ~/.local/bin && \
curl -L "https://github.com/rust-lang/rust-analyzer/releases/latest/download/$RUST_ANALYZER_GZ" \
  | gunzip -c - > \
  ~/.local/bin/rust-analyzer && \
chmod +x ~/.local/bin/rust-analyzer
