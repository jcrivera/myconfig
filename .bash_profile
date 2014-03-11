
[[ -s "$HOME/.profile" ]] && source "$HOME/.profile" # Load the default .profile

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

if [ -f `brew --prefix`/etc/bash_completion ]; then
    . `brew --prefix`/etc/bash_completion
fi

#PS1="\$(~/.rvm/bin/rvm-prompt) $PS1"

#enter functions here
function path(){
    old=$IFS
    IFS=:
    printf "%s\n" $PATH
    IFS=$old
}

function parse_git_branch {
 git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

function proml(){
 local        BLUE="\[\033[0;34m\]"
 local         RED="\[\033[0;31m\]"
 local   LIGHT_RED="\[\033[1;31m\]"
 local       GREEN="\[\033[0;32m\]"
 local LIGHT_GREEN="\[\033[1;32m\]"
 local       WHITE="\[\033[1;37m\]"
 local  LIGHT_GRAY="\[\033[0;37m\]"
 local       RESET="\[\033[0;39m\]"

 case $TERM in
  xterm*)
  TITLEBAR='\[\033]0;\W\007\]'
  ;;
  *)
  TITLEBAR=""
  ;;
 esac

 DATE="$BLUE[$RED\$(date +%H:%M)$BLUE]"
 WD="$BLUE[$RED\W$BLUE]"
 GIT="$GREEN\$(parse_git_branch)$RESET"

 export PS1="${WD}${GIT}\$ "
 export PS2='> '
 export PS4='+ '
}

PS1='$(~/.rvm/bin/rvm-prompt) \[\033[00;35m\]\w\[\033[00m\]\[\033[01;33m\]`git branch 2>/dev/null|cut -f2 -d\* -s`\[\033[00m\]\$ '
