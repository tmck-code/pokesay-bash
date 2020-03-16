#!/bin/sh

# Define install directories and names
pokemonsay_bin="pokesay"
install_path="$HOME/.${pokemonsay_bin}"
bin_path="$HOME/bin"

# Make sure the directories exist
mkdir -p $install_path/
mkdir -p $install_path/cows/
mkdir -p $bin_path/

# Remove any previously installed cows
rm -rf $install_path/cows/*

# Copy the cows and the main script to the install path.
tar xzf cows.tar.gz -C $install_path/
N_POKEMON=$(find $install_path/ -type f -name *.cow | wc -l)
cp $pokemonsay_bin $bin_path/$pokemonsay_bin
chmod +x "$bin_path/$pokemonsay_bin"
echo "\nCopied $N_POKEMON Pokémon to install path '$install_path'"

echo "\

- The files were installed to '$install_path/'.
- A '$pokemonsay_bin' script was created in '$bin_path/'.

"$HOME/bin" must be in your \$PATH to be able to use pokesay, you can do this by running

  echo 'export PATH=\$HOME/bin:\$PATH' >> \$HOME/.bash_profile

After starting a new terminal session you should have the '$pokemonsay_bin' available in your path.
"
