#!/bin/bash
#####################################################################################################################
# #
# This script is written by Cosbysweater #
# This program is open source; you can redistribute it and/or modify it under the terms of the GNU General Public #
# The author bears no responsibility for malicious or illegal use. #
# #
# #
#####################################################################################################################

#########################################################################################
# known bugs #
# None so far #
# Please report bugs to love@dufva.guru #
#########################################################################################

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
#info
ver=$(echo portscan_adv_1.0)
#Author Love "Cosbysweater" Dufva

#################################Start script and validation####################################
NOWT=$(date +"%T")

echo -e "${WARP}Enter the first 3 bytes of your network (ex. 192.168.1)${END}"
read threeb
echo ""
echo -e "${INFOS}Enter the first host to scan (ex. 1)${END}"
read fhost
echo ""
echo -e "${INFOS}Enter the last host to scan (ex. 254)${END}"
read lhost
echo ""
echo -e "${INFOS}Enter the first port to scan (ex. 1)${END}"
read fport
echo ""
echo -e "${INFOS}Enter the last port to scan (ex. 1024)${END}"
read lport
echo ""
echo -e "${INFOS}Enter the filename where you wish to save the results.${END}"
read outfile
echo ""
echo -e "${BLUE}Starting scan. Please wait until it's finished, the results will be in $outfile${END}"
for i in $(seq $fhost $lhost); do nc -v -n -z -w 1 $threeb.$i $fport-$lport >> $NOWT.txt 2>&1; done && grep succeeded $NOWT.txt > $outfile && rm $NOWT.txt && clear && cat $outfile
read -r -p "Do you want to go back to the Main menu? [y/N] " response
case $response in
[yY][eE][sS]|[yY])
        bash FikaSec
;;
    *)
        :
;;
esac
