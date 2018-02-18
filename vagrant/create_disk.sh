set -e
set -x

if [ -f /etc/provision_env_disk_added_date ]
then
    echo "Provision runtime already done."
    exit 0
fi


sudo fdisk -u /dev/sdb <<EOF
n
p
1



w
EOF

sudo fdisk -u /dev/sdc <<EOF
n
p
1



w
EOF

mkfs.ext4 /dev/sdb1
mkdir /var/lib/docker
mount -t ext4 /dev/sdb1 /var/lib/docker

mkfs.ext4 /dev/sdc1
mkdir /var/lib/postgresql
mount -t ext4 /dev/sdc1 /var/lib/postgresql

echo "/dev/sdb1     /var/lib/docker   auto    rw,user,auto    0    0" >> /etc/fstab
echo "/dev/sdc1     /var/lib/postgresql   auto    rw,user,auto    0    0" >> /etc/fstab

date > /etc/provision_env_disk_added_date
