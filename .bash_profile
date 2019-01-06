
#------------------------------------------------------------------------------
# Colors
#------------------------------------------------------------------------------
export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]\$ "
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad
alias ls='ls -GFh'
alias lsal="ls -al"

#------------------------------------------------------------------------------
# Git Prompt
# https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh
#------------------------------------------------------------------------------
#source /usr/local/bin/git-completion.bash
source ~/.git-prompt.sh

function git-dirty {
  st=$(git status 2>/dev/null | grep 'nothing to commit')

  if [[ $st != "nothing to commit, working directory clean" ]]
  then
    echo "**"
  fi
}

#-----------------------------------------------------------------------------
# Set Prompt
#-----------------------------------------------------------------------------
function prompt
{
  local WHITE="\[\033[1;37m\]"
  local GREEN="\[\033[0;32m\]"
  local CYAN="\[\033[0;36m\]"
  local CYAN_BOLD="\[\033[1;36m\]"
  local GRAY="\[\033[0;37m\]"
  local BLUE="\[\033[0;34m\]"
  local RED="\033[0;31m\]"

  export PS1="${RED}< ${CYAN}\t \W${GREEN} "'$(__git_ps1 "(%s$(git-dirty))") '"${RED}%> ${GREEN}"
  #export PS1="${RED}< ${CYAN}\t \W${GREEN} ${RED}%> ${GREEN}"
}
prompt


#-----------------------------------------------------------------------------
# File and Folder Management
#-----------------------------------------------------------------------------

zipf () { zip -r "$1".zip "$2" ; }          # zipf:         To create a ZIP archive of a folder
alias numFiles='echo $(ls -l | wc -l)'      # numFiles:     Count of the non-hidden files in the current dir
