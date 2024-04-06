#!/bin/bash

# =============== first run ============
echo "this will setup LAMP server"

# make main dir
mkdir -p ~/INSTALL_BY_SCRIPT

MAIN_DIR=~/INSTALL_BY_SCRIPT


# enter the dir
pushd $MAIN_DIR

echo "we are now in $MAIN_DIR and download the installer file"
git clone https://github.com/farookphuket/setup_lamp_server.git 

# now will get the folder "setup_lamp_server" 
pushd setup_lamp_server 


# create the backup folder
mkdir -p $MAIN_DIR/BACKUP_FILE
BACKUP_DIR=$MAIN_DIR/BACKUP_FILE


# run the mysql install script
sh setup_mysql.sh


# =================================================================================
# =========== you have to install java to using dbeaver =======================
sudo pacman --needed --noconfirm -S jre-openjdk dbeaver 

# =================================================================================

# change the mod to 777 
sudo chmod 777 -R $BACKUP_DIR

# ============= copy vhost file to httpd



echo "now created the backup directory!"

popd 

sleep 5
echo "ok clone now"
