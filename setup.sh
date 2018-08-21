#!/bin/bash
. path.sh
echo "----------------------------------"
echo "     BanBansNetwork setup.sh      "
echo "----------------------------------"
echo "this script should only be launched one time"
echo "it fully installs bbnet"
read -p "Do you really want to run it? Write 'n' to abort" inp
if [ "$inp" == "n" ]; then
exit
elif [ "$inp" == "N" ]; then
exit
elif [ "$inp" == "No" ]; then
exit
elif [ "$inp" == "no" ]; then
exit
elif [ "$inp" == "NO" ]; then
exit
fi


if [[ "$USER" == "banbans" ]]
then
    current_dir=`pwd`
    if [[ "$current_dir" == "$root_dir/bbnet-scripts" ]]
    then
        cd $root_dir
        cd bbnet-scripts
        cd cfg
        echo "echo [bbnet] loading rcon..." > rcon.cfg
        echo "sv_rcon_password \"change me\"" >> rcon.cfg
        echo "sv_rcon_mod_password \"change me\"" >> rcon.cfg
        vi rcon.cfg
        echo "echo [bbnet] loading sql passwd..." > sql.cfg
        echo "add_sqlserver r teeworlds record teeworlds \"change me\" \"localhost\" \"3306\"" >> sql.cfg
        echo "add_sqlserver w teeworlds record teeworlds \"change me\" \"localhost\" \"3306\"" >> sql.cfg
        vi sql.cfg
        cd $root_dir
        git clone https://github.com/BanBansNet/bbnet-maps
        mv bbnet-maps maps
        git clone https://github.com/ddnet/ddnet --recursive
        cd bbnet-scripts
        ./build.sh
        echo "Done installing bbnet."
    else
        echo "working directory has to be $root_dir/bbnet-scripts"
    fi
else
    echo "you have to be user banbans to install BanBansNet"
fi
