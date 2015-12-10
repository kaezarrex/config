#!/bin/sh

# The path where the dotfiles should be installed.
INSTALL_PATH=~

# The path of the project.
BASE_PATH=$(readlink -f $SCRIPTS_PATH/..)

# List of stow packages to install, seperate by space.
PACKAGES='bash git i3 tmux vim'
