#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...

SRC="`df | grep -m 1 ' /mnt/sd[a-z][0-9]' | awk '{ print $6 }' | sed 's/\/var.*//'`"
MYBOOT2DOCKER=$SRC/myboot2docker

if ! { [ -n "$TMUX" ]; } then
  $MYBOOT2DOCKER/tools/ascii-art.sh
else
  bindkey "^N"   history-substring-search-down
  bindkey "^P"   history-substring-search-up
  bindkey "^[OA" history-substring-search-up
  bindkey "^[OB" history-substring-search-down
fi

echo zshrc is called...

VL1=\"\$(pwd)\":/app
VL2=/var/run/docker.sock:/var/run/docker.sock
PRJ=COMPOSE_PROJECT_NAME=\$(basename \"\$(pwd)\")

TERM=xterm
