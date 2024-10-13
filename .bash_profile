# seccion adicionada al final, ubicacion: /home/user/
# personalizado para mostrar el nombre del branch en un repositorio de git 
# http://askubuntu.com/questions/16728/hide-current-working-directory-in-terminal
# http://askubuntu.com/questions/442101/how-to-automatically-set-terminal-title-to-directory-name-without-path
# http://askubuntu.com/questions/232086/remove-full-path-from-terminal
# https://www.leaseweb.com/labs/2013/08/git-tip-show-your-branch-name-on-the-linux-prompt/
# http://martinvalasek.com/blog/current-git-branch-name-in-command-prompt
# http://askubuntu.com/questions/127056/where-is-bashrc

# For MacBook Pro 2015
# http://osxdaily.com/2013/02/05/improve-terminal-appearance-mac-os-x/
# https://www.cyberciti.biz/faq/apple-mac-osx-terminal-color-ls-output-option/

function parse_git_branch () {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
 
BLACK="\[\033[0;30m\]"
RED="\[\033[0;31m\]"
GREEN="\[\033[0;32m\]"
YELLOW="\[\033[0;33m\]"
BLUE="\[\033[0;34m\]"
MAGEN="\[\033[0;35m\]"
CYAN="\[\033[0;36m\]"
WHITE="\[\033[0;37m\]"
NOCOLOR="\[\033[0m\]"
 
PS1="$YELLOW\u@$GREEN\h:$MAGEN\W$BLUE\$(parse_git_branch) \n$NOCOLOR\$ "

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    # PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\w\a\]$PS1"
    ;;
*)
    ;;
esac

export CLICOLOR=1
export LSCOLORS=gxfxbxdxcxegedabagacad

# -------
# Aliases
# -------
alias l.='ls -alGhd .* --color=auto'
alias ls='ls -GFh --color'
alias ll='ls -alGh --color'
alias lll='find ./  -printf "%f\n"'
alias o="open ." # Open the current directory in Finder

# ----------------------
# Git Aliases
# ----------------------
alias gl="git log --oneline"
alias glr="git log --format=reference"
alias glf="git log --pretty='format:%C(auto)%h (%s | %an | %as)'"
# alias glc="git log --pretty='format:%C(auto)%h (%Cred%s | %Cgreen%an | %Cblue%as)'"
alias glc="git log --pretty='format:%C(auto)%h (%Cblue%as%Creset | %Cgreen%an%Creset | %Cred%s%Creset) %C(auto)%d'"
alias gs="git status -bs"
alias gd="git diff -p --stat"
alias gt="git tag --sort=-creatordate"
alias gs2='echo ""; echo "*********************************************"; echo -e "   DO NOT FORGET TO PULL BEFORE COMMITTING"; echo "*********************************************"; echo ""; git status'

# 
export HISTSIZE=5000
export HISTFILESIZE=10000

# User specific environment and startup programs
PATH=$PATH:$HOME/bin
export PATH
