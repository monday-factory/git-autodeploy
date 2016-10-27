#!/bin/sh
#########################################################################
# File Name: start.sh
# Author: Petr Besir Horacek
# Email:  petr.horacek@legerete.cz
# Version: 1
# Created Time: 2016/10/27
#########################################################################

cp /var/ssh-deploy-keys/* /etc/git-auto-deploy/.ssh/
chmod 600 /etc/git-auto-deploy/.ssh/*
chown -R git-auto-deploy:git-auto-deploy /etc/git-auto-deploy

service git-auto-deploy start --port 8080
service git-auto-deploy status

cat /var/log/git-auto-deploy.log
echo "" > /var/log/git-auto-deploy.log

# keep alive the container
tail -F -n0 /dev/null