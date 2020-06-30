#!/bin/sh
#Formats MAC addresses for [internal DHCP application]
#Edvard, 2019-07-30

echo "Paste MAC to search internalProgram:" 
read input

echo $input | sed 's/[[:blank:].:-]//g' > macFile.txt 
read -r line<macFile.txt mac  
sed 's/../&:/g;s/.$//' macFile.txt >> macFile.txt
line2=$(sed -n '2p' < macFile.txt)

echo "Searching for:" $line2
echo "internalProgram -args %"$line2"%" 
rm macFile.txt
