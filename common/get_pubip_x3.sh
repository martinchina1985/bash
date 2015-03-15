#!/bin/sh

s1=`date +"%s"`
IP_FROM_SITE_01=`curl -s -X GET http://ip.bajiu.org |grep font |grep color |awk '{if(NR==2)print}' |tr "<>" "\n" |awk '{if(NR==7)print}'`
echo "IP_FROM_SITE_01(ip138): $IP_FROM_SITE_01"
e1=`date +"%s"`
c1=`expr $e1 - $s1`
echo "Cost 1: $e1 - $s1 = $c1"

s2=`date +"%s"`
IP_FROM_SITE_02=`curl -s -X GET http://ipshi.com |grep br |grep nbsp |tr "<" "\n" |awk '{if(NR==1)print $1}'`
echo "IP_FROM_SITE_02(ipshi): $IP_FROM_SITE_02"
e2=`date +"%s"`
c2=`expr $e2 - $s2`
echo "Cost 2: $e2 - $s2 = $c2"

s3=`date +"%s"`
IP_FROM_SITE_03=`curl -s -X GET http://www.ip138.com/ips138.asp |grep align |grep center |awk '{if(NR==6)print}' |tr "[" "\n" |tr "]" "\n" |awk '{if(NR==2)print}'`
echo "IP_FROM_SITE_03(bajiu): $IP_FROM_SITE_03"
e3=`date +"%s"`
c3=`expr $e3 - $s3`
echo "Cost 3: $e3 - $s3 = $c3"
