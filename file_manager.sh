#!/bin/bash


TODAY=$(date +"%Y-%m-%d_at_%H:%M:%S")
USER_NAME=$USER

BACKUP_PATH=~/INSTALL_BY_SCRIPT/BACKUP_FILE
NEED_FILE_DIR=~/INSTALL_BY_SCRIPT/setup_lamp_server/FILE_INCLUDE

# if hosts file will make a backup
if [[ -f /etc/hosts ]]; then
    sudo cp /etc/hosts $BACKUP_PATH/hosts.old_$TODAY
    sudo mv /etc/hosts /etc/hosts.old
fi
sudo cp $NEED_FILE_DIR/hosts /etc/



sudo cp $NEED_FILE_DIR/phpmyadmin.conf /etc/httpd/conf/extra/


if [[ -f /etc/httpd/conf/httpd.conf ]]; then
    sudo cp /etc/httpd/conf/httpd.conf $BACKUP_PATH/httpd.conf.old_$TODAY
    sudo mv /etc/httpd/conf/httpd.conf /etc/httpd/conf/httpd.conf.old
fi
sudo cp $NEED_FILE_DIR/httpd.conf /etc/httpd/conf/



if [[ -f /etc/php/php.ini ]]; then
    sudo cp /etc/php/php.ini $BACKUP_PATH/php.ini.old_$TODAY
    sudo mv /etc/php/php.ini /etc/php/php.ini.old
fi
sudo cp $NEED_FILE_DIR/php.ini /etc/php/


# copy v-host
vh_file=/etc/httpd/conf/extra/httpd-vhosts.conf

if [[ -f "$vh_file" ]]; then
    # backup the vhosts file
    sudo cp /etc/httpd/conf/extra/httpd-vhosts.conf $BACKUP_PATH/httpd-vhosts.conf.old_$TODAY
    sudo mv /etc/httpd/conf/extra/httpd-vhosts.conf /etc/httpd/conf/extra/httpd-vhosts.conf.old
fi
sudo cp $NEED_FILE_DIR/httpd-vhosts.conf /etc/httpd/conf/extra/



