FROM archlinux
RUN pacman -Sy --noconfirm php apache php-apache mariadb mediawiki diffutils
RUN mariadb-install-db --user=mysql --basedir=/usr --datadir=/var/lib/mysql
COPY files /
RUN ./install.sh
EXPOSE 80

