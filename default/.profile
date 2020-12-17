#Aliasaes
alias vim=nvim
alias python=python3
alias pip=pip3
alias python3.8=/usr/local/Cellar/python@3.8/3.8.6_2/bin/python3
alias pip3.8=/usr/local/Cellar/python@3.8/3.8.6_2/bin/pip3

alias matcli="matlab -nodesktop -nosplash"
alias mathi="pbpaste | highlight --syntax=matlab --font-size=24 -O rtf | pbcopy"
alias pyhi="pbpaste | highlight --syntax=python --font-size=24 -O rtf | pbcopy"
alias cfv="vim ~/.config/nvim/init.vim"
alias cfp="vim ~/.profile && source ~/.profile"

alias m="cd ~/master/project/"

# Colors for BSD ls
export LSCOLORS="exfxcxdxbxegedabagacad"
# Colors for GNU ls
alias ls="ls --color=auto"
export LS_COLORS="di=34:ln=35:so=32:pi=33:ex=31:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=30;43"

export EDITOR=nvim

export PATH="$PATH:/Users/david/projects/flutter/bin/"
alias flutterrun="flutter run --pid-file $HOME/.local/share/flutter.pid"


alias set-compiler="source /Users/david/projects/cppcmd/set-compiler"
