#!/bin/bash

# Set up variables
client=$1
project=$2
path=/$HOME/Clients/$client/$project

# Create folder structure
if [ -d $path ]; 
then
	echo "Client and Project combination already exists!"
	exit 1
else
	mkdir -p $path 2>&1
	folders="nmap pcap evidence info"
	for f in $folders 
	do
		mkdir -p $path/$f 2>&1
	done
fi
