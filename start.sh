#!/bin/bash
. path.sh

#if (( $# != 1 )); then
if [[ "$#" -lt "1" ]]
then
    echo "Usage: $0 <server id> <debug 1/0>"
    exit
fi
is_debug=$2

cd $root_dir;
port=$(( 8310 + $1 ))
echo "sv_name BanBansNetwork by ChillerDragon GER $1" > $cfg_dir/tmp.cfg
echo "sv_port $port" >> $cfg_dir/tmp.cfg
echo "echo [BanBansNet] started server $1 at port $port" >> $cfg_dir/tmp.cfg
logfile="$log_dir/banbans_srv$1_$(date +%F_%H-%M-%S).log"
mkdir -p $log_dir
nohup ./BanBans_srv server=$1 -f $cfg_dir/autoexec.cfg > $logfile 2>&1 &
#nohup ./BanBans_srv > /dev/null 2>&1 &
echo -e "\e[1;32m[+]\e[0m started server $1"

if [[ "$is_debug" == "1" ]]
then
    echo "loading logs..."
    sleep 5
    cat $logfile
fi
