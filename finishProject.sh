#!/bin/bash

client=$1
project=$2
path=/$HOME/Clients/$client/$project
archive=/$HOME/Archive/$client/$project

running=ps -ef | grep $path

if [ $path | wc -l > 1 ]; then
	echo "Found runnning process associated with project:"
	echo grep -v "grep" $path
	echo "Exiting now."
	exit 1
fi

if [ ! -d $path ]; 
then
	echo "Could not find project"
	exit 1

else
	if [ -f $archive/archive.tgz ]; then
		echo "Archive file already exists!"
		exit 1
	else
		mkdir -p $archive
		tar -cpzf $archive/archive.tgz $path --remove-files
	fi
fi
