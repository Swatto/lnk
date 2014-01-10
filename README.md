# Linker

A simple shell script to manage bin in your system. [Video](http://www.youtube.com/watch?v=lOPM136U2Q4)

## Installation

Built and tested on OS X

```shell
curl https://raw.github.com/swatto/lnk/master/install.sh | sh
```

You must load the lnk script to your environnement and the bin folder too. Please add those sentence in your .bashrc or .zshrc

```
[ -s $HOME/.lnk/lnk.sh ] && . $HOME/.lnk/lnk.sh
export PATH="$HOME/.lnk/bin"
```

## Use

```
lnk add file   # Link the bin file
lnk rm file    # Unlink the bin file
lnk ls         # List bin file
```