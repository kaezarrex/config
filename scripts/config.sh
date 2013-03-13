#!/bin/sh

# The path where the dotfiles should be installed.
INSTALL_PATH=~

# The path of the project.
BASE_PATH=$(readlink -f $SCRIPTS_PATH/..)

# The path containing the pre-configured dotfiles.
FILES_PATH=$BASE_PATH

# The path to backup existing dotfiles from the INSTALL_PATH.
BACKUP_PATH=$BASE_PATH/backup

# List of dotfiles to install, seperate by space.
DOTFILES='.bashrc .gitconfig .gitignore_global .tmux.conf .vim .vimrc'