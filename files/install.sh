#!/bin/bash

# Pakete installieren
pacman -Sy --noconfirm php apache php-apache mariadb mediawiki diffutils

# MySQL initialisieren
mariadb-install-db --user=mysql --basedir=/usr --datadir=/var/lib/mysql

# Mariadb Dateien importieren
rm -rf /var/lib/mysql
tar -C /var/lib -zxf mysql.tar.gz # da ist das Wiki drin
rm -rf mysql.tar.gz
chown -R mysql:mysql /var/lib/mysql

# Apache konfigurieren
mv -v httpd.conf /etc/httpd/conf/
mv -v php.ini /etc/php/
mv -v mediawiki.conf /etc/httpd/conf/extra/

# Mediawiki konfigurieren
mv -v LocalSettings.php /usr/share/webapps/mediawiki/

