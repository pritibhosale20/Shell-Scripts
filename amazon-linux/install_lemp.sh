#!/bin/bash

# Exit on error
set -e

echo "Updating system packages..."
sudo yum update -y

echo "Installing Nginx..."
sudo yum install -y nginx

echo "Starting and enabling Nginx..."
sudo systemctl start nginx
sudo systemctl enable nginx

echo "Installing MariaDB..."
sudo yum install -y mariadb105-server

echo "Starting and enabling MariaDB..."
sudo systemctl start mariadb
sudo systemctl enable mariadb

echo "Installing PHP and required extensions..."
sudo yum install -y php php-mysqlnd php-fpm php-cli php-json php-common php-mbstring

echo "Starting and enabling PHP-FPM..."
sudo systemctl start php-fpm
sudo systemctl enable php-fpm

echo "Setting correct permissions..."
sudo chown -R nginx:nginx /usr/share/nginx/html

echo "LEMP stack installation completed successfully!"
