#!/bin/sh

### Format:
# sendEmail.sh ${FromAddr} ${ToAddr} ${Subject} ${ContentFile}

## Parsing and fetch arguments list:
if [ $# != 4 ] ; then
  echo -e "\nUsage:\n$0 \${FromAddr} \${ToAddr} \${Subject} \${ContentFile} \n"
  exit 1
fi

FromAddr=$1
ToAddr=$2
Subject=$3
ContentFile=$4
TMPFILE=./feedback.tmp

## Sending the Email containing Public IP Addr.
## mail -f $FromAddr -s $Subject $ToAddr < $ContentFile 2>&1 >$TMPFILE 
echo "mail -s $Subject $ToAddr -f $FromAddr < $ContentFile"
mail -s $Subject $ToAddr -f $FromAddr < $ContentFile
if [ $? -eq 0 ]; then
  echo "Email sent successfully."
else
  echo "Failed to send Email. Reason: "
  cat feedback.tmp
fi

## Clean tmp file
rm -f $TMPFILE

exit 0
