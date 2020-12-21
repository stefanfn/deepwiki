#!/bin/bash

# DB-System starten
cd '/usr' && /usr/bin/mysqld_safe --datadir='/var/lib/mysql' &
while (! mysql_upgrade -uroot); do sleep 1; done

# Apache im Vordergrund starten
while (true); do
  echo "starting apachingctl"
  apachectl -DFOREGROUND
  echo "apachectl ends, restarting in 2 seconds"
  sleep 2
done

