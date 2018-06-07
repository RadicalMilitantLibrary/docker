#! /usr/bin/env bash

VERSION=2.1.1

if [ ! -x vagrant_${VERSION}_x86_64.deb ]
then
apt install wget
wget https://releases.hashicorp.com/vagrant/${VERSION}/vagrant_${VERSION}_x86_64.deb
fi
sudo dpkg -i vagrant_${VERSION}_x86_64.deb

vagrant plugin install vagrant-vbguest
vagrant plugin install vagrant-sshfs
#vagrant plugin install vagrant-libvirt
