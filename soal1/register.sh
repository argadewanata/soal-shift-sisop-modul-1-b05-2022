#!/bin/bash


echo "Register Mode"

read username

read -r -s user_password
date=$(date '+%Y-%m-%d %H:%M:%S')



if grep -qi ${username} /home/noob/Documents/sisop/Mod1/soal1user.txt
then
    echo "Failed!!"
    echo "Error: User Already Exist"
    echo "${date} Error: User Already Exist" >> log.txt
else
    if [[ ${username} != ${user_password} ]]; then
        if [[ ${user_password} =~ [A-Za-z0-9]{8,} ]]; then
            if [[ ${user_password} =~ [A-Z] && ${user_password} =~ [a-z] && ${user_password} =~ [0-9] ]]; then
                echo "Success Registered"
                echo "${username}" >> /home/noob/Documents/sisop/Mod1/soal1/user.txt
                echo "${user_password}" >> /home/noob/Documents/sisop/Mod1/soal1user.txt
                echo "${date} ${username} registered successfully" >> log.txt
            else
                echo "Failed!!"
                echo "Error: Password must constaint from uppercase, lowercase, and numeric"
                echo "${date} Error: Password must constaint from uppercase, lowercase, and numeric" >> log.txt
            fi
        else
            echo "Failed!!"
            echo "Error: Password must constaint minimal 8 characters"
            echo "${date} Error: Password must constaint minimal 8 characters" >> log.txt
        fi
    else
        echo "Failed!!"
        echo "Error: Password must not same the username"
        echo "${date} Error: Password must not same the username" >> log.txt
    fi
fi
