# Tugas Praktikum 2 - Blok Prosedural MySQL

##  Anggota Kelompok
- Muhammad Mahruf (IK2411061)
- Fauzan Azima (IK2411039)
- Gefran (IK2411029)

##  Dosen Pengampu
Abdul Malik, S.Kom., M.Cs.

---

##  Deskripsi Singkat
Program ini dibuat untuk memahami konsep blok prosedural pada MySQL menggunakan stored procedure. 
Di dalam program, data mahasiswa diproses menggunakan variabel dan kondisi (IF), kemudian hasilnya ditampilkan dengan SELECT.

---

##  Tujuan
- Memahami penggunaan stored procedure di MySQL  
- Menggunakan variabel dengan DECLARE  
- Menerapkan logika IF dalam pengambilan keputusan  
- Menampilkan hasil menggunakan SELECT  

---

##  Struktur Program

### 🔹 Bagian A – Identitas Mahasiswa
Menampilkan data mahasiswa seperti nama, NIM, program studi, dan semester.

### 🔹 Bagian B – Validasi Akademik
Melakukan pengecekan:
- Status pembayaran  
- Jumlah SKS  
- IPK  

Hasil ditampilkan dalam bentuk:
- status data  
- beban studi  
- performa akademik  

---

### 🔹 Bagian C – Kelayakan KRS
Menggabungkan identitas dan hasil validasi untuk menentukan apakah mahasiswa layak mengambil KRS atau tidak.

---

### 🔹 Bagian D – Perbandingan Mahasiswa
Membandingkan dua mahasiswa berdasarkan IPK, jika sama maka dibandingkan jumlah SKS.

---

##  Skenario Pengujian

1. **Data Valid**
   - Status: LUNAS  
   - SKS: lebih dari 0  
   - Hasil: Layak mengambil KRS  

2. **Data Tidak Valid (Status)**
   - Status: BELUM  
   - Hasil: Tidak Layak  

3. **Data Tidak Valid (SKS)**
   - SKS: 0  
   - Hasil: Tidak Layak  

---

##  Cara Kerja Program
Program berjalan dengan urutan:
1. Deklarasi variabel (DECLARE)  
2. Mengisi nilai variabel  
3. Proses kondisi menggunakan IF  
4. Menampilkan hasil menggunakan SELECT  

---

## 📂 Struktur Repository

tugaspraktikum1-blokprosedural-kelompok_mahruf
│
├── README.md
├── program.sql
├── laporan.pdf
└── screenshot/
---

##  Dokumentasi
Hasil eksekusi program dapat dilihat pada folder `screenshot/`.

---

## 📌 Kesimpulan
Program ini berhasil digunakan untuk memproses dan mengevaluasi data mahasiswa menggunakan konsep blok prosedural di MySQL dengan memanfaatkan variabel dan logika kondisi.
