# **soal-shift-sisop-modul-1-B05-2022** #

Kelompok B05 Sistem Operasi B Tahun 2022

Nama Lengkap | NRP
------------- | -------------
Fahmi Muhazir        | 5025201043
Sidrotul Munawaroh   | 5025201047
Rere Arga Dewanata   | 5025201078 

## Jawaban Soal Nomor 2
### 2A
**Deskripsi Soal**  
Membuat folder baru bernama "forensic_log_website_daffainfo_log"  

**Source Code** 
```bash
DefaultFolder=/home/argadewanata/SistemOperasi/Modul1/Nomor2

mkdir -p $DefaultFolder/forensic_log_website_daffainfo_log
``` 
**Penjelasan**  
Menggunakan mkdir -p agar membuat folder sekaligus membuat parent directorynya apabila belum tersedia. Folder ini terdapat pada path folder/home/argadewanata/SistemOperasi/Modul1/Nomor2/forensic_log_website_daffainfo_log

### 2B  
**Deskripsi Soal**  
Membuat file yang bernama "ratarata.txt" yang berisi rata rata request per jam  

**Source Code**  
```bash
awk -F: '{if (NR == 2)
	  {
	    request = $3; 
	  }
	 }
	END{
	  total_request = NR - 1;
	  printf "Rata - rata serangan adalah sebanyak %f requests per jam\n", total_request/12
	}' $DefaultFolder/log_website_daffainfo.log >  $DefaultFolder/forensic_log_website_daffainfo_log/ratarata.txt

``` 
**Penjelasan**
1. Menggunakan awk agar mampu mengambil record tertentu dan melakukan operasi padanya  
2. -F: berarti tanda ":" menjadi pemisah antar argumen    
3. Argumen ke-3 ditandai dengan $3 yang kemudian di assign ke variabel request  
4. Variabel total_request = NR - 1 karena baris pertama pada record bukanlah sebuah argumen  
5. Lalu, total_request /12 karena pada record terjadi selama 12 jam
6. Kemudian, hasil tersebut dimasukan ke dalam ratarata.txt


  
