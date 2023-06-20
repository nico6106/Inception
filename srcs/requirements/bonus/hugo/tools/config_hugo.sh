
cd /tmp
if [ -f ./done.empty ]
then
    echo "hugo already installed"
else
    touch done.empty
    cd /var/www/
    hugo new site quickstart
    cd quickstart
    git init
    git submodule add https://github.com/theNewDynamic/gohugo-theme-ananke themes/ananke
    echo "theme = 'ananke'" >> hugo.toml
    
fi
#hugo server