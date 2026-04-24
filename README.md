# Tugas Praktikum 2 - Blok Prosedural MySQL

##  Nama Kelompok
Kelompok 8

##  Anggota
- Muhammad Mahruf (IK2411061)
- Fauzan Azima (IK2411039)
- Gefran (IK2411029)

##  Dosen Pengampu
Abdul Malik, S.Kom., M.Cs.

---

##  Deskripsi Singkat
Program ini dibuat untuk memahami penggunaan blok prosedural di MySQL dengan memanfaatkan stored procedure. Data mahasiswa diproses menggunakan parameter sehingga dapat diubah langsung saat program dijalankan, tanpa harus mengedit kode utama.

---

##  Tujuan
- Memahami konsep stored procedure di MySQL  
- Menggunakan variabel dan parameter (IN)  
- Menerapkan logika IF dalam program  
- Menampilkan hasil menggunakan SELECT  

---

##  Struktur Program

### 🔹 Bagian A – Identitas Mahasiswa  
Menampilkan identitas mahasiswa seperti nama, NIM, program studi, dan semester.

### 🔹 Bagian B – Validasi Akademik  
Melakukan pengecekan status pembayaran, jumlah SKS, dan IPK untuk menentukan valid atau tidaknya data.

### 🔹 Bagian C – Kelayakan KRS  
Menentukan apakah mahasiswa layak mengambil KRS berdasarkan data akademik yang dimasukkan.

### 🔹 Bagian D – Perbandingan Mahasiswa  
Membandingkan dua mahasiswa berdasarkan IPK, dan jika sama maka dilihat dari jumlah SKS.

---

##  Skenario Pengujian
Program diuji dengan beberapa kondisi:

1. **Data Valid**  
   - Status: LUNAS  
   - SKS: > 0  
   - Hasil: Layak  

2. **Tidak Valid (Status)**  
   - Status: BELUM  
   - Hasil: Tidak Layak  

3. **Tidak Valid (SKS)**  
   - SKS: 0  
   - Hasil: Tidak Layak  

---

##  Cara Menjalankan Program

Contoh pemanggilan:

```sql
CALL bagian_c(
'Muhammad Mahruf','IK2411061',4,'INFORMATIKA',18,3.40,'LUNAS'
);

 Struktur Repository
tugaspraktikum1-blokprosedural-kelompok8
│
├── README.md
├── program.sql
├── laporan.pdf
└── screenshot/
        ├── bagian_a.png
        ├── bagian_b.png
        ├── c_valid.png
        ├── c_tidak_valid1.png
        ├── c_tidak_valid2.png
        └── bagian_d.png

##  Dokumentasi
Hasil eksekusi program dapat dilihat pada folder `screenshot/`.

---

##  Kesimpulan
Program ini berhasil mengimplementasikan blok prosedural di MySQL dengan menggunakan parameter sehingga data dapat diubah dengan mudah. Program juga mampu menghasilkan output yang berbeda sesuai kondisi yang diberikan.
