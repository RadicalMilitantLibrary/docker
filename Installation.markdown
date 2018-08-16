# Requirements

For Virtualmachine:

* [Vagrant](https://www.vagrantup.com/downloads.html)
* [VirtualBox](https://www.virtualbox.org/wiki/Downloads)

Directly on your system:

* docker-ce
* docker-compose
* ansible-container
* python
* python-pip

Repo: `git clone https://github.com/RadicalMilitantLibrary/docker-container.git`

# Installation
1. Clone git repository: `git clone https://github.com/RadicalMilitantLibrary/docker-container.git`
2. Change into repository: `cd docker-container`


## For running in a virtualmachine:

1. `sudo apt install vagrant virtualbox-qt`
2. `vagrant plugin install vagrant-vbguest`
3. `vagrant plugin install vagrant-sshfs`


## ensure Vagrant not older than 2.0

Test for version: `vagrant -v`
If not installed or version number below 2.0: `sudo bash ./install_vagrant.sh`

Info: If your OS is Windows, Centos, Mac OS X or another Linux distro as Debian look at
<https://www.vagrantup.com/downloads.html> and download install package for your system.

## Configuration ##

Edit configuration:

  ``$EDITOR ansible-container/config.yml``

If you want to create a random password and/or salt, e.g.:

```
len=128
set=_A-Z-a-z0-9
< /dev/urandom tr -dc ${set} | head -c${1:-${len}};echo;
```

## Setup and run ##

If setup is finished on http://localhost:8080 and https://localhost:8443
can open the webpage.

### Virtualmachine ###

Setup your RML instanz and run

  ``cd vagrant && vagrant up --provision``

### On the own Machine ###

You need a centos or fedora to run it on your host machine.

  ```
  cd ansible && ansible-playbook prepare.yml
  cd ansible && ansible-playbook setup\_data.yml
  cd ansible && ansible-playbook setup\_postgres.yml
  cd ansible-container
  ansible-container build
  ansible-container run
  ```

#### Get onion adresse

  ```
  vagrant ssh
  sudo docker exec -it radicalmilitantlibrary_tor_1 onions
  ```

#### Install and Configure git

1. Install git `yum install -y git`
2. setup username `git config --global user.name ${name}`
3. setup email `git config --global user.email ${name}@users.noreply.github.com`

More Information about git: https://git-scm.com/doc

## Troubleshoot

On http://localhost:9000 you can open a managment ui for the docker container.

### Builderror

If an error dropped like:

```
conductor_id=3f239e1cd7d671412ee68a44c259cf468c315cd2dcf14b38029d4724aa540f41
save_container=False
    default: ERROR      Conductor exited with status 1
```

You can skip the build process to the docker build process.

```
cd /vagrant_data/ansible-container
ansible-container halt
ansible-container destroy  # optional
ansible-container build
ansible-container run
```
