#!/bin/sh

install_files(){
    stow -d $BASE_PATH -t $INSTALL_PATH $PACKAGES
}

post_install(){
    # Install/update/clean vim bundles through Vundle.
    vim +PluginInstall! +PluginClean +qall < /dev/tty
}
