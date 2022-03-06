#!/bin/bash

echo "Login Mode"
read  username
read -r -s password

path= pwd 
date=$(date '+%Y-%m-%d %H:%M:%S')
folder_date=$(date '+%Y-%m-%d')_$username

if grep -qi ${username} user.txt && grep -qi  ${password} user.txt ;
then
    echo "LOGIN: INFO User ${username} logged in"
    echo "${date} LOGIN: INFO User ${username} logged in" >>  log.txt
    echo "dl or att?"
    read command
    if [[ ${command} == att ]];
    then 
        awk -v username="$username" 'BEGIN {count=0} $6 == username || $10 == username {count++} END {print (count)}' log.txt
    elif [[ ${command} == dl ]]; 
    then 
        echo "How many pictures  do you want to download?"
        read  n
        if [[ ! -f "$folder_date.zip" ]]
        then
            echo "Zipping"
            mkdir $folder_date
            count=0
            for(( i=1; i<=$n; i++ ))
            do
                wget https://loremflickr.com/320/240 $folder_date/PIC_$i.jpg
            done 
            zip -P $password -r $folder_date.zip $folder_date/
	        rm -rf $folder_date
        else
            echo "Unzipping Mode"
            unzip -P $password $folder.zip
            rm $folder.zip
            count=$(find $folder -type f | wc -l)
            for(( i=1; i<=$n; i++ ))
            do
               wget https://loremflickr.com/320/240 $folder_date/PIC_$i.jpg
            done 
            zip -P $password -r $folder.zip $folder_date/
	        rm -rf $folder_date
        fi
    else
        echo "Wrong Command"
    fi
else
    echo "LOGIN: ERROR Failed login attempt on user ${username}"
    echo "${date} LOGIN: ERROR Failed login attempt on user ${username}" >>  log.txt
fi
