#!/bin/bash

# DB-System starten
cd '/usr' && /usr/bin/mysqld_safe --datadir='/var/lib/mysql' &
sleep 2
while (! mysql_upgrade -uroot); do sleep 1; done
php7 /usr/share/webapps/mediawiki/maintenance/update.php || exit 1

# Apache im Vordergrund starten
while (true); do
  echo "starting apachingctl"
  apachectl -DFOREGROUND
  echo "apachectl ends, restarting in 2 seconds"
  sleep 2
done

