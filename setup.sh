#!/bin/bash
. path.sh
echo "----------------------------------"
echo "     BanBansNetwork setup.sh      "
echo "----------------------------------"
echo "this script should only be launched one time"
if [ -f $root_dir/bbnet-scripts/.bbnet_setup_done ]
then
    echo -e "\e[1;31m[ERROR] setup already done.\e[0m" 
    exit
fi
echo "it fully installs bbnet"
if [ -d "$root_dir" ]
then
    echo "bbnet will be installed at=$root_dir"
    if [ -d "$src_path" ]
    then
        echo -e "\e[1;31m[WARNING]\e[0m src_dir=$src_path already exist!"
    else
        echo "ddnet src will be installed at=$src_path"
    fi
else
    echo -e "\e[1;31m[WARNING]\e[0m root_dir=$root_dir doesn't exist!"
fi
echo "Do you really want to run it? Write 'n' to abort"
read -n 1 -p "" inp
if [ "$inp" == "n" ]; then
    printf "\n[bbnet] stopped setup.\n"
    exit
elif [ "$inp" == "N" ]; then
    printf "\n[bbnet] stopped setup.\n"
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
        vim rcon.cfg
        echo "echo [bbnet] loading sql passwd..." > sql.cfg
        echo "add_sqlserver r teeworlds record teeworlds \"change me\" \"localhost\" \"3306\"" >> sql.cfg
        echo "add_sqlserver w teeworlds record teeworlds \"change me\" \"localhost\" \"3306\"" >> sql.cfg
        vim sql.cfg
        cd $root_dir
        git clone https://github.com/ChillerDragon/chircohn
        git clone https://github.com/BanBansNet/bbnet-maps
        mv bbnet-maps maps
        git clone https://github.com/ddnet/ddnet --recursive
        cd bbnet-scripts
        ./build.sh
        ./test-cfg.sh
        touch .bbnet_setup_done
        echo "[setup.sh] Done installing bbnet."
    else
        echo "working directory has to be $root_dir/bbnet-scripts"
    fi
else
    echo "you have to be user banbans to install BanBansNet"
fi
