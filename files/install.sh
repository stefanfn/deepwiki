#!/bin/bash

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
ln -s /usr/share/webapps/mediawiki
[ -f LocalSettings.php ] && mv -v LocalSettings.php mediawiki/
mv -v ds9_logo.jpeg mediawiki/resources/assets/

