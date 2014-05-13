#!/bin/bash
#created by norec for testing purposes

host=$host
firstport=$firstport
lastport=$lastport

echo "Which IP do you want to scan?"
read host
echo "Which port do you want to start with?"
read firstport
echo "Which port do you want to end with??"
read lastport
clear

function portscan

{
for ((counter=$firstport; counter<=$lastport; counter++))
        do
                (echo >/dev/tcp/$host/$counter) > /dev/null 2>&1 && echo "$counter open"
done
}

portscan
