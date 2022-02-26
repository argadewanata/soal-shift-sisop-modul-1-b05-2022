# **soal-shift-sisop-modul-1-B05-2022** #

Kelompok B05 Sistem Operasi B Tahun 2022

Nama Lengkap | NRP
------------- | -------------
Fahmi Muhazir        | 5025201043
Sidrotul Munawaroh   | 5025201047
Rere Arga Dewanata   | 5025201078 

## Penjelasan Soal 1
Naskah Soal :
Pada tanggal 22 Januari 2022, website https://daffa.info di hack oleh seseorang yang tidak
bertanggung jawab. Sehingga hari sabtu yang seharusnya hari libur menjadi berantakan.
Dapos langsung membuka log website dan menemukan banyak request yang berbahaya.
Bantulah Dapos untuk membaca log website https://daffa.info Buatlah sebuah script awk
bernama "soal2_forensic_dapos.sh" untuk melaksanakan tugas-tugas berikut:
a. Buat folder terlebih dahulu bernama forensic_log_website_daffainfo_log.
b. Dikarenakan serangan yang diluncurkan ke website https://daffa.info sangat banyak,Dapos ingin tahu berapa rata-rata request per jam yang dikirimkan penyerang ke website. Kemudian masukkan jumlah rata-ratanya ke dalam sebuah file bernama ratarata.txt ke dalam folder yang sudah dibuat  sebelumnya.
c. Sepertinya penyerang ini menggunakan banyak IP saat melakukan serangan kewebsite https://daffa.info, Dapos ingin menampilkan IP yang paling banyak melakukan request ke server dan tampilkan berapa banyak request yang dikirimkan dengan IP tersebut. Masukkan outputnya kedalam file baru bernama result.txt kedalam folder yang sudah dibuat sebelumnya.
d. Beberapa request ada yang menggunakan user-agent ada yang tidak. Dari banyaknya request, berapa banyak requests yang menggunakan user-agent curl?Kemudian masukkan berapa banyak requestnya kedalam file bernama result.txt yang telah dibuat sebelumnya.
e. Pada jam 2 pagi pada tanggal 23 terdapat serangan pada website, Dapos ingin mencari tahu daftar IP yang mengakses website pada jam tersebut. Kemudian masukkan daftar IP tersebut kedalam file bernama result.txt yang telah dibuat sebelumnya.

Penjelasan 2 A:
`` bash
DefaultFolder=/home/argadewanata/SistemOperasi/Modul1/Nomor2

mkdir -p $DefaultFolder/forensic_log_website_daffainfo_log
```

mkdir -p $DefaultFolder/forensic_log_website_daffainfo_log
```

  
