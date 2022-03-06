#!/bin/bash

path=pwd
echo "Register Mode"

read  username

read -r -s password
date=$(date '+%Y-%m-%d %H:%M:%S')

if grep -qi ${username} user.txt;
then
    echo "REGISTER: Error User already exist"
    echo "${date} REGISTER: Error User already exist" >> log.txt
else
    if [[ ${username} != ${password} ]]; then
        if [[ ${password} =~ [A-Za-z0-9]{8,} ]]; then
            if [[ ${password} =~ [A-Z] && ${password} =~ [a-z] && ${password} =~ [0-9] ]]; then
                echo "REGISTER: INFO User ${username} registered successfully"
                echo "${username}" >> user.txt
                echo "${password}" >> user.txt
                echo "${date} REGISTER: INFO User ${username} registered successfully" >> log.txt
            else
                echo "Failed!!"
                echo "Error: Password must constaint from uppercase, lowercase, and numeric"
                echo "${date} REGISTER: Error Password must constaint from uppercase, lowercase, and numeric" >> log.txt
            fi
        else
            echo "Failed!!"
            echo "Error: Password must constaint minimal 8 characters"
            echo "${date} REGISTER: Error Password must constaint minimal 8 characters" >> log.txt
        fi
    else
        echo "Failed!!"
        echo "Error: Password must not same the username"
        echo "${date} REGISTER: Error Password must not same the username" >> log.txt
    fi
fi
