#!/bin/bash

#Making Directory for log of file
mkdir -p log

#Identify user
USER= id -u -n

#Making variabel as format name of file"
FILE="$(date +"%Y%m%d%H%M%S")"

#Making directory of file
DIR_OUT="/home/noob/log/metrics_$FILE.log" 

#Write a format to file, with path of file
echo "mem_total,mem_used,mem_free,mem_shared,mem_buff,mem_available,swap_total,swap_used,swap_free,path,path_size" > $DIR_OUT


MEM="$(free | awk '/Mem:/ {printf "%s,%s,%s,%s,%s,%s", $2,$3,$4,$5,$6,$7}')"
SWAP="$(free | awk '/Swap:/ {printf "%s,%s,%s", $2,$3,$4}')"
STORAGE="$(du -sh /home/noob | awk '{printf "%s,%s",$2,$1}')"


echo "$MEM,$SWAP,$STORAGE" >> $DIR_OUT | chmod 700 /home/noob/log/metrics_$FILE.log
