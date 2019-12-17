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
N_POKEMON=$(find cows/ -type f -name *.cow | wc -l)
echo "Copying $N_POKEMON Pokemon to install path '$install_path'"
cp -R ./cows $install_path/
cp ./pokemonsay.sh $install_path/

# Create the pokemonsay script in the home bin directory.
cat > $bin_path/$pokemonsay_bin <<- EOF
	#!/bin/sh

	# This script changes to the pokemonsay installation directory,
	# runs the main script for running the pokemonsay, and changes
	# back to the previous directory.

	cd $install_path/
	./pokemonsay.sh \$@
	cd - >/dev/null
EOF

# Change permission of the generated scripts
chmod +x "$bin_path/$pokemonsay_bin"

echo "\
- The files were installed to '$install_path/'.
- A '$pokemonsay_bin' script was created in '$bin_path/'.
- A uninstall script was created in '$install_path/'.
It may be necessary to logout and login back again in order to have the '$pokemonsay_bin' available in your path.
"
