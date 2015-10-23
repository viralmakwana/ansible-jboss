#!/bin/sh
#
# Apache Control Script
#
# chkconfig:  45 92 08
# description: jws

JWS_HOME=/app/apache/httpd

case $1 in
start)
echo "Start Apache"
$JWS_HOME/sbin/apachectl start
;;
stop)
echo "Stop Apache"
$JWS_HOME/sbin/apachectl stop
;;
restart)
echo "Restart Apache"
$JWS_HOME/sbin/apachectl restart
;;
status)
echo "Checking Apache status"
$JWS_HOME/sbin/apachectl status
;;
*)

;;
esac
