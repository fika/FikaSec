#!/bin/bash

NOWT=$(date +"%T")

echo "Enter the first 3 bytes of your network (ex. 192.168.1)"
read threeb
echo ""
echo "Enter the first host to scan (ex. 1)"
read fhost
echo ""
echo "Enter the last host to scan (ex. 254)"
read lhost
echo ""
echo "Enter the first port to scan (ex. 1)"
read fport
echo ""
echo "Enter the last port to scan (ex. 1024)"
read lport
echo ""
echo "Enter the filename where you wish to save the results."
read outfile
echo ""
echo "Starting scan. Please wait until it's finished, the results will be in $outfile"
for i in $(seq $fhost $lhost); do nc -v -n -z -w 1 $threeb.$i $fport-$lport >> $NOWT.txt 2>&1; done && grep succeeded $NOWT.txt > $outfile && rm $NOWT.txt
