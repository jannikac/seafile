#!/bin/sh

###################################################################################

#DISCLAIMER: THIS SCRIPT IS FOR MY PERSONAL USE ONLY I WILL NOT TAKE RESPONSIBILITY
#FOR BROKEN SYSTEMS/ LOST CONFIGURATION0S

###################################################################################

arg1=$1
USER=$(whoami)


function help {
	printf "
	Usage: install.sh [OPTION]
	
  	-h, --help		prints this menu
  	-i, --install		installs files
"
}

function install {
	
	# touching temporary file to gain sudo priviliges
	sudo touch .tmp
	
	#copying systemd/* to /etc/systemd/system/ and enabling seafile.service and seahub.service
	sudo cp systemd/* /etc/systemd/system/
	sudo systemctl enable seafile.service
	sudo systemctl enable seahub.service
	
	#removing temporary file
	rm .tmp -f

}

case $arg1 in
	--help|-h )
		help
		;;
	--install|-i) 
		install
		;;
	* )
		help
		;;
esac
