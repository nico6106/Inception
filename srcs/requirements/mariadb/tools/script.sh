
#si la BDD existe deja, ne pas la recreer
if [ -d "/var/lib/mysql/$SQL_DATABASE" ]
then
    echo "database already created"
else
    #demarrage service mysql
    service mysql start

    #etapes : 
    #   1.creation database
    #   2.creation user
    #   3.donne les droits a l'utilisateur de mariadb
    #   4.donne un nouveau mdp pour root
    mysql -e "CREATE DATABASE IF NOT EXISTS ${SQL_DATABASE};"
    mysql -e "CREATE USER IF NOT EXISTS ${SQL_USER}@'%' IDENTIFIED BY '${SQL_PASSWORD}';"
    mysql -e "GRANT ALL PRIVILEGES ON ${SQL_DATABASE}.* TO ${SQL_USER}@'%' IDENTIFIED BY '${SQL_PASSWORD}';"
    mysql -e "FLUSH PRIVILEGES;"
    mysql -e "SET PASSWORD FOR root@localhost = PASSWORD('$SQL_ROOT_PASSWORD');"
    sleep 3

    #root arrete mariadb apres configuration
    mysqladmin -u root -p$SQL_ROOT_PASSWORD shutdown
fi

#demarage de mysqld
exec mysqld_safe

