# Update and Upgrade Packages
apt-get update
apt-get upgrade

# Install Apache
apt-get install -y apache2
a2enmod rewrite #Enable Apache Mods

# Install PHP7 from Onrej PPA Repo
apt-get install -y software-properties-common #Missing add-apt-repository command http://lifeonubuntu.com/ubuntu-missing-add-apt-repository-command/
apt-add-repository ppa:ondrej/php
apt-get update
apt-get install -y php7.2

# Install Apache Mods
apt-get install -y libapache2-mod-php7.2
service apache2 restart

# Install MySQL
PASSWORD='root'
debconf-set-selections <<< "mysql-server mysql-server/root_password password $PASSWORD"
debconf-set-selections <<< "mysql-server mysql-server/root_password_again password $PASSWORD"
apt-get install -y mysql-server

# Install PHP Mods
apt-get install -y php7.2-common
#apt-get install -y php7.2-mcrypt #obsolete?
apt-get install -y php7.2-zip
apt-get install -y php7.2-mysql
apt-get install -y php7.2-mbstring

# Install phpmyadmin
debconf-set-selections <<< "phpmyadmin phpmyadmin/dbconfig-install boolean true"
debconf-set-selections <<< "phpmyadmin phpmyadmin/app-password-confirm password $PASSWORD"
debconf-set-selections <<< "phpmyadmin phpmyadmin/mysql/admin-pass password $PASSWORD"
debconf-set-selections <<< "phpmyadmin phpmyadmin/mysql/app-pass password $PASSWORD"
debconf-set-selections <<< "phpmyadmin phpmyadmin/reconfigure-webserver multiselect apache2"
apt-get install -y phpmyadmin

# Restart Apache
a2dismod php5 #Disable PHP-5
sudo service apache2 restart