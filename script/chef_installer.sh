#!/bin/sh

set -e

function main() {
  exit_if_chef_installed
  install_chef_dependencies
  install_rubygems
  install_chef
}

function exit_if_chef_installed() {
  if [ -e /usr/bin/chef-solo ]; then
    echo Chef is installed
    exit 0
  fi
}

function install_chef_dependencies() {
  yum -y install ruby ruby-devel ruby-ri ruby-rdoc ruby-shadow gcc \
         gcc-c++ automake autoconf make curl dmidecode
}

function install_rubygems() {
  cd /tmp
  curl -O http://production.cf.rubygems.org/rubygems/rubygems-1.8.10.tgz
  tar zxf rubygems-1.8.10.tgz
  cd rubygems-1.8.10
  ruby setup.rb --no-format-executable
}

function install_chef() {
  gem install chef --no-ri --no-rdoc
}

main

