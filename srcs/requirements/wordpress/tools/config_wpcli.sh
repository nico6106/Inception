#!/bin/sh

sleep 8

DATADIR='/var/www/html/'

#si WP deja installe, on ne le configure pas a nouveau 
if [ -f ./wp-config.php ]
then
	echo "wordpress already downloaded"
else
	#installation wp et configuration
	wp --allow-root core download
	wp --allow-root config create --dbname=${SQL_DATABASE} --dbuser=${SQL_USER} --dbpass=${SQL_PASSWORD} --dbhost="mariadb":"3306" 
	wp --allow-root --skip-email core install --url=${DOMAIN_NAME} --title=${WP_TITLE} --admin_user=${WP_ADMIN_USR} --admin_password=${WP_ADMIN_PWD} --admin_email=${WP_ADMIN_EMAIL}
	#ajout utilisateur WP
	wp --allow-root user create $WP_USR $WP_EMAIL --role='editor' --user_pass=${WP_PWD}

	wp theme install twentytwentyone --allow-root
	wp theme activate twentytwentyone --allow-root

fi

#modification des droits apres installation (pour etre sur...)
cd /var/www/html
chown -R www-data:www-data /var/www/html

#lancement php7.3
/usr/sbin/php-fpm7.3 -F
