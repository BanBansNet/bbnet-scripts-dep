#!/bin/bash
. path.sh

if [[ "$#" -lt "1" ]]
then
    echo "Usage: $0 <server id>"
    exit
fi

logfile="$log_dir/banbans_srv$1_*.log"
if [ ! -f $logfile ] #TODO: doesnt work
then
    echo "no logs for server $1"
else
    cat $logfile
fi
