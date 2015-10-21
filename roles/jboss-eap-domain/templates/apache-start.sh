#!/bin/sh
#
# Apache Control Script
#
# chkconfig:  45 92 08
# description: jws

APACHE_HOME=/opt/jboss/httpd

case $1 in
start)
echo "Start Apache"
$APACHE_HOME/sbin/apachectl start
;;
stop)
echo "Stop Apache"
$APACHE_HOME/sbin/apachectl stop
;;
restart)
echo "Restart Apache"
$APACHE_HOME/sbin/apachectl restart
;;
status)
echo "Checking Apache status"
$APACHE_HOME/sbin/apachectl status
;;
*)

;;
esac
