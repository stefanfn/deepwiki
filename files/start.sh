#!/bin/bash

# DB-System starten
cd '/usr' && /usr/bin/mysqld_safe --datadir='/var/lib/mysql' &
sleep 5
mysql_upgrade -uroot

# docker run -dit -p 8000:80 deepwiki apachectl -DFOREGROUND
apachectl -DFOREGROUND
