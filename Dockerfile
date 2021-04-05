FROM archlinux
COPY files /
RUN \
  pacman -Sy --noconfirm php7 php7-intl apache php7-apache mariadb mediawiki diffutils && \
  mariadb-install-db --user=mysql --basedir=/usr --datadir=/var/lib/mysql && \
  rm -rf /var/cache/pacman/pkg && \
  ./install.sh
EXPOSE 80

