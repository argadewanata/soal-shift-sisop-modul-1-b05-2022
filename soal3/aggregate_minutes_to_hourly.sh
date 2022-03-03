#!/bin/bash

#gabut 
USER= id -u -n
echo Hy $USER

#buat variabel biar ezzz
Date= $(date + '%Y%m%d%H')
Nfile= "metric_agg_$Date"
Poffile= pwd

