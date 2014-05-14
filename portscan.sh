#!/bin/bash
#####################################################################################################################
#                                                                                                                   #
#                                               This script is written by Norec                                     #
# This program is open source; you can redistribute it and/or modify it under the terms of the GNU General Public   #
#                               The author bears no responsibility for malicious or illegal use.                    #
#                                                                                                                   #
#                                                                                                                   #
#####################################################################################################################

#########################################################################################
#                                       known bugs                                      #
#                                       None so far                                     #
#                               Please report bugs to Cosby!                            #
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
ver=$(echo portscan_1.0)
#Author Markus "Norec" Hertzén

#################################Start script and validation####################################
host=$host
firstport=$firstport
lastport=$lastport

echo -e "${RED_TEXT}Which IP do you want to scan?${END}"
read host
echo -e "${RED_TEXT}Which port do you want to start with?${END}"
read firstport
echo -e "${RED_TEXT}Which port do you want to end with?${END}"
read lastport
clear

function portscan

{
for ((counter=$firstport; counter<=$lastport; counter++))
        do
                (echo >/dev/tcp/$host/$counter) > /dev/null 2>&1 && echo -e "${RED_TEXT}$counter open${END}"
done
}

portscan
