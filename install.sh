#!/bin/bash

CURRENT_DIR=$PWD
COUNTER=0
MINIMUM=0
MAXIMUM=10000
ORANGE='\033[0;31m'
YELLOW=''
GREEN=''
NO_COLOR='\033[0m'

Help() {
  # Display Help
  echo "Automatically install neovim on Debian distribution of linux, alongside installing lsp servers, and dap"
  echo ""
  echo "Syntax: ./install.sh [-g|h|v|V]"
  echo "options:"
  echo "  --min   the minimum step to run"
  echo "  --max   the maximum step to run"
  echo ""
}

colored() {
  printf "$1$2$NO_COLOR\n"
}

while test $# -gt 0; do
  case "$1" in
    --min)
        shift
        MINIMUM=$1
        shift
        ;;
    --max)
        shift
        MAXIMUM=$1
        shift
        ;;
    *)
       echo "$1 is not a recognized flag!"
       Help
       exit 1;
       ;;
  esac
done

increment() {
  COUNTER=$((COUNTER+1))
}

attempt() {
  increment
  SHOULD_SKIP=0

  if (($MINIMUM > $COUNTER)); then
    SHOULD_SKIP=1
  fi

  if (($MAXIMUM < $COUNTER)); then
    SHOULD_SKIP=1
  fi

  echo "$COUNTER) [$1]"
  if [ "$SHOULD_SKIP" -ge 1 ] ; then
    printf ""
  else
    if echo "$1"; then
      echo ""
    else 
      cd $CURRENT_DIR
      exit 1
    fi
  fi
}

# need to decrease it by one, so it matches up

# install neovim
attempt "sudo add-apt-repository ppa:neovim-ppa/stable"
attempt "sudo apt-get update -y"
attempt "sudo apt-get install neovim -y"
attempt "sudo apt-get install python-dev python-pip python3-dev python3-pip"

# add  fonts
attempt "mkdir $HOME/.fonts"
attempt "mv ./Fira* $HOME/.fonts"

millawakee
14411 south east miklafleen blvd 97267
11am, 12pm, 1:20
11am

attempt "echo 'FOR OTHER SERVERS BESIDES Javascript: https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md'"

# add language servers for vscode, tailwind, and typescript
attempt "npm install -g vscode-langservers-extracted"
attempt "npm install -g @tailwindcss/language-server"
attempt "npm install -g typescript typescript-language-server"

# needed for coq, lsp completion
attempt "sudo apt install python3-venv -y"

PACKER_FOLDER="$HOME/.local/share/nvim/site/pack/packer/start/packer.nvim"
# packer, manager for neovim
attempt "git clone --depth 1 https://github.com/wbthomason/packer.nvim $PACKER_FOLDER"

# attempt "cd $CURRENT_DIR/debug"
# attempt "git submodule update --init ./*"

attempt "echo 'open nvim and run :PackerSync'"

cd $CURRENT_DIR

