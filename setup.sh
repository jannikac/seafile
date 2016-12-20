#!/bin/sh

###################################################################################

#DISCLAIMER: THIS SCRIPT IS FOR MY PERSONAL USE ONLY I WILL NOT TAKE RESPONSIBILITY
#FOR BROKEN SYSTEMS/ LOST CONFIGURATION0S

###################################################################################

USER=$(whoami)


function help {
	printf "
	Usage: setup.sh [OPTION]
	
  	-h, --help		prints this
  	-i, --install		installs files
	-r, --remove		uninstalls files

"
}

function remove {
	systemctl disable seafile.service
	systemctl disable seahub.service

	rm /etc/systemd/system/seafile.service -v
	rm /etc/systemd/system/seahub.service -v
}


function install {
	
	cp systemd/* /etc/systemd/system/ -v

	systemctl enable seafile.service
	systemctl enable seahub.service
	
}

if ! [ $(id -u) = 0 ]; then
	printf "Please run this script as root.\n"
	exit
fi

case $1 in
	--help|-h )
		help
		;;
	--install|-i) 
		install
		;;
	--remove|-r)
		remove
		;;
	* )
		help
		;;
esac
