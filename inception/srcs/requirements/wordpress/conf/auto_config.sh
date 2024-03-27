#!/bin/sh

sleep 10
mkdir -p /run/php

if [ ! -f /var/www/html/wp-config.php ]; then
	wp-cli.phar config create	--allow-root \
								--dbname=$SQL_DATABASE \
								--dbuser=$SQL_USER \
								--dbpass=$SQL_PASSWORD \
								--dbhost=mariadb:3306 \
								--path='/var/www/wordpress'
	
				
	wp-cli.phar core install 	--allow-root \
								--url=${WP_URL} \
								--title=${WP_TITLE} \
								--admin_user=${WP_ADMIN_LOGIN} \
								--admin_password=${WP_ADMIN_PASSWORD} \
								--admin_email=${WP_ADMIN_EMAIL} \
								--path='/var/www/wordpress'

	wp-cli.phar user create		--allow-root ${WP_USER_LOGIN} ${WP_USER_EMAIL} \
								--user_pass=${WP_USER_PASSWORD} \
								--path='/var/www/wordpress'
fi

/usr/sbin/php-fpm7.4 -F