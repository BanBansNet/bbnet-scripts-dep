#!/bin/bash
. path.sh
cd $root_dir
cd chircohn
fails=0
succs=0
for config in $cfg_dir/*.cfg
do
	./chircohn.py $config -mod syntax/ddnet_rcon_cmds.txt
	error=$?
	if [[ "$error" -gt "0" ]]
	then
		echo -e "\e[1;31m[Test]\e[0m $config test \e[1;31mFAILED!\e[0m"
		let "fails++"
	else
		echo -e "\e[1;32m[Test]\e[0m $config test \e[1;32msuccessfull\e[0m"
		let "succs++"
	fi
done
echo "+---------------------------------+"
echo "Test finished:"
echo -e "\e[1;32m[Success] $succs \e[0m"
echo -e "\e[1;31m[Fails] $fails \e[0m"
echo "+---------------------------------+"
