#!/bin/bash

curl -k -o /var/www/html/wordpress.tar.gz https://wordpress.org/latest.tar.gz
cd /var/www/html
tar -xf wordpress.tar.gz

/usr/sbin/apache2ctl -D FOREGROUND
#/bin/bash

