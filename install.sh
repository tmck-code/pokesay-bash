#!/bin/sh

# Define install directories and names
install_path="$HOME/.pokemonsay"
bin_path="$HOME/bin"
pokemonsay_bin="pokemonsay"

# Make sure the directories exist
mkdir -p $install_path/
mkdir -p $install_path/cows/
mkdir -p $bin_path/

# Copy the cows and the main script to the install path.
tar xzf cows.tar.gz -C $install_path/
N_POKEMON=$(find $install_path/ -type f -name *.cow | wc -l)
echo -e "\nCopied $N_POKEMON Pokémon to install path '$install_path'"
cp ./pokemonsay $bin_path/$pokemonsay_bin

# Change permission of the generated scripts
chmod +x "$bin_path/$pokemonsay_bin"

echo "\

- The files were installed to '$install_path/'.
- A '$pokemonsay_bin' script was created in '$bin_path/'.

It may be necessary to logout and login back again in order to have the '$pokemonsay_bin' available in your path.
"
