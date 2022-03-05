# **soal-shift-sisop-modul-1-B05-2022** #

Kelompok B05 Sistem Operasi B Tahun 2022

Nama Lengkap | NRP
------------- | -------------
Fahmi Muhazir        | 5025201043
Sidrotul Munawaroh   | 5025201047
Rere Arga Dewanata   | 5025201078 

## Jawaban Soal Nomor 1
. Untuk membuat sistem register harus membuat file register.sh yang ada ./users/user.txt agar username tidak sama dan membuat command login agar username dan password tidak sama
. pada file main.sh di cek tidak memiliki username yang terdaftar di user.txt, maka akan langsung di redirect ke register.sh untuk membuat user baru. 
. Demi menjaga keamanan, input password pada saat login dan register harus tertutup dan password yang terdaftar memiliki kriteria minamal 8 karakter, 
 . memiliki minimal 1 huruf kapital dan 1 huruf kecil, alphanumeric, tidak boleh sama dengan username.
. Setiap percobaan login dan register akan tercatat log.txt dengan format MM/DD/YY hh:mm:ss MESSAGE

## Jawaban Soal Nomor 2
### Kendala Nomor 2  
Pada nomor 2C, hasil IP pada awalnya menunjukan hasil yang tidak sesuai, tetapi dapat diatasi dengan mengubah kode dan didapatkan hasil yang telah sesuai  

### 2A
**Deskripsi Soal**  
Membuat folder baru bernama "forensic_log_website_daffainfo_log"

**Kode Program**  
```
#!/bin/bash
DefaultFolder=/home/argadewanata/SistemOperasi/Modul1/Nomor2
mkdir -p $DefaultFolder/forensic_log_website_daffainfo_log

```

**Penjelasan**  
Menggunakan mkdir -p agar membuat folder sekaligus membuat parent directorynya apabila belum tersedia. Folder ini terdapat pada path folder/home/argadewanata/SistemOperasi/Modul1/Nomor2/forensic_log_website_daffainfo_log

### 2B  
**Deskripsi Soal**  
Membuat file yang bernama "ratarata.txt" yang berisi rata rata request per jam  

**Kode Program**
```
cat $DefaultFolder/log_website_daffainfo.log | awk -F: '{if (NR == 2)
	  {
	    request = $3; 
	  }
	 }
	END{
	  total_request = NR - 1;
	  printf "Rata - rata serangan adalah sebanyak %f requests per jam\n", total_request/12
	}' >  $DefaultFolder/forensic_log_website_daffainfo_log/ratarata.txt

```  
 
**Penjelasan**  
1. Menggunakan awk agar mampu mengambil record tertentu dan melakukan operasi padanya  
2. -F: berarti tanda ":" menjadi pemisah antar argumen    
3. Argumen ke-3 ditandai dengan $3 yang kemudian di assign ke variabel request  
4. Variabel total_request = NR - 1 karena baris pertama pada record bukanlah sebuah argumen  
5. Lalu, total_request /12 karena pada record terjadi selama 12 jam
6. Kemudian, hasil tersebut dimasukan ke dalam ratarata.txt

### 2C  
**Deskripsi Soal**  
Membuat file yang bernama "result.xt" yang berisi alamat IP yang melakukan request terbanyak dan total request yang dikirimkan oleh IP tersebut

**Kode Program**
```  
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

```  

**Penjelasan**
1. Menggunakan awk agar mampu mengambil record tertentu dan melakukan operasi padanya  
2. -F'"' berarti tanda " menjadi pemisah antar argumen
3. Argumen ke-2 ditandai dengan $2 yang kemudian jumlahnya dimasukkan ke dalam arr_of_IP  
4. Menggunakan array untuk menghitung banyaknya request tiap IP kemudian dibandingkan dan hasilnya dimasukan ke dalam result.txt  

### 2D  
**Deskripsi Soal**  
Menambahkan jumlah request yang menggunakan user-agent curl pada file "result.txt"

**Kode Program**
``` 
cat $DefaultFolder/log_website_daffainfo.log | awk '/curl/ {++count}
    END {
          printf "Ada %d requests yang menggunakan curl sebagai user-agent\n\n", count
        }' >>  $DefaultFolder/forensic_log_website_daffainfo_log/result.txt

```  
**Penjelasan**  
Mencari jumlah kata 'curl' dan disimpan ke dalam variabel count dan hasilnya ditambahkan pada file 'result.txt' yang sudah ada

### 2E 
**Deskripsi Soal**  
Menambahkan request yang mengakses website pada 02.00 pada file 'result.txt'  

**Kode Program**
``` 
cat $DefaultFolder/log_website_daffainfo.log | awk -F: '/2022:02/ {gsub(/"/, "", $1)
   		    IP_arr[$1]++}

	END {
		for (IP in IP_arr){
			printf "IP Address : %s Jam 2 pagi\n",IP
		}

	}' >>  $DefaultFolder/forensic_log_website_daffainfo_log/result.txt

``` 

**Penjelasan**
1. Menggunakan awk agar mampu mengambil record tertentu dan melakukan operasi padanya   
2. Mencari pattern /2022:02/ atau pukul 02.00 dan menambahkan ke dalam IP_arr
3. Menambahkan output kepada result.txt

## Jawaban Soal Nomor 3
### 3A
**Deskripsi soal**
Masukkan semua metrics ke dalam suatu file log bernama metrics_{YmdHms}.log.
{YmdHms} adalah waktu disaat file script bash kalian dijalankan. Misal dijalankan
pada 2022-01-31 15:00:00, maka file log yang akan tergenerate adalah
metrics_20220131150000.log.

**Source Code**
```
#!/bin/bash

#Making Directory for log of file
mkdir -p log

#Identify user
USER= id -u -n

#Making variabel as format name of file"
FILE="$(date +"%Y%m%d%H%M%S")"

#Making directory of file
DIR_OUT="/home/noob/Documents/sisop/Mod1/soal3/log/metrics_$FILE.log" 

#Write a format to file, with path of file
echo "mem_total,mem_used,mem_free,mem_shared,mem_buff,mem_available,swap_total,swap_used,swap_free,path,path_size" > $DIR_OUT


MEM="$(free | awk '/Memory:/ {printf "%s,%s,%s,%s,%s,%s", $2,$3,$4,$5,$6,$7}')"
SWAP="$(free | awk '/Swap:/ {printf "%s,%s,%s", $2,$3,$4}')"
STORAGE="$(du -sh /home/noob/Documents/sisop/Mod1/soal3 | awk '{printf "%s,%s",$2,$1}')"


echo "$MEM,$SWAP,$STORAGE" >> $DIR_OUT | chmod 700 /home/noob/Documents/sisop/Mod1/soal3/log/metrics_$FILE.log
```

**Penjelasan**
1. Membuat folder untuk log file
2. Membuat variable untuk nama
3. Mmebuat variable path untuk log file
4. Mendapatkan data memori dengan (free -m) yang outputnya akan menjadi masukian dari perintah awk dengan menetapkan pola /Mem:/. dari $2 hingga $7
5. Kemudian data swap, digunakan pola /Swap:/ pada awk. Setiap kata keluarannya juga diprint berdasarkan input argumen $2 hingga $4.
6. Menyimpan data yang sudah dicari ke path DIR_OUT
7. Merubahn aksebilitas file dengan chmod 700 -rwx——



  
