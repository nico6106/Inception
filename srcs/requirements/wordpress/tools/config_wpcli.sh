#!/bin/sh

sleep 2




if [ -f ./wp-config.php ]
then
	echo "wordpress already downloaded"
else
	wget http://wordpress.org/latest.tar.gz
	tar xfz latest.tar.gz
	mv wordpress/* .
	rm -rf latest.tar.gz
	rm -rf wordpress

	#Inport env variables in the config file
	sed -i "s/username_here/$SQL_USER/g" wp-config-sample.php
	sed -i "s/password_here/$SQL_PASSWORD/g" wp-config-sample.php
	sed -i "s/localhost/$SQL_HOSTNAME/g" wp-config-sample.php
	sed -i "s/database_name_here/$SQL_DATABASE/g" wp-config-sample.php
	cp wp-config-sample.php wp-config.php
fi

if [1]
then
	echo oups
else

	echo "try to create config wordpress"

	cd /var/www/html

	#installation WP-CLI : telechargement archive + installation (changement en executable + deplacer dans dossier)
	#wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
	#chmod +x wp-cli.phar
	#mv wp-cli.phar /usr/local/bin/wp

	mv /var/www/wp-config.php /var/www/html/wp-config.php
	sed -i -r "s/SQL_DATABASE/$SQL_DATABASE/1"   wp-config.php
	sed -i -r "s/SQL_USER/$SQL_USER/1"  wp-config.php
	sed -i -r "s/SQL_PASSWORD/$SQL_PASSWORD/1"    wp-config.php


	cd /var/www/html/

	wp core download --allow-root

	#wp core config --allow-root --dbname='wordpress' --dbuser='wpuser' --dbpass='password' --dbhost='mariadb:3306' --dbprefix='wp_'

	#wp core install --allow-root --url='http://nlesage.42.fr' --title='Blog Title' --admin_user='adminuser' --admin_password='password' --admin_email='email@domain.com' --skip-email

	wp core install --url=$DOMAIN_NAME/ --title=$WP_TITLE --admin_user=$WP_ADMIN_USR --admin_password=$WP_ADMIN_PWD --admin_email=$WP_ADMIN_EMAIL --skip-email --allow-root

	wp plugin install wordpress-seo --allow-root
	wp plugin activate wordpress-seo --allow-root

	wp theme install twentyfourteen --allow-root
	wp theme activate twentyfourteen --allow-root


	#wp config create	--allow-root \
	#					--dbname=$SQL_DATABASE \
	#					--dbuser=$SQL_USER \
	#					--dbpass=$SQL_PASSWORD \
	#					--dbhost=mariadb:3306 --path='/var/www/wordpress'

	#--url=$DOMAIN_NAME/

	#wp core install --title=$WP_TITLE --admin_user=$WP_ADMIN_USR --admin_password=$WP_ADMIN_PWD --admin_email=$WP_ADMIN_EMAIL --skip-email --allow-root

	#wp user create $WP_USR $WP_EMAIL --role=author --user_pass=$WP_PWD --allow-root

	#wp theme install astra --activate --allow-root


	sed -i 's/listen = \/run\/php\/php7.3-fpm.sock/listen = 9000/g' /etc/php/7.3/fpm/pool.d/www.conf

	#/usr/sbin/php7.3 -F
	#/usr/sbin/php-fpm7.3 -F

fi