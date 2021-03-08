#!/bin/ash

USERHOME='/home/ssh-user'
AUTHFILE="$USERHOME/.ssh/authorized_keys"
mkdir -p $USERHOME/.ssh
curl -o $AUTHFILE $KEYURI
chmod go-rwx $AUTHFILE
chown ssh-user $AUTHFILE

/usr/sbin/sshd -D
