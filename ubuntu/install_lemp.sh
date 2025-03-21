#!/bin/bash

# Exit on error
set -e

echo "Update package list"
sudo apt update -y

echo "Install Nginx"
sudo apt install -y nginx

echo "start and enable nginx"
sudo systemctl start nginx
sudo systemctl enable nginx

echo "Install MySQL"
sudo apt install -y mysql-server

echo "start and enable mariadb"
sudo systemctl start mysql
sudo systemctl enable mysql

echo "Install PHP"
sudo apt install -y php8.3 php8.3-fpm php-mysql

echo "restart nginx"
sudo systemctl restart nginx

# Script completion message
echo "LEMP stack installation completed successfully!"
