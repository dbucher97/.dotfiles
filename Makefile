UNAME_S := $(shell uname -s)
.PHONY: default
default: pre init post;

ifeq ($(UNAME_S),Darwin)
init : basic macos;
else
init : basic;
endif

pre :
	@echo "Pre Install"
	@if [ -f ${HOME}/.profile ] && [ ! -L ${HOME}/.profile ]; then mv ${HOME}/.profile ${HOME}/.local_profile; fi

post :
	@echo "Post Install"
	@curl -fLo ${HOME}/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim --silent
	@curl -fLo ${HOME}/.local/share/zsh/antigen.zsh --create-dirs git.io/antigen --silent

basic :
	./link .tmux.conf
	./link .profile
	./link .gitconfig
	./link .zshrc
	./link .config/alacritty
	./link .config/nvim

macos :
	./link .macos_profile

flutter :
	./link .flutter_profile
