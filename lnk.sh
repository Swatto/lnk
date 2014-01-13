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
      echo -e "\e[33mLinker\e[0m - the bin exposer for OS X"
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
        if [[ ! -f "$2" ]]; then
          echo -e "\e[31mLinker error\e[0m: provide an existing file"
          return 1
        else
          if [[ -f "$LNK_DIR/bin/$2" ]]; then
            echo "A file named $2 is already present. Do you want to replace it? (y/n)"
            read yn
            case $yn in
                [Yy] ) rm $HOME/.lnk/bin/$2 >/dev/null;;
                [Nn] ) echo;echo "\e[31mLinker error\e[0m: a file named $2 is already present."; return 1;;
            esac
          fi
          if [[ ! -x "$2" ]]; then
            echo "Information: the file is not executable. We\'re gonna change it for you."
            sudo chmod +x $2 >/dev/null
          fi
          sudo ln $2 $LNK_DIR/bin/$2 >/dev/null
          echo
          echo -e "\e[32mLinker succes\e[0m: $2 is now added as a global executable file"
        fi
      fi
    ;;
    "rm" )
      if [ "$2" ]; then
        if [[ -f "$LNK_DIR/bin/$2" ]]; then
          sudo rm $LNK_DIR/bin/$2
          echo
          echo -e "\e[32mLinker succes\e[0m: $2 is now remove as a global executable file"
        else
          echo
          echo -e "\e[31mLinker error\e[0m: provide a file"
        fi
      else
        echo -e "\e[31mLinker error\e[0m: provide a file"
      fi
    ;;
    "ls" )
      ls $LNK_DIR/bin
    ;;
    * )
      lnk help
  esac
}

true