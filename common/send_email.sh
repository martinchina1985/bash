#!/bin/sh

PID=$$

### Format:
# sendEmail.sh ${FromAddr} ${ToAddr} ${Subject} ${ContentFile} [-s]

FromAddr=$1
ToAddr=$2
Subject=$3
ContentFile=$4
isSilent=$5
TMPFILE=./feedback_${PID}.txt

## Parsing and fetch arguments list:
if [ $# -lt 4 ] ; then
  echo -e "\nUsage:\n$0 \${FromAddr} \${ToAddr} \${Subject} \${ContentFile} [-s]\n"
  exit 1
fi

## 0 fail, 1 success
successFlag=0

## Sending the Email containing Public IP Addr.

## mail -a ./correct_crontab_line_01.crond -r martin@stock01.com -s test martinchina1985@163.com < ./body.txt
echo "mail -r $FromAddr -a $TMPFILE -s \"$Subject\" $ToAddr < $ContentFile" >> $TMPFILE 2>&1
mail -r $FromAddr -a $TMPFILE -s "$Subject" $ToAddr < $ContentFile >> $TMPFILE 2>&1


if [ $? -eq 0 ]; then
  echo "Email sent successfully." > $TMPFILE 2>&1
  successFlag=1
else
  echo "Failed to send Email. Reason: " >> $TMPFILE 2>&1
  successFlag=0
fi

if [[ ( -z $isSilent ) || ( $isSilent != "-s" ) ]] ; then
  cat $TMPFILE
fi

## Clean tmp file
rm -f $TMPFILE

if [ $successFlag -eq 1 ] ; then
  exit 0
else
  exit 1
fi
