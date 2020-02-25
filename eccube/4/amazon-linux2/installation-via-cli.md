sudo amazon-linux-extras install vim

sudo yamazon-linux-extras info php7.2

# Mysqlインストール
# https://qiita.com/2no553/items/952dbb8df9a228195189
sudo yum localinstall https://dev.mysql.com/get/mysql80-community-release-el7-1.noarch.rpm -y
sudo yum-config-manager --disable mysql80-community
sudo yum-config-manager --enable mysql57-community
yum info mysql-community-server
sudo yum install -y mysql-community-server mysql-community-client

sudo systemctl start mysqld
sudo systemctl enable mysqld

sudo cat /var/log/mysqld.log | grep password

#sudo yum install php-mysql php-common php-mbstring php-json php-xml php-zip php-cURL php-intl php-apcu php-opcache php-sqlite
sudo yum install php-common php-mbstring php-json php-xml php-zip php-cURL php-intl php-apcu php-opcache php-sqlite php-posix

php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
php -r "if (hash_file('sha384', 'composer-setup.php') === 'e0012edf3e80b6978849f5eff0d4b4e4c79ff1609dd1e613307e16318854d24ae64f26d17af3ef0bf7cfb710ca74755a') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
php composer-setup.php
sudo mv composer.phar /usr/bin/composer
sudo chown root:root /usr/bin/composer

# SQLite周りでエラーが出るが無視してOK
composer create-project ec-cube/ec-cube ec-cube "4.0.3" --keep-vcs
