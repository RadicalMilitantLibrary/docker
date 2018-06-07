#! /usr/bin/env bash

yum update -y
yum install -y python python-devel ansible python-pip python-wheel python-setuptools #docker-compose

if [ -d "/root/.docker/config.json" ];
then
    rm -r /root/.docker/
    mkdir /root/.docker
    echo "{}" > /root/.docker/config.json
    chown ${USER}:${USER} /root/.docker
    chown ${USER}:${USER} /root/.docker/config.json
    chmod g+rw /root/.docker/config.json
fi

