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
	printf "touch temporary file to gain sudo priviliges.. "
	sudo touch .tmp
	printf "done\n"

	printf "disabling seafile.service and seahub.service.. "
	sudo systemctl disable seafile.service
	sudo systemctl disable seahub.service
	printf "done\n"

	printf "removing /etc/systemd/system/seafile.service and /etc/systemd/system/seahub.service.. "
	sudo rm /etc/systemd/system/seafile.service
	sudo rm /etc/systemd/system/seahub.service
	printf "done\n"

	printf "removing temporary file.. "
	rm .tmp -f
	printf "done\n"

}


function install {
	
	printf "touch temporary file to gain sudo priviliges.. "
	sudo touch .tmp
	printf "done\n"
	
	printf "copying systemd/* to /etc/systemd/system/.. "
	sudo cp systemd/* /etc/systemd/system/
	printf "done\n"

	printf "enabling seafile.service and seahub.service.. "
	sudo systemctl enable seafile.service
	sudo systemctl enable seahub.service
	printf "done\n"
	
	printf "removing temporary file.. "
	rm .tmp -f
	printf "done\n"

}

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
