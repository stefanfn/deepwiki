#!/bin/bash

# Mariadb Dateien importieren
rm -rf /var/lib/mysql
tar -C /var/lib -jxf mysql.tar.bz # da ist das Wiki drin
rm -rf mysql.tar.bz
chown -R mysql:mysql /var/lib/mysql

# Apache konfigurieren
ln -s php7 /etc/php || exit 0
ln -s php7 /usr/lib/php || exit 0
mv -v httpd.conf /etc/httpd/conf/
mv -v php.ini /etc/php/ || exit 0
mv -v mediawiki.conf /etc/httpd/conf/extra/

# Mediawiki konfigurieren
ln -s /usr/share/webapps/mediawiki
[ -f LocalSettings.php ] && mv -v LocalSettings.php mediawiki/
mv -v ds9_logo.jpeg mediawiki/resources/assets/

