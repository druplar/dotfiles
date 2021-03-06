#!/usr/bin/env zsh

# Run order.
# 1. zshenv
# 2. zshprofile
# 3. zshrc
# 4. zshlogin
# ...
# ?. zshlogout

setopt ALL_EXPORT
setopt NULL_GLOB

# Load subscripts
for f in ~/.zsh/*.zsh; do
  [ -x $f ] && source $f
done

# Load RVM into a shell session *as a function* if it exists
if [[ -d $HOME/.rvm ]]; then
  append-path $HOME/.rvm/bin
fi
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

unset i
unset f
unsetopt NULL_GLOB
unsetopt ALL_EXPORT
