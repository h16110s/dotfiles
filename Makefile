
# 各設定ファイルのインストール方法

vim:
	ln -s ${PWD}/vimrc ~/.vimrc

tmux:
	ln -s ${PWD}/tmux.conf ~/.tmux.conf

zsh:
	ln -s ${PWD}/zshrc ~/.zshrc

bash: 
	ln -s ${PWD}/bashrc ~/.bashrc


# それぞれの環境でのインストール
all: vim tmux zsh bash

mac: vim tmux zsh

wsl: vim tmux bash
linux: wsl


clean:
	-rm ${HOME}/.vimrc
	-rm ${HOME}/.tmux.conf
	-rm ${HOME}/.zshrc
	-rm ${bashrc}

	
	
	








