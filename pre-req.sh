#!/bin/bash

# Author: Viral Makwana
# Company: Red Hat
# Purpose: To run a few sanity checks before we deploy JBoss EAP

# Everyone loves colours...

r='\033[31m'
w='\033[0m'
g='\e[32m'
y='\e[93m' 
b='\e[34m'

rhn_registered=$(subscription-manager status | cut -d ":" -f2 | grep Current | sed -e 's/^[ \t]*//')

# Check to see if system is registered with RHN

echo ""

echo "** This script will run basic checks before you deploy the JBoss Ansible playbook"
echo "** It will not make any changes, and you may wish to run further checks in"
echo "** addition"
echo ""

echo -e "$b[ INFO ]$w Pre deployment checks for server: `hostname`"

echo ""


if [ "$rhn_registered" != "Current" ]; then 
		echo -e "$r[ WARN ]$w System not registered, please use subscription-manager to register this system to the RHN"
	
	else echo -e "$g[ OK ]$w System is registered with the RHN"
 
fi

echo ""


#Check JDG user

if [ `id -u jboss-jdg 2> /dev/null` ]; then
		echo -e "$r[ WARN ]$w jboss-jdg user already exists here, please check its function before running the Ansible playbook" 
	else 
		echo -e "$b[ INFO ]$w jboss-jdg  user does not exist, ansible will create it for you"
fi 

echo ""

# Check Java 

which java 2> /dev/null
if [ $? -eq 0 ]; then
	echo -e "$g[ OK ]$w Java has been found on the system, please ensure you are using a supported version to accomodate JDG and JBoss EAP"
		else
	echo -e "$r[ WARN ]$w No Java has been found, unless its been installed in a custom path ? Please double check server configuration" 
fi 

echo ""

# check Apache

if [ $(rpm -qa | grep httpd | wc -l) -gt 0 ]; then
	echo -e "$r[ WARN ]$w Seems like Apache, or a package which compliments Apache ( httpd-tools )  has been installed via a package manager. Please uninstall this as it may conflict with the setup"
echo ""
	else
	echo -e "$g[ OK ]$w Seems like there is no Apache installation here, the Ansible playbook will be providing a custom Apache 2.4 installation" 
fi
