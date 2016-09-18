#!/bin/bash
# BASH SCRIPT TO SETUP RAILS DEVELOPMENT ENVIRONMENT IN UBUNTU 14.04

echo "**********************************************************"
echo "Installing dependencies"
echo "**********************************************************"

# Sublime Text 3
sudo add-apt-repository -y ppa:webupd8team/sublime-text-3
# PostgreSQL
sudo sh -c "echo 'deb http://apt.postgresql.org/pub/repos/apt/ precise-pgdg main' > /etc/apt/sources.list.d/pgdg.list"
wget --quiet -O - http://apt.postgresql.org/pub/repos/apt/ACCC4CF8.asc | sudo apt-key add -
sudo apt-get update
# Common dependecies - GIT, NodeJs, Sqlite, Curl, ...
sudo apt-get -y install git-core curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev python-software-properties libgdbm-dev libncurses5-dev automake libtool bison libffi-dev nodejs

echo "**********************************************************"
echo "Installing RVM"
echo "**********************************************************"

sudo apt-get -y install gnupg2
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
curl -sSL https://get.rvm.io | bash -s stable
sudo chmod -R 777 /usr/local/rvm/
source /usr/local/rvm/scripts/rvm
echo "source /usr/local/rvm/scripts/rvm" >> ~/.bashrc

echo "**********************************************************"
echo "Installing Ruby"
echo "**********************************************************"

rvm install 2.3.1
rvm use 2.3.1 --default

echo "**********************************************************"
echo "Installing Bundler & Rails"
echo "**********************************************************"

gem install bundler
gem install rails

echo "**********************************************************"
echo "Configure local git"
echo "**********************************************************"

git config --global color.ui true
git config --global user.name "partheey"
git config --global user.email "parthi1993@gmail.com"
ssh-keygen -t rsa -b 4096 -C "parthi1993@gmail.com"

echo "**********************************************************"
echo "Install Sublime 3.0"
echo "**********************************************************"

sudo apt-get install -y sublime-text-installer

echo "**********************************************************"
echo "Installing PostgreSQL"
echo "**********************************************************"

sudo apt-get -y install postgresql-common postgresql-9.5 libpq-dev
sudo -u postgres createuser partheey -s

echo "**********************************************************"
echo "Installing Mysql"
echo "**********************************************************"

sudo apt-get -y install mysql-server mysql-client
