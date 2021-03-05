rm /etc/nginx/sites-enabled/default
cp /tmp/default /etc/nginx/sites-enabled/
service nginx reload