#!/bin/bash

# Exit on error
set -e

echo "Updating system packages..."
yum update -y

echo "Installing Apache Web Server..."
yum install -y httpd

echo "Start and enable Apache service"
systemctl start httpd
systemctl enable httpd

echo "Installing MariaDB..."
yum install -y mariadb105-server

echo "Start and enable MariaDB service"
systemctl start mariadb
systemctl enable mariadb

echo "Install PHP and required modules"
yum install -y php php-fpm php-mysqlnd

echo "Start and enable php-fpm"
sudo systemctl start php-fpm
sudo systemctl enable php-fpm

echo "Restarting Apache to load PHP"
systemctl restart httpd

echo "Setting proper permissions"
chown -R apache:apache /var/www/html
chmod -R 755 /var/www/html

echo "Creating a test PHP file"
echo "<?php phpinfo(); ?>" > /var/www/html/info.php

# Print success message
echo "LAMP stack installed successfully! You can verify PHP at http://your-server-ip/info.php"
