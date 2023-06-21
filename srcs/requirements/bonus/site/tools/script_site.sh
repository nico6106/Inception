
if [ -f /tmp/nico.html ]
then
    echo "to see"
    #mv /tmp/nico.html /var/www/html/nico.html
else
    echo "ls /var/www/html/"
    cd /var/www/html/
    ls -la
    
    echo "ls /var/www/html/static"
    cd /var/www/html/static
    ls -la
fi
