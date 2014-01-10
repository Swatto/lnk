#!/bin/sh
LNK_DIR="$HOME/.lnk"

# Make zsh glob matching behave same as bash
# This fixes the "zsh: no matches found" errors
if [ ! -z "$(which unsetopt 2>/dev/null)" ]; then
    unsetopt nomatch 2>/dev/null
    NVM_CD_FLAGS="-q"
fi

lnk(){
  case $1 in
    "help" )
      echo
      echo "Lnk - the bin linker for OS X"
      echo
      echo "Usage:"
      echo "  lnk help              Show this help"
      echo "  lnk add <file>        Link the bin file"
      echo "  lnk rm <file>         Link the bin file"
      echo "  lnk ls                List bin file in $LNK_DIR"
      echo
      echo "Example:"
      echo "  lnk add myProgramm    Link the myProgramm in the current folder"
      echo "  lnk rm myProgramm     Remove the link of myProgramm"
      echo
    ;;
    "add" )
      if [ "$2" ]; then
        if [ ! -f "$2" ]; then
          echo "Error: provide a file"
          exit 1
        fi
        if [[ ! -x "$2" ]]; then
          echo "The file is not executable. We're gonna change it for you."
          sudo chmod +x $2
        fi
        sudo ln $2 $HOME/.lnk/bin/$2
        echo "Succes: $2 is now added as a global executable file"
      else
      fi
    ;;
    "rm" )
      if [ "$2" ]; then
        sudo rm $HOME/.lnk/bin/$2
        echo "Succes: $2 is now remove as a global executable file"
      else
        echo "Error: provide a file"
      fi
    ;;
    "ls" )
      ls $HOME/.lnk/bin
    ;;
    * )
      lnk help
  esac
}

true