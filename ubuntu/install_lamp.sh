#!/bin/bash

# Exit script on error
set -e

echo "Updating package list..."
sudo apt update -y

echo "Installing Apache..."
sudo apt install -y apache2

echo "Starting and enabling Apache..."
sudo systemctl start apache2
sudo systemctl enable apache2

echo "Installing MySQL..."
sudo apt install -y mysql-server

echo "Starting and enabling MySQL..."
sudo systemctl start mysql
sudo systemctl enable mysql

echo "Installing PHP and required modules..."
sudo apt install -y php8.3 libapache2-mod-php php-mysql

echo "Restarting Apache to apply changes..."
sudo systemctl restart apache2

echo "LAMP stack installation completed successfully!"
