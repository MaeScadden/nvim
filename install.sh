npm install -g vscode-langservers-extracted
npm install -g @tailwindcss/language-server
npm install -g typescript typescript-language-server

mkdir $HOME/.fonts
mv ./Fira* $HOME/.fonts

sudo apt install python3-venv -y

git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim

echo "open nvim and run :PackerSync"
