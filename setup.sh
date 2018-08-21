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
    if [[ "$current_dir" == "$srv_dir/bbnet-scripts" ]]
    then
        cd $srv_dir
        git clone https://github.com/BanBansNet/bbnet-maps
        mv bbnet-maps maps
        git clone https://github.com/ddnet/ddnet --recursive
        cd bbnet-scripts
        ./build.sh
        echo "Done installing bbnet."
    else
        echo "working directory has to be $srv_dir/bbnet-scripts"
    fi
else
    echo "you have to be user banbans to install BanBansNet"
fi
