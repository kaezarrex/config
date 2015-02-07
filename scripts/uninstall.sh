#!/bin/sh

# The path containing the scripts.
export SCRIPTS_PATH=$(dirname $(readlink -f $0))


. $SCRIPTS_PATH/config.sh
. $SCRIPTS_PATH/functions.sh

stow -d $BASE_PATH -t $INSTALL_PATH -D $PACKAGES
