#!/bin/bash

# DB-System starten
cd '/usr' && /usr/bin/mysqld_safe --datadir='/var/lib/mysql' &
while (! mysql_upgrade -uroot); do sleep 1; done

# Apache im Vordergrund starten
apachectl -DFOREGROUND
