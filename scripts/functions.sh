#!/bin/sh

install_file(){
    # args: filename
    # Backup target_file, then create symlink target_file -> source_file.
    filename=$1

    source_file=$FILES_PATH/$filename
    target_file=$INSTALL_PATH/$filename
    backup_file=$BACKUP_PATH/$filename

    # Backup
    if [ -e $target_file ]; then
        echo "Backing up '$target_file' to '$backup_file'."
        mv $target_file $backup_file
    fi

    # Create symlink of target_file -> source_file
    echo "Creating symlink for '$target_file'."
    ln -s $source_file $target_file
}

uninstall_file(){
    # args: filename
    # Remove symlink target_file -> source_file, then restore target_file.
    filename=$1

    target_file=$INSTALL_PATH/$filename
    backup_file=$BACKUP_PATH/$filename

    # Remove symlink from target_file
    if [ -L $target_file ]; then
        echo "Removing installed symlink '$target_file'."
        unlink $target_file
    fi

    # Restore
    if [ -e $backup_file ]; then
        echo "Restoring '$target_file' from backup."
        mv $backup_file $target_file
    fi
}

pre_install(){
    # Create the backup folder.
    mkdir -p $BACKUP_PATH
}

post_install(){
    # Install/update/clean vim bundles through Vundle.
    vim +BundleInstall! +BundleClean +qall
}
