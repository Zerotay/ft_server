rm /etc/nginx/sites-enabled/default
cp /home/default /etc/nginx/sites-enabled/
service nginx reload