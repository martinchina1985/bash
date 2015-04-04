#!/bin/sh

PID=$$
source /home/martin/.bashrc

isSilent=$1
CurDate=`date +"%Y-%m-%d_%T"`
TMPFILE=./tmp_${PID}.txt

## Mail PublicIp each day at 8:00, 12:00, 16:00, 20:00.
IPFILE=./PubIP_${CurDate}.txt
cd /home/martin/work/src/github/bash/common
./getIp.sh >$IPFILE 2>&1

CurTime=`date +"%Y-%m-%d %T"`
Title=`echo "Ip at $CurTime"`

## ./send_email.sh martin@stock.com martinchina1985@163.com 'stock test' ./cront_line_example.txt -s
echo "./send_email.sh martin@stock.com martinchina1985@163.com \"$Title\" $IPFILE -s" >>$TMPFILE 2>&1
./send_email.sh martin@stock.com martinchina1985@163.com "$Title" $IPFILE -s >>$TMPFILE 2>&1

## cat $IPFILE

if [[ ( -z $isSilent ) || ( $isSilent != "-s" ) ]] ; then
  cat $IPFILE
  cat $TMPFILE
fi

rm -f $IPFILE
rm -f $TMPFILE

exit 0
