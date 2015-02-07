#!/bin/sh

TARGET_PATH=~/.dotfiles
VUNDLE_PATH=$TARGET_PATH/vim/.vim/bundle/Vundle.vim

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

# Check whether stow exists.
stow --version &> /dev/null || {
     echo 'Stow is not installed on this system.'
     exit 1
}

echo "Cloning dotfiles to $TARGET_PATH"
git clone https://github.com/kaezarrex/config.git $TARGET_PATH

echo "Cloning vundle to $VUNDLE_PATH"
git clone https://github.com/gmarik/Vundle.vim.git $VUNDLE_PATH

echo 'Installing dotfiles.'
$TARGET_PATH/scripts/install.sh

echo 'Finished!'
