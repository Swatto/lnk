#!/bin/bash

LNK_DIR="$HOME/.lnk"

if ! hash git 2>/dev/null; then
  echo >&2 "You need to install git - visit http://git-scm.com/downloads"
  echo >&2 "or, use install-gitless.sh instead."
  exit 1
fi

if [ -d "$LNK_DIR" ]; then
  echo "=> LNK is already installed in $LNK_DIR, trying to update"
  echo -ne "\r=> "
  cd $LNK_DIR && git pull
else
  echo "Lnk: install..."
  git clone https:\/\/github.com\/swatto\/lnk.git $LNK_DIR
  echo
  echo "Please add those sentence in your .bashrc or .zshrc to use LNK"
  echo "-------------------------------------------------"
  echo "[ -s \$HOME/.lnk/lnk.sh ] && . \$HOME/.lnk/lnk.sh"
  echo "export PATH=\"$HOME/.lnk/bin\""
  echo "-------------------------------------------------"
fi
