#!/bin/bash
echo -e "Skriv yes för att spara annars avbryts det om 10" 
read -t 10 yes  
if [ "$yes"  == "yes" ] ; then
echo -e "yes"
else
echo -e "skiten avbröts"
fi
