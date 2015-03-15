#!/bin/sh

## E.g: #ftp_sync_nodir.sh $REMOTE_SERVER get asc

## Usage: 
# $0 "$SERVER_IP" "get\put" "asc\bin" "$FILE_NAME"

HOST=$1

USR=ftp
PWD=111
## Command: get\put
CMD=$2
## bin\asc
AS_SWITH=$3
FILE=$4

ft_str="from"
if [ $CMD == "put" ] ; then
  ft_str="to"
fi

echo "FTP: $CMD $3 [$FILE] $ft_str $HOST .."

## Final: ftp call 
ftp -i -n << END
open $HOST
user $USR $PWD
$AS_SWITH
$CMD $FILE
bye
END

echo "ok."
