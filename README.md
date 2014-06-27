# Simple Web Dev Env

A really simple web development environment with [this tools](#tools) using [Vagrant](https://github.com/mitchellh/vagrant).

This is still a work in progress and have important things [to do](#todo).

## Quick Start

Considering that you have the [requirements](#requirements) installed, follow these steps:

1. Clone the repo:

	```sh
	git clone git@github.com:mdentinho/Simple-Web-Dev-Env.git
	```

2. Enter the repo's folder

	```sh
	cd Simple-Web-Dev-Env
	```

3. Start the VM

	```sh
	vagrant up
	```
4. Wait the provisioning (Good time to refill your coffee mug).
5. Get in to it

	```sh
	vagrant ssh
	```

## Description

### What it is

This is a web development environment I've created so I can have the same tools I use to develop web sites and web apps from anywhere I go.

It is also a cloud based backup of my environment, just in case I have any problem with my computer (hope not, but who knows).

### Why I have created it

Sometimes I need to use computers that are not mine and this automates the process to have a working development environment with all the tools I need and that I am used to.

This also allows me to share it with people that may work with me in some of my projects.

### How it works

The idea is to have an environment that replaces a development computer with all the tools I need to work with my web projects.

As the projects that I work have their own Vagrant VMs and each one of them runs their own servers, I just need the tools to develop and I run their Vagrant VMs separately.

With that said, this is **NOT a server VM** and it doesn't supose to run servers like Nginx, Apache, PostgreSQL, MySQL etc. But it has SQLite and MondoDB to speed up developments with Laravel and Node.js projects.

## Requirements:

- [VirtualBox](https://www.virtualbox.org/wiki/Downloads)
- [Vagrant](http://www.vagrantup.com/downloads.html)
- [Git](http://git-scm.com/downloads) (If you want to clone, but you can [download the zip](https://github.com/mdentinho/Simple-Web-Dev-Env/archive/master.zip) if you wish.)

I recommend that you install the [vagrant-vbguest](https://github.com/dotless-de/vagrant-vbguest) plugin to avoid incompatibilities between the VirtualBox version and the Vagrant box used.

## Specification:

### Configuration

- **OS:** Ubuntu 12.10 Precise 64bits.
- **Memory:** 512MB
- **Network:** NFS
- **IP:** 33.33.33.10

### Tools
- [Git](http://git-scm.com/)
	- [Git-flow](https://github.com/nvie/gitflow)
- [Ruby](http://ruby-lang.org/)
	- [Compass](http://compass-style.org/)
- [PHP](http://www.php.net)
	- [Composer](https://getcomposer.org)
	- [Laravel CLI](http://laravel.com/docs/quick#installation)
- [Node.js](http://nodejs.org/)
	- [Grunt](http://gruntjs.com)
	- [Gulp](http://gulpjs.com)
	- [Bower](http://bower.io)
	- [Karma](http://karma-runner.github.io)
	- [Yeoman](http://yeoman.io) 
		- [generator-angular](https://github.com/yeoman/generator-angular)
		- [generator-laravel](https://github.com/Freyskeyd/generator-laravel)
- [SQLite](http://www.sqlite.org)
- [MongoDB](http://mongodb.org)	

## Usage

When serving something inside the VM it necessary to use the `0.0.0.0` IP. Any other ip will not have the ports forwarded. Examples:

- Laravel Artisan: `php artisan serve --host="0.0.0.0"`

## ToDo:

- Add [semver](https://github.com/flazz/semver) to the provisioning
- Install [Zurb's Foundation CLI]()
- Install [Vim](http://www.vim.org) (Just in case I can't use Sublime Text)
- Test on Windows.
- Test communication with other Vagrant VMs.
- Transpose the ssh public key
- Configure it to run behind proxies
