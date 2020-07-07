#/bin/bash

#starts ssh

/usr/sbin/sshd

#Starts php process in background

/usr/sbin/php-fpm5.6 -c /etc/php/5.6/fpm

#starts nginx daemon

nginx -g 'daemon off;'
