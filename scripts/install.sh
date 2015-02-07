#!/bin/sh

# The path containing the scripts.
export SCRIPTS_PATH=$(pwd)

. $SCRIPTS_PATH/config.sh
. $SCRIPTS_PATH/functions.sh

install_files

post_install
