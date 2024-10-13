# Backup default .bash_profile
eval "$(/opt/homebrew/bin/brew shellenv)"

source ~/.nvm/nvm.sh
nvm use stable
shopt -s autocd
shopt -s histappend

export PATH=$PATH:$HOME/bin

export HISTSIZE=5000
export HISTFILESIZE=10000

bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'

export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

txtred='\e[0;31m' # Red
txtgrn='\e[0;32m' # Green
bldgrn='\e[1;32m' # Bold Green
bldpur='\e[1;35m' # Bold Purple
txtrst='\e[0m'    # Text Reset

# emojis=("👾" "🌐" "🎲" "🌍" "🐉" "🌵")

# EMOJI=${emojis[$RANDOM % ${#emojis[@]} ]}

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

print_before_the_prompt () {
    dir=$PWD
    home=$HOME
    dir=${dir/"$HOME"/"~"}
    # printf "\n $txtred%s: $bldpur%s $txtgrn%s\n$txtrst" "$HOST_NAME" "$dir""$(parse_git_branch)"
    printf "$YELLOW\u@$GREEN\h:$MAGEN\W$BLUE\$(parse_git_branch)$NOCOLOR\$ "
}

PROMPT_COMMAND=print_before_the_prompt
PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"
PS1="$ "

function mkcd()
{
	mkdir $1 && cd $1
}

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
