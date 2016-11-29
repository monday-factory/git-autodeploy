#!/bin/sh
#########################################################################
# File Name: start.sh
# Author: Petr Besir Horacek
# Email:  petr.horacek@legerete.cz
# Version: 1
# Created Time: 2016/10/27
#########################################################################

cp /var/ssh-deploy-keys/* /etc/git-auto-deploy/.ssh/
chmod 755 /etc/git-auto-deploy/.ssh
chmod 600 /etc/git-auto-deploy/.ssh/*
chown -R git-auto-deploy:git-auto-deploy /etc/git-auto-deploy

if [ -n ${SSH_KEY_CHECKING_OFF:+x} ]; then
	echo "StrictHostKeyChecking no" > /etc/git-auto-deploy/.ssh/config
	ssh -o StrictHostKeyChecking=no git@$SSH_KEY_CHECKING_OFF
	ssh-keyscan -t rsa $SSH_KEY_CHECKING_OFF  > /etc/git-auto-deploy/.ssh/known_hosts
	chmod 644 /etc/git-auto-deploy/.ssh/known_hosts
fi

service git-auto-deploy start --port 8080
service git-auto-deploy status

# keep alive the container
tail -F /var/log/git-auto-deploy.log