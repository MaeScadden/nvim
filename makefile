default:
	# linux
	echo "hello world"

#
linux:
	sudo add-apt-repository ppa:neovim-ppa/stable
	sudo apt-get update -y
	sudo apt-get install neovim -y
	sudo apt-get install python-dev python-pip python3-dev python3-pip
	# needed for coq
	sudo apt install python3-venv -y
	# lazy git
	./scripts/lazygit.sh

	# predone makes
	$(MAKE) font
	$(MAKE) languages
	$(MAKE) language_servers
	$(MAKE) tree_sitter_servers

mac:
	# install brew
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
	brew install neovim
	brew install python
	brew install python3
	# lazy git
	./scripts/lazygit.sh
	# needed for coq?
	# python3-venv
	# predone makes
	$(MAKE) languages
	$(MAKE) language_servers
	$(MAKE) tree_sitter_servers

tree_sitter_servers:
	echo 'Please run'
	echo ':TSInstall cmake markdown typescript javascript python rust html lua bash json gitignore c tsx vim yaml'

headless_nvim_steps:
	echo 'Run these commands in neovim'
	echo ':PackerSync'
	echo ':COQdeps'

languages:
	# node js
	./scripts/node.sh
	# rust
	curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh


packer:
	git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim

font:
	mkdir $(HOME)/.fonts
	cp ./fonts/* $(HOME)/.fonts

language_servers:
	# pyright
	npm i -g pyright
	# tsserver
	npm i -g typescript typescript-language-server
	# eslint
	npm i -g vscode-langservers-extracted
	# angularls
	npm i -g @angular/language-server
	npm i -g @angular/language-service
	# rust_analyzer
	./scripts/rust_analyzer.sh
	# clangd
	./scripts/clangd.sh
