if [ "$AUTOINDEX" = off ] ;
then mv tmp/default /etc/nginx/sites-available/ ;
else mv home/default /etc/nginx/sites-available/ ;
fi


wget https://files.phpmyadmin.net/phpMyAdmin/5.0.4/phpMyAdmin-5.0.4-all-languages.tar.gz
tar -xvf phpMyAdmin-5.0.4-all-languages.tar.gz
mv phpMyAdmin-5.0.4-all-languages phpmyadmin
rm phpMyAdmin-5.0.4-all-languages.tar.gz
mv phpmyadmin /var/www/html/

mv home/config.inc.php /var/www/html/phpmyadmin/
chmod 644 /var/www/html/phpmyadmin/config.inc.php

openssl req -newkey rsa:4096 -days 365 -nodes -x509 \
-subj "/C=KR/ST=Yongin/L=Suji/O=42Seoul/OU=Cadet/CN=localhost" \
-keyout localhost.dev.key -out localhost.dev.crt
chmod 600 localhost.dev.key localhost.dev.crt
mv localhost.dev.crt etc/ssl/certs/
mv localhost.dev.key etc/ssl/private/


service mysql start
mysql < /home/run.sql

wget https://wordpress.org/latest.tar.gz
tar -xvf latest.tar.gz
mv wordpress/ var/www/html/
chown -R www-data:www-data /var/www/html/wordpress

chmod 644 /home/wp-config.php
mv /home/wp-config.php /var/www/html/wordpress

service nginx start
service php7.3-fpm start
ls
