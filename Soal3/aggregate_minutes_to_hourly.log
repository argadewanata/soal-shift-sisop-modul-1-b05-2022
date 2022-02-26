#/bin/bash

FILE_NAME=$(date +"%Y%m%d%H")
DIR_OUT="/home/noob/Documents/sisop/Mod1/soal3/log/metrics_agg_$FILE_NAME.log"
SRC="/home/noob/Documents/sisop/Mod1/soal3/log"

#Getting all of file with format metrics* and seacrh in teh file for "mem"
CHECK_FILE() {
	for file in $(ls /home/noob/Documents/sisop/Mod1/soal3/log/metrics* | grep $FILE_NAME)
	do 
		cat $file | grep -v mem 
	done
}

#Checking content of file and indexing it
INDEXING() {
	if [ $1 == "mem_total" ]
	    then
		index=1
	elif [ $1 == "mem_used" ]
	    then
		index=2
	elif [ $1 == "mem_free" ]
	    then
		index=3
	elif [ $1 == "mem_shared" ]
	    then
		index=4
	elif [ $1 == "mem_buff" ]
	    then
		index=5
	elif [ $1 == "mem_available" ]
	    then
		index=6
	elif [ $1 == "swap_total" ]
	    then
		index=7
	elif [ $1 == "swap_used" ]
	    then
		index=8
	elif [ $1 == "swap_free" ]
	    then
		index=9
	elif [ $1 == "path_size" ]
	    then
		index=11
	fi

	CHECK_FILE | awk -F , '
	{
		if(MIN == "") {
			MIN = MAX = $ind
		}
		if($ind > MAX) {
			MAX=$ind
		}
		if($ind < MIN) {
			MIN=$ind
		}
		
		total+=$ind;
		count+=1

	} END {
		if(choose == "MAX") {
			print MAX
		}
		if(choose == "MIN") {
			print MIN
		}
		if(choose == "AVG") {
			Average=total/count
			printf "%.0f", Average
		}
	}' ind=$index select=$2
}


	CHECK_FILE | awk -F , '
	{
		if(min == "") {
			MIN = MAX = $ind
		}
		if($ind > MAX) {
			MAX=$ind
		}
		if($ind < MINX) {
			MIN=$ind
		}
		
		total+=$ind;
		count+=1

	} END {
		if(select == "MAX") {
			print MAX
		}
		if(select == "MIN") {
			print MIN
		}
		if(select == "AVG") {
			Average=total/count
			printf "%.0f", Average
		}
	}' ind=$index choose=$2


# mem_total
mem_tot_min=$(INDEXING mem_total min)
mem_tot_max=$(INDEXING mem_total max)
mem_tot_avg=$(INDEXING mem_total avg)

# mem_used
mem_used_min=$(INDEXING mem_used min)
mem_used_max=$(INDEXING mem_used max)
mem_used_avg=$(INDEXING mem_used avg)

# mem_free
mem_free_min=$(INDEXING mem_free min)
mem_free_max=$(INDEXING mem_free max)
mem_free_avg=$(INDEXING mem_free avg)

# mem_shared
mem_shared_min=$(INDEXING mem_shared min)
mem_shared_max=$(INDEXING mem_shared max)
mem_shared_avg=$(INDEXING mem_shared avg)

# mem_buff
mem_buff_min=$(INDEXING mem_buff min)
mem_buff_max=$(INDEXING mem_buff max)
mem_buff_avg=$(INDEXING mem_buff avg)

# mem_available
mem_avail_min=$(INDEXING mem_available min)
mem_avail_max=$(INDEXING mem_available max)
mem_avail_avg=$(INDEXING mem_available avg)

# swap_total
swap_tot_min=$(INDEXING swap_total min)
swap_tot_max=$(INDEXING swap_total max)
swap_tot_avg=$(INDEXING swap_total avg)

# swap_used
swap_used_min=$(INDEXING swap_used min)
swap_used_max=$(INDEXING swap_used max)
swap_used_avg=$(INDEXING swap_used avg)

# swap_free
swap_free_min=$(INDEXING swap_free min)
swap_free_max=$(INDEXING swap_free max)
swap_free_avg=$(INDEXING swap_free avg)

# path_size
path_size_min=$(INDEXING path_size min)
path_size_max=$(INDEXING path_size max)
path_size_avg=$(INDEXING path_size avg)


# printing
echo "mem_total,mem_used,mem_free,mem_shared,mem_buff,mem_available,swap_total,swap_used,swap_free,path,path_size" >> $DIR_OUT
echo "MIN,$mem_tot_min,$mem_used_min,$mem_free_min,$mem_shared_min,$mem_buff_min,$mem_avail_min,$swap_tot_min,$swap_used_min,$swap_free_min,$location_path,$path_size_min" >> $DIR_OUT
echo "MAX,$mem_tot_max,$mem_used_max,$mem_free_max,$mem_shared_max,$mem_buff_max,$mem_avail_max,$swap_tot_max,$swap_used_max,$swap_free_max,$location_path,$path_size_max" >> $DIR_OUT
echo "AVG,$mem_tot_avg,$mem_used_avg,$mem_free_avg,$mem_shared_avg,$mem_buff_avg,$mem_avail_avg,$swap_tot_avg,$swap_used_avg,$swap_free_avg,$location_path,$path_size_avg" >> $DIR_OUT

chmod 700 $DIR_OUT
