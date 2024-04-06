#!/bin/bash


# give the full path dir 
FILES_DIR=~/INSTALL_BY_SCRIPT/setup_lamp_server/FILE_INCLUDE

sudo pacman -S mysql --needed --noconfirm

sleep 3s

sudo mysql_install_db --user=mysql --basedir=/usr --datadir=/var/lib/mysql

sudo systemctl enable mysqld
sudo systemctl start mysqld


sudo mysql_secure_installation


#     create new group call www-data 
sudo groupadd www-data


#  set permission for current user to www-data 
sudo usermod -a -G www-data $USER 


#   create the dir for phpmyadmin in /var/lib 
sudo mkdir -p /var/lib/phpmyadmin 

#   change the permission to 777 
sudo chmod 777 -R /var/lib/phpmyadmin 



sudo pacman -S phpmyadmin --noconfirm
sleep 5s

#   copy the config file into /phpmyadmin 
sudo cp $FILES_DIR/config.inc.php /etc/webapps/phpmyadmin 

#   change the ownership for www-data 
sudo chown -R $USER:www-data /etc/webapps/phpmyadmin 

sudo chmod 775 -R /etc/webapps/phpmyadmin 




echo "phpmyadmin installed and config "

#   we going to create new web project for the testing
#   the 2 lines will create new folder and 1 sub folder in lav8.x1  
#mkdir /srv/http/lav8.x1 
sudo mkdir -p /srv/http/lav8.x1/public 
sudo mkdir -p /srv/http/article.me 


sudo cp $FILES_DIR/index.php /srv/http/lav8.x1/public
sudo cp $FILES_DIR/index.html /srv/http/article.me


#   change permission to 777 (read,write,execute)
sudo chmod 777 -R /srv/http/lav8.x1 
sudo chmod 777 -R /srv/http/article.me

echo "create folder lav8.x1 article.me in /srv/http "


#   enable apache service to run on start-up
sudo systemctl enable httpd




sleep 5s


sudo systemctl restart httpd
