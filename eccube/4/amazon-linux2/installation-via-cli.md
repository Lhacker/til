sudo yum update -y

# ref: https://qiita.com/azusanakano/items/b39bd22504313884a7c3
sudo mv -v /etc/localtime{,.default}
sudo ln -sf /usr/share/zoneinfo/Asia/Tokyo /etc/localtime


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
# ref: https://qiita.com/2no553/items/952dbb8df9a228195189
# Mysqlのセットアップ
# 文字コードの変更とmysql5.7からのパスワード有効期限を伸ばす（default_password_lifetime = 0）

#sudo yum install php-mysql php-common php-mbstring php-json php-xml php-zip php-cURL php-intl php-apcu php-opcache php-sqlite
sudo yum install php-common php-mbstring php-json php-xml php-zip php-cURL php-intl php-apcu php-opcache php-sqlite php-posix

php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
php -r "if (hash_file('sha384', 'composer-setup.php') === 'e0012edf3e80b6978849f5eff0d4b4e4c79ff1609dd1e613307e16318854d24ae64f26d17af3ef0bf7cfb710ca74755a') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
php composer-setup.php
sudo mv composer.phar /usr/bin/composer
sudo chown root:root /usr/bin/composer

# SQLite周りでエラーが出るが無視してOK
composer create-project ec-cube/ec-cube ec-cube4 "4.0.3" --keep-vcs
sudo mv -v ec-cube4 /var/www/html/
cd /var/www/html/ec-cube4/
bin/console eccube:install

# 参考: https://www.mahirokazuko.com/entry/2020/01/03/235548

# httpd confを設定
# 同一ディレクトリに置いているeccube4.conf を /etc/httpd/conf.d/ 配下に配置
# sudo systemctl restart httpd を実施
