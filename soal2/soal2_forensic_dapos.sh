#!/bin/bash

DefaultFolder=/home/argadewanata/SistemOperasi/Modul1/Nomor2

#A. Create New Folder "forensic_log_website_daffainfo_log"
mkdir -p $DefaultFolder/forensic_log_website_daffainfo_log

#B. Create a file named "ratarata.txt" that contains average request per hour 
cat $DefaultFolder/log_website_daffainfo.log | awk -F: '{if (NR == 2)
	  {
	    request = $3; 
	  }
	 }
	END{
	  total_request = NR - 1;
	  printf "Rata - rata serangan adalah sebanyak %f requests per jam\n", total_request/12
	}' >  $DefaultFolder/forensic_log_website_daffainfo_log/ratarata.txt

#C. Create a file named "result.txt" that contains IP address that made the most request and total request were sent with that IP
cat $DefaultFolder/log_website_daffainfo.log | awk -F'"' '{ arr_of_IP[$2]++}
	END {
		maxRequest = 0
		IP_dest
 		for(i in arr_of_IP){
			if (maxRequest < arr_of_IP[i]){
			    IP_dest = i
			    maxRequest = arr_of_IP[IP_dest]
			}
		}
		print "IP yang paling banyak mengakses server adalah: " IP_dest " sebanyak " maxRequest " requests\n"
	}' >  $DefaultFolder/forensic_log_website_daffainfo_log/result.txt

#D. Add number of request that using user-agent curl in "result.txt" file
cat $DefaultFolder/log_website_daffainfo.log | awk '/curl/ {++count}
    END {
          printf "Ada %d requests yang menggunakan curl sebagai user-agent\n\n", count
        }' >>  $DefaultFolder/forensic_log_website_daffainfo_log/result.txt

#E. Add all the IPs that access the website at 2 AM
cat $DefaultFolder/log_website_daffainfo.log | awk -F: '/2022:02/ {gsub(/"/, "", $1)
   		    IP_arr[$1]++}

	END {
		for (IP in IP_arr){
			printf "IP Address : %s Jam 2 pagi\n",IP
		}

	}' >>  $DefaultFolder/forensic_log_website_daffainfo_log/result.txt
