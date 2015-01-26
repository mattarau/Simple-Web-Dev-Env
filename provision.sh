#!/usr/bin/env bash

echo "Self update apt-get and install base tools"
sudo apt-get update
sudo apt-get install -y git-core curl unzip zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev python-software-properties
sudo apt-get install -y libgdbm-dev libncurses5-dev automake libtool bison libffi-dev
sudo apt-get install -y language-pack-UTF-8

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
echo "installing Ruby and Compass"
# Ruby
curl -L https://get.rvm.io | bash -s stable
source ~/.rvm/scripts/rvm
echo "source ~/.rvm/scripts/rvm" >> ~/.bashrc
rvm install 2.1.2
rvm use 2.1.2 --default
# Compass
sudo gem install compass

echo "installing MongoDB"
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv 7F0CEB10
echo "deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen" | sudo tee -a /etc/apt/sources.list.d/10gen.list
sudo apt-get update
sudo apt-get install mongodb-10gen

echo "Auto remove apt-get"
sudo apt-get autoremove

echo "Installing Frontend Tools: Grunt, Gulp, Bower, Karma, PhantomJS and Yeoman (with a few generators)"
# Yeoman, Grunt, Gulp and Bower
sudo npm install -y -g grunt-cli gulp bower karma-cli yo generator-angular generator-gulp-angular generator-meanjs generator-ionic generator-laravel
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
