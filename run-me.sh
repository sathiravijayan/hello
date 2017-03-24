#!/bin/bash
    # term_size3 - Dynamically display terminal window size
    #              with text centering
ACTUAL="passwd"
read -s -p "Password: " enteredpass
echo ""

[ "$enteredpass" != "$ACTUAL" ] && echo "Sorry" && echo "exiting" || echo "Conti.."

clear
    tput smso;echo "This Program is created by Justin Joseph "; tput rmso
    tput blink;echo "========================================";tput sgr0
    echo
	tput sgr0
    echo


	#local width height length
	width=$(tput cols)
	height=$(tput lines)
	title1="HELLO SIR....PLEASE FOLLOW THE INSTRUCTIONS !!!"
	length=${#title1}

	

tput cup $((height / 2)) $(((width / 2) - (length / 2)))
	echo "$title1"

 	
#COLUMNS=$(tput cols) 
#title="HI SIR....! PLEASE FOLLOW THE INSTRUCTIONS."
#printf "%*s\n" $(((${#title1}+$COLUMNS)/2)) "$title1"

sleep 7;clear

USER=foss

title2="ADDING A NEW USER $USER --- "

tput cup $((height / 2)) $(((width / 2) - (length / 2)))
echo "$title2"

sleep 5;clear

sudo useradd $USER -s /bin/bash -d /home/$USER

if [ $? -eq 0 ]; then
	sudo echo $USER:password | chpasswd --crypt-method=SHA512
	sudo mkdir /home/$USER
	sudo chown $USER:$USER /home/$USER
	sudo chmod u+rwx /home/$USER
	sudo chmod -R go-w /home/$USER
	sudo usermod -a -G adm,dialout,plugdev,lpadmin,sambashare,sudo $USER
	title3="SUCCESSFULLY CREATED A USER $USER WITH PASSWORD=password"
	tput cup $((height / 2)) $(((width / 2) - (length / 2)))
	echo "$title3"
	sleep 5
	clear
else
	title0="ERROR OCCURED WHILE CREATING A NEW USER..PLEASE CONTACT WITH YOUR ADMINISTRATOR!!!!!"	
	tput cup $((height / 2)) $(((width / 2) - (length / 2)))
	echo "$title0"

fi

sleep 5
clear
echo "YOUR SYSTEM NOW STARTS DOWNLOADING SOFTWARES FROM THE REPOSITORIES. IT WILL TAKE TIME..BE COOL AND RELAX"
sleep 3
title4="FAIL TO UPDATE YOUR REPOSITORY....CHECK YOUR INTERNET CONNECTION!!!!!"
ping -c 4 google.com

if [ $? -eq 0 ]; then

    echo OK
    echo "YOUR INTERNET CONNECTION IS OK...UPDATION BEGINS..!!!"
	sleep 5
	sudo apt-get update
	sudo apt-get -y install virtualbox gambas3 synaptic checkinstall kernel-package libncurses5 libncurses5-dev apache2 php5 libapache2-mod-php5 php5-mysql phpmyadmin
	sudo apt-get source linux-image-$(uname -r)
	sudo apt-get build-dep linux-image-$(uname -r)
	sudo apt-get build-dep pidgin

	sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password password root'
	sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password root'
	sudo apt-get -y install mysql-server
	sudo apt-get -y install mysql-client

else
	
	tput cup $((height / 2)) $(((width / 2) - (length / 2)))
	echo "$title4"
    
fi
sudo php5enmod mcrypt
sudo service apache2 restart;clear


title5="NEW SOFTWARES ARE INSTALLED SUCCESSFULLY. MACHINE IS NOW REBOOT......THANK YOU.....!!!!!"
tput cup $((height / 2)) $(((width / 2) - (length / 2)))
	echo "$title5"

sudo reboot


