#!/usr/bin/env bash

echo "Self update apt-get"
apt-get update

echo "Installing Base tools"
apt-get install -y curl 

echo "Installing Git and Git-flow"
apt-get install -y git git-flow

echo "Installing Node.js and npm"
#Instructions as per https://github.com/joyent/node/wiki/Installing-Node.js-via-package-manager (Vagrant runs in root/sudo mode already)
apt-get install -y python-software-properties python g++ make
# Default ubuntu version seems to be 0.6, latest as of July 2013 is 0.10.13
# chris-lea is tracking latest node version, so we use that
add-apt-repository ppa:chris-lea/node.js
apt-get update
apt-get install -y nodejs
# nodejs above includes npm --- apt-get install -y npm

echo "installing Ruby and Compass"
sudo apt-get install -y ruby1.9.1
gem install compass

echo "Installing Yeoman (with AngularJS and Laravel generators), Grunt, Gulp and Bower"
# Yeoman, Grunt, Gulp and Bower
npm install -y -g yo grunt-cli gulp bower generator-angular generator-laravel

echo "Installing Backend Tools (PHP, Composer, Laravel etc)"
# PHP (Necessary for composer install)
sudo apt-get install -y php5 php5-curl php5-cli php5-mcrypt
# Composer
sudo curl -sS https://getcomposer.org/installer | php
sudo mv composer.phar /usr/local/bin/composer
# Laravel
sudo wget http://laravel.com/laravel.phar
sudo chmod 755 laravel.phar
sudo mv laravel.phar /usr/local/bin/laravel

echo "Creating Projects folder"
mkdir -p /vagrant/projects

echo "Provisioning done."
