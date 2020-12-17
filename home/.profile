# Aliases
alias vim=nvim
alias python=python3
alias pip=pip3

alias cfv="vim ~/.config/nvim/init.vim"
alias cfp="vim ~/.profile && source ~/.profile"

# Colors for BSD ls
export LSCOLORS="exfxcxdxbxegedabagacad"
# Colors for GNU ls
alias ls="ls --color=auto"
export LS_COLORS="di=34:ln=35:so=32:pi=33:ex=31:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=30;43"

export EDITOR=nvim

[ -f ~/.local_profile ] && source ~/.local_profile
[ -f ~/.mac_profile ] && source ~/.mac_profile
[ -f ~/.flutter_profile ] && source ~/.flutter_profile
