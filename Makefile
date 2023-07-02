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

remove:
	-rm ${HOME}/.vimrc
	-rm ${HOME}/.tmux.conf
	-rm ${HOME}/.zshrc
	-rm -rf ${HOME}/.zsh
	-rm ${HOME}/.bashrc

	
	
	








