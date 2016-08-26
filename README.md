# devbox

A simple, portable Vagrant box that can reasonably easily be set up on any environment to get a Linux-y environment going with minimal hassle.

## Usage

1. Download and install [Vagrant](https://www.vagrantup.com/downloads.html)
2. Download and install [VirtualBox](https://www.virtualbox.org/) - you probably need at least version 5.0+ for Ubuntu 16.4 to work.
3. Install the following vagrant plugins:

  ```
  vagrant plugin install vagrant-vbguest
  vagrant plugin install vagrant-librarian-puppet
  ```

4. `vagrant up`, and go get a coffee while things download. ☕

## What it comes with

Stuff that I care about. ;)

* Ubuntu 16.04
* Ruby 2.3.x and Bundler
* Puppet 3.8.x
* NodeJS 6.x and npm
* Python 2.x and Pip
* AWS CLI
* Docker Engine
* Docker Compose
* Git
* Vim
* zsh (with oh-my-zsh)
* Screen
