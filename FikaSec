#!/bin/bash

#####							#####
#####		https://github.com/fika/security	#####
#####		Authors: Saint, Cosby, Norec		#####

# ~~~~~~~~~~  Environment Setup ~~~~~~~~~~ #
    NORMAL=`echo "\033[m"`
    BLUE_TEXT=`echo "\033[36m"` #Blue
    NUMBER=`echo "\033[33m"` #yellow
    FGRED=`echo "\033[41m"`
    RED_TEXT=`echo "\033[31m"` #Red
    ENTER_LINE=`echo "\033[33m"`
    INTRO_TEXT=`echo "\033[32m"` #green and white text
    INFOS=`echo "\033[103;30m"` #yellow bg
    SUCCESS=`echo "\033[102;30m"` #green bg
    WARNING=`echo "\033[101;30m"` #red bg
    WARP=`echo "\033[106;30m"` #lightblue bg
    BLACK=`echo "\033[109;30m"` #SPACE bg
    END=`echo "\033[0m"`
# ~~~~~~~~~~  Environment Setup ~~~~~~~~~~ #

#FOR INFO SEE GITHUB

#ENTER MENU
clear
echo -e "${RED_TEXT}~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~${END}"
echo -e "${RED_TEXT}~~~~~~~~~~~~~~~~~~~~~~~~             MENU            ~~~~~~~~~~~~~~~~~~~~~~~~~${END}"
echo -e "${RED_TEXT}~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~${END}"
echo ""
echo ""
echo -e "${BLUE_TEXT}1) Netcrash - an application that targets the dhcp server and crashes it using hping3 and DHCPig."
echo ""
echo -e "${BLUE_TEXT}2) Arpion - an application that uses arp poisoning between a victim and the gateway."
echo ""
echo -e "${BLUE_TEXT}3) Portscan - an application that scans for open ports on the target system"
echo ""
echo -e "${BLUE_TEXT}9) Quit the program"

# Look for options
echo -e ""
echo -e "${RED_TEXT}SELECT:"
read option



if [ "$option" = "1" ]; then
	#STARTING NETCRASH
	bash netcrash.sh

elif [ "$option" = "2" ]; then
	#STARTING ARPION
	bash arpion.sh

elif [ "$option" = "3" ]; then
	#STARTING PORTSCAN
	bash portscan.sh
elif [ "$option" = "9" ]; then
	echo "Exiting"
	exit 0
else
echo "Please try again."
exit 0
fi



