#!/bin/zsh

function parse_git_branch() {
  local BRANCH=$(git branch -a 2> /dev/null | grep "^* " | sed -e 's/^\* //')
  if [[ "$BRANCH" == "(no branch)" ]]; then
    BRANCH=$(git name-rev HEAD 2> /dev/null | sed 's#HEAD \(.*\)#*\1#')
  fi

  if [[ -n "$BRANCH" ]]; then
    echo " $PR_LIGHT_BLACK""[$PR_NO_COLOR$PR_RED$BRANCH$PR_LIGHT_BLACK]$PR_NO_COLOR"
  fi
}

function chpwd() {
  SCM_BRANCH=$(parse_git_branch)
}

# Ensure this hook is called to do initial setup if needed
chpwd

