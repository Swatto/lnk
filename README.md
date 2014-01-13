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

## Why use it?

- Are you fed up of writing extra long command to target an executable file ?

```bash
~ /Users/me/dev/project1/api/build/API reboot
```

- And don't you want a cleaner .bashrc or .zshrc ?

```bash
export PATH="/Users/me/dev/project1/api/build" 
export PATH="/Users/me/dev/project2/api/v1/build" 
export PATH="/Users/me/dev/project2/api/v2/build"
# ...
```

*Linker* will be your companion for that : transform extra long command to a simple one without modifying your path again.

```bash
# The current folder contains a executable file
# named 'clientAPI'
lnk add clientAPI

The file is not executable. We are gonna change it for you.
password:
Succes: clientAPI is now added as a global executable file
```

And that's it with that simple command.


## How use it?

```
lnk add file   # Link the bin file
lnk rm file    # Unlink the bin file
lnk ls         # List bin file
```

## Remove linker from the system

To clean your system of Linker :

- Remove the 2 sentences in your .bashrc or in your .zshrc
- Run this command: `rm -fr ~/.lnk`