#! /usr/bin/env bash


apt-get update
apt-get install -y \
         apt-transport-https \
         ca-certificates \
         curl \
         gnupg2 \
         software-properties-common \
         dirmngr \
         linux-headers-amd64
curl -fsSL https://download.docker.com/linux/$(. /etc/os-release; echo "$ID")/gpg | sudo apt-key add -
add-apt-repository \
       "deb [arch=amd64] https://download.docker.com/linux/$(. /etc/os-release; echo "$ID") \
       $(lsb_release -cs) stable"
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 93C4A3FD7BB9C367
echo "deb http://ppa.launchpad.net/ansible/ansible/ubuntu xenial main" \
    > /etc/apt/sources.list.d/ansible.list
apt-get update
apt-get upgrade -y
apt-get install -y docker-ce
systemctl enable docker
systemctl start docker
apt-get install -y ansible python python-pip python-dev docker-compose
pip install --upgrade pip
pip install ansible-container[docker] "docker<3.0"
