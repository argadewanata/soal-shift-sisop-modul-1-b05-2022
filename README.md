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

**Penjelasan**  
Menggunakan mkdir -p agar membuat folder sekaligus membuat parent directorynya apabila belum tersedia. Folder ini terdapat pada path folder/home/argadewanata/SistemOperasi/Modul1/Nomor2/forensic_log_website_daffainfo_log

### 2B  
**Deskripsi Soal**  
Membuat file yang bernama "ratarata.txt" yang berisi rata rata request per jam  
 
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

**Penjelasan**  
Menggunakan array untuk menghitung banyaknya request tiap IP kemudian dibandingkan dan hasilnya dimasukan ke dalam result.txt

### 2D  
**Deskripsi Soal**  
Menambahkan jumlah request yang menggunakan user-agent curl pada file "result.txt"
 
**Penjelasan**  
Mencari jumlah kata 'curl' dan disimpan ke dalam variabel count dan hasilnya ditambahkan pada file 'result.txt' yang sudah ada

### 2E 
**Deskripsi Soal**  
Menambahkan request yang mengakses website pada 02.00 pada file 'result.txt'

**Penjelasan**  
Mencari IP yang mengakses pada 2022:02 dan mengeprint hasilnya. Lalu outputnya ditambahkan pada 'result.txt'


  
