#!/usr/bin/env bash

root=$(pwd)

echo -e "reinitializing $HOME/bin/"
rm -rf ~/bin
mkdir ~/bin
cd scripts
for file in *; do
    ln -s $root/scripts/$file $HOME/bin
    echo -e "    adding $file to $HOME/bin/"
    chmod +x $HOME/bin/$file
done

echo -e ""

# add ~/bin to our PATH if it hasn't been added already
if [[ ":$PATH:" == *":$HOME/bin:"* ]]; then
    echo -e "$HOME/bin is already in PATH"
else
    echo -e "$HOME/bin isn't in PATH. adding it."
    PATH=$PATH:$HOME/bin
    export PATH
fi
cd ..
