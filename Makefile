.PHONY: vim
vim:
	ln -s ${PWD}/vimrc ${HOME}/.vimrc

.PHONY: tmux
tmux:
	ln -s ${PWD}/tmux.conf ${HOME}/.tmux.conf


.PHONY: zsh
zsh:
	ln -s ${PWD}/zshrc ${HOME}/.zshrc
	ln -s ${PWD}/zsh ${HOME}/.zsh

.PHONY: bash
bash: 
	ln -s ${PWD}/bashrc ${HOME}/.bashrc


.PHONY: vscode
vscode:
	ln -s ${PWD}/vscode/keybindings.json ${HOME}/Library/Application\ Support/Code/User/keybindings.json


.PHONY: homebrew
homebrew:
	/bin/bash -c "$$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"


remove:
	-rm ${HOME}/.vimrc
	-rm ${HOME}/.tmux.conf
	-rm ${HOME}/.zshrc
	-rm -rf ${HOME}/.zsh
	-rm ${HOME}/.bashrc

	
	
	








