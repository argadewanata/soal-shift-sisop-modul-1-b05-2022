#!/bin/bash

#gabut 
USER= id -u -n
echo Hy $USER

#buat variabel biar ezzz
Date=$(date +"%Y%m%d%H")
Pattern= echo "mem_total,mem_used,mem_free,mem_shared,mem_buff,mem_available,swap_total,swap_used,swap_free,path,path_size"
DIR_OUT="/home/noob/log/metrics_$Date.log"

#Checkin var of file when it have "mem", used grep
check_var() {
	for file in $($DIR_OUT/log/metrics* | grep $Date)
	do cat $file | grep -v mem 
	done
}

#Gain the value from every output file


#Input without replace oldes value
echo $Pattern  >> $DIR_OUT
