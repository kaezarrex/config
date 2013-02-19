#!/bin/sh

TARGET_PATH=~/.dotfiles

# Check whether TARGET_PATH exists.
if [ -d $TARGET_PATH ]; then
    echo "It seems dotfiles are already installed. You have to remove $TARGET_PATH before continue installing."
    exit 1
fi

# Check whether git exists.
git --version &> /dev/null || {
     echo 'Git is not installed on this system.'
     exit 1
}

echo "Cloning dotfiles to $TARGET_PATH"
git clone https://github.com/kaezarrex/config $TARGET_PATH

echo 'Installing dotfiles.'
$TARGET_PATH/scripts/install.sh

echo 'Finished!'
