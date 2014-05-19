#!/bin/bash
#####################################################################################################################
#                                                                                                                   #
#                           This script is written by Johan aka Saint, admin of Webbh4tt                            #
# This program is open source; you can redistribute it and/or modify it under the terms of the GNU General Public   #
#                         The author bears no responsibility for malicious or illegal use.                           #
#                                                                                                                   #
#                                                                                                                   #
#####################################################################################################################

#########################################################################################
#                                    known bugs                                         #
#                                   None so far                                         #
#                     Please report bugs to info@webbhatt.com                           #
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
ver=$(echo arpion_1.0)
#Author Johan "Saint" B�rjesson

#################################Start script and validation####################################
echo -n "Searching for tunnels"
while true
do
if ps aux | grep "ssh -N -f"
then
echo -e "${SUCCESS}"SSH tunnels are up"${END}
else
echo -e "${WARNING}"SSH tunnels are down"${END}
echo -e "${RED_TEXT} "Something is wrong please check your settings"${END}
bash sshtunnel.sh
fi

