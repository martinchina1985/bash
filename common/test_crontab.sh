#!/bin/sh

# */5 * * * * martin /bin/echo "crontab test at `/bin/date +"%Y-%m-%d %T"`" >>/var/run/crontab_test.log 2>&1
/bin/echo "crontab test at `/bin/date +"%Y-%m-%d %T"`" >>/var/run/crontab_test.log 2>&1
