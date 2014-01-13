#!/bin/bash

LNK_DIR="$HOME/.lnk"

if ! hash git 2>/dev/null; then
  echo >&2 "You need to install git - visit http://git-scm.com/downloads"
  exit 1
fi

echo
echo "---------------------------------"
echo "Linker - the bin exposer for OS X"
echo "---------------------------------"
echo

if [ -d "$LNK_DIR" ]; then
  echo "Linker is already installed in $LNK_DIR, trying to update it"
  cd $LNK_DIR && git pull >/dev/null
  echo "Succes: Linker is up to date"
else
  echo "Installation in progress"
  echo "..."
  git clone https://github.com/Swatto/lnk.git $LNK_DIR >/dev/null
  echo "Success: Linker is installed!"
  echo
  echo "Please add those sentence in your .bashrc or .zshrc to use it."
  echo "-------------------------------------------------"
  echo "[ -s \$HOME/.lnk/lnk.sh ] && . \$HOME/.lnk/lnk.sh"
  echo "export PATH=\"$HOME/.lnk/bin\""
  echo "-------------------------------------------------"
fi
