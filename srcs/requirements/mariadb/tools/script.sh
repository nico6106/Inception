
#cd /var/run/
#mkdir mysqld
#chmod -R 755 /var/run/mysqld
#cd mysqld
#touch mysqld.sock

#service mysql start;

#
#echo "creating database named " $SQL_DATABASE
#mysql -e "CREATE DATABASE IF NOT EXISTS \`${SQL_DATABASE}\`;"

#echo "creating user " $SQL_USER " with pwd=" $SQL_PASSWORD
#mysql -e "CREATE USER IF NOT EXISTS \`${SQL_USER}\`@'localhost' IDENTIFIED BY '${SQL_PASSWORD}';"

#echo "grand privilege on " $SQL_DATABASE
#mysql -e "GRANT ALL PRIVILEGES ON \`${SQL_DATABASE}\`.* TO \`${SQL_USER}\`@'%' IDENTIFIED BY '${SQL_PASSWORD}';"

#echo "alter user rootpwd " $SQL_ROOT_PASSWORD
#mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${SQL_ROOT_PASSWORD}';"

#echo "flush privileges "
#mysql -e "FLUSH PRIVILEGES;"

#mysqladmin -u root -p$SQL_ROOT_PASSWORD shutdown

#exec mysqld_safe


#service mysql start 

#echo "CREATE DATABASE IF NOT EXISTS $SQL_DATABASE ;" > db1.sql
#echo "CREATE USER IF NOT EXISTS '$SQL_USER'@'%' IDENTIFIED BY '$SQL_PASSWORD' ;" >> db1.sql
#echo "GRANT ALL PRIVILEGES ON $SQL_DATABASE.* TO '$SQL_USER'@'%' ;" >> db1.sql
#echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '12345' ;" >> db1.sql
#echo "FLUSH PRIVILEGES;" >> db1.sql

#mysql < db1.sql

#kill $(cat /var/run/mysqld/mysqld.pid)

#mysqld







#service mysql start 

#echo "service demarre \n"

#echo "CREATE DATABASE IF NOT EXISTS ${SQL_DATABASE} ;" > db1.sql
#echo "CREATE USER IF NOT EXISTS '${SQL_USER}'@'%' IDENTIFIED BY '${SQL_PASSWORD}' ;" >> db1.sql
#echo "GRANT ALL PRIVILEGES ON ${SQL_DATABASE}.* TO '${SQL_USER}'@'%' ;" >> db1.sql
#echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '${SQL_USER}' ;" >> db1.sql
#echo "FLUSH PRIVILEGES;" >> db1.sql

#mysql < db1.sql

#kill $(cat /var/run/mysqld/mysqld.pid)

#echo "seems ok after kill \n"
#mysqld --bind-address=0.0.0.0

#echo "mysqld"




#mysqladmin -u root password $SQL_ROOT_PASSWORD

if [ -d "/var/lib/mysql/$SQL_DATABASE" ]
then
    echo "database already created"
else
    service mysql start
    #mysqladmin -u root -p $SQL_ROOT_PASSWORD


    mysql -e "CREATE DATABASE IF NOT EXISTS ${SQL_DATABASE};"

    mysql -e "CREATE USER IF NOT EXISTS ${SQL_USER}@'%' IDENTIFIED BY '${SQL_PASSWORD}';"

    #mysql -u root -e "CREATE USER IF NOT EXISTS \`${SQL_USER}\`@'%' IDENTIFIED BY '${SQL_PASSWORD}';"

    mysql -e "GRANT ALL PRIVILEGES ON ${SQL_DATABASE}.* TO ${SQL_USER}@'%' IDENTIFIED BY '${SQL_PASSWORD}';"
    mysql -e "FLUSH PRIVILEGES;"
    mysql -e "SET PASSWORD FOR root@localhost = PASSWORD('$SQL_ROOT_PASSWORD');"
    #echo "alter user rootpwd " $SQL_ROOT_PASSWORD
    #mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${SQL_ROOT_PASSWORD}';"

    sleep 3
    #echo "flush privileges "
    #mysql -e "FLUSH PRIVILEGES;"



    #mysql -e "USE '${SQL_DATABASE}'; GRANT ALL PRIVILEGES ON * TO '${SQL_USER}'@'%' WITH GRANT OPTION; FLUSH PRIVILEGES;"
    echo "here2"
    #mysql -e "alter user 'root'@'localhost' identified by '${SQL_ROOT_PASSWORD}'";
    #mysql -e "FLUSH PRIVILEGES;"


    #mysql -e "CREATE DATABASE \`${SQL_DATABASE}\`;"
    #mysql -e "CREATE USER \`${SQL_USER}\`@'%' IDENTIFIED BY '${SQL_PASSWORD}';"
    #mysql -e "GRANT ALL PRIVILEGES ON \`${SQL_DATABASE}\`.* TO '\`${SQL_USER}\`'@'%';"
    ##mysql -e "FLUSH PRIVILEGES;"

    #mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${SQL_ROOT_PASSWORD}';"

    mysqladmin -u root -p$SQL_ROOT_PASSWORD shutdown
fi

exec mysqld_safe

#kill $(cat /var/run/mysqld/mysqld.pid)
#mysqld --bind-address=0.0.0.0


#mysql -e "GRANT ALL PRIVILEGES ON \`${SQL_DATABASE}\`.* TO \`${SQL_USER}\`@'%' IDENTIFIED BY '${SQL_PASSWORD}';"

#mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${SQL_ROOT_PASSWORD}';"







#service mysql start 

#echo "service demarre \n"

#mysql -e "CREATE DATABASE IF NOT EXISTS databse ;"
#mysql -e  "CREATE USER IF NOT EXISTS 'michel'@'%' IDENTIFIED BY 'michel' ;"
#mysql -e  "GRANT ALL PRIVILEGES ON databse.* TO 'michel'@'%' ;"
#mysql -e  "ALTER USER 'root'@'localhost' IDENTIFIED BY '12345' ;"
#mysql -e  "FLUSH PRIVILEGES;"

#mysql < db1.sql

#echo "commandes ok"

#kill $(cat /var/run/mysqld/mysqld.pid)

#echo "seems ok after kill"
#mysqld --bind-address=0.0.0.0

#echo "mysqld cmd"
