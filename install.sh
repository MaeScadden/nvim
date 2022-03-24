# install neovim
sudo add-apt-repository ppa:neovim-ppa/stable
sudo apt-get update -y
sudo apt-get install neovim -y
sudo apt-get install python-dev python-pip python3-dev python3-pip

# add  fonts
mkdir $HOME/.fonts
mv ./Fira* $HOME/.fonts

# add language servers for vscode, tailwind, and typescript
npm install -g vscode-langservers-extracted
npm install -g @tailwindcss/language-server
npm install -g typescript typescript-language-server

# needed for coq, lsp completion
sudo apt install python3-venv -y

# packer, manager for neovim
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim

echo "open nvim and run :PackerSync"
