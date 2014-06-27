#!/usr/bin/env bash

echo "Self update apt-get"
apt-get update

echo "Installing Base tools"
apt-get install -y curl 

echo "Installing Git and Git-flow"
apt-get install -y git git-flow
# To avoid problems with the SSH authentication
git config --global url."https://".insteadOf git://

echo "Installing Node.js and npm"
#Instructions as per https://github.com/joyent/node/wiki/Installing-Node.js-via-package-manager (Vagrant runs in root/sudo mode already)
apt-get install -y python-software-properties python g++ make
# Default ubuntu version seems to be 0.6, latest as of July 2013 is 0.10.13
# chris-lea is tracking latest node version, so we use that
add-apt-repository ppa:chris-lea/node.js
apt-get update
apt-get install -y nodejs
# nodejs above includes npm --- apt-get install -y npm

echo "installing MongoDB"
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv 7F0CEB10
echo "deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen" | sudo tee -a /etc/apt/sources.list.d/10gen.list
sudo apt-get update
sudo apt-get install mongodb-10gen

echo "installing Ruby and Compass"
sudo apt-get install -y ruby1.9.1
gem install compass

echo "Installing Frontend Tools: Grunt, Gulp, Bower, Karma, PhantomJS and Yeoman (with AngularJS and Laravel generators)"
# Yeoman, Grunt, Gulp and Bower
npm install -y -g grunt-cli gulp bower karma yo generator-angular generator-laravel
# PhantomJS
sudo apt-get install -y libfontconfig
cd /usr/local/share/
sudo wget https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-1.9.7-linux-i686.tar.bz2
sudo tar xjf phantomjs-1.9.7-linux-i686.tar.bz2
sudo ln -s /usr/local/share/phantomjs-1.9.7-linux-i686/bin/phantomjs /usr/local/share/phantomjs
sudo ln -s /usr/local/share/phantomjs-1.9.7-linux-i686/bin/phantomjs /usr/local/bin/phantomjs
sudo ln -s /usr/local/share/phantomjs-1.9.7-linux-i686/bin/phantomjs /usr/bin/phantomjs

echo "Installing Backend Tools (PHP, Composer, Laravel etc)"
# PHP
sudo add-apt-repository -y ppa:ondrej/php5
sudo apt-get update
sudo apt-get install -y php5 php5-curl php5-cli php5-mcrypt
# Composer
sudo curl -sS https://getcomposer.org/installer | php
sudo mv composer.phar /usr/local/bin/composer
# Laravel
sudo wget http://laravel.com/laravel.phar
sudo chmod 755 laravel.phar
sudo mv laravel.phar /usr/local/bin/laravel
# SQLite
sudo apt-get install -y sqlite3 libsqlite3-dev php5-sqlite

echo "Creating Projects folder"
mkdir -p /vagrant/projects
ln -s /vagrant/projects projects
sudo mv projects /home/vagrant

echo "Provisioning done."
