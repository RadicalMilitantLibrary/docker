#! /usr/bin/env bash

apt install wget
wget https://releases.hashicorp.com/vagrant/2.0.2/vagrant_2.0.2_x86_64.deb
dpkg -i vagrant_2.0.2_x86_64.deb
