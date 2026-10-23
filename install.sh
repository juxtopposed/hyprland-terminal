#!/bin/bash

# fastfetch
fastfetchdir="$HOME/.config/fastfetch"
mkdir -p "$fastfetchdir"
if [ -f "$fastfetchdir/config.jsonc" ]; then
    read -p "You already have a confic.jsonc in your fastfetch config directory. Would you like to override it? (yes/no) " confirm
    if [[ $confirm == "yes" ]]; then
        rm "$fastfetchdir/config.jsonc"
        cp "fastfetch/config.jsonc" "$fastfetchdir"
    else
        echo "Understandable, have a nice day."
    fi
fi
if [ -f "$HOME/Documents/saturn.txt" ]; then
    read -p "You already have a saturn.txt in your fastfetch config directory. Would you like to override it? (yes/no) " confirm
    if [[ $confirm == "yes" ]]; then
        rm "$HOME/Documents/saturn.txt"
        cp "fastfetch/saturn.txt" "$HOME/Documents"
    else
        echo "Understandable, have a nice day."
    fi
fi

# starship
starshippath="$HOME/.config/starship.toml"
if [ -f "$starshippath" ]; then
    read -p "You already have a starship.toml file. Would you like to override it? (yes/no) " confirm
    if [[ $confirm == "yes" ]]; then
        rm "$starshippath"
        cp "starship.toml" "$starshippath"
    else
        echo "Understandable, have a nice day."
    fi
fi

# fastfetch auto run
if [ -f "$HOME/.bashrc" ]; then
    echo "Found a .bashrc file. Adding fastfetch to the bottom."
    echo "fastfetch" >> "$HOME/.bashrc"
elif [ -f "$HOME/.zshrc" ]; then
    echo "Found a .zshrc file. Adding fastfetch to the bottom."
    echo "fastfetch" >> "$HOME/.zshrc"
else
    echo "Couldn't find a .bashrc file or a .zshrc file."
fi

echo "Installation complete!"