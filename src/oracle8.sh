#!/bin/bash

# echo "nameserver $DNS_SERVER" > /etc/resolv.conf

# [ ! -e /dev/random ] && mknod -m 666 /dev/random c 1 8  >> /var/log/chroot.log 2>&1
# [ ! -e /dev/urandom ] && mknod -m 666 /dev/urandom c 1 9  >> /var/log/chroot.log 2>&1

# yum install $PKG_RPM -y >> /var/log/chroot.log 2>&1

tee /etc/yum.repos.d/ol8-epel.repo<<EOF
[ol8_developer_EPEL]
name= Oracle Linux \$releasever EPEL (\$basearch)
baseurl=https://yum.oracle.com/repo/OracleLinux/OL8/developer/EPEL/\$basearch/
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-oracle
gpgcheck=1
enabled=1
EOF

dnf makecache >> /var/log/chroot.log 2>&1

# $CURL $CONTEXT_URL/v$selected_tag/one-context-$selected_tag-1.el8.noarch.rpm -Lfo /root/context.rpm >> /var/log/chroot.log 2>&1
# yum install /root/context.rpm -y >> /var/log/chroot.log 2>&1
# rm /root/context.rpm

# rm /dev/random /dev/urandom