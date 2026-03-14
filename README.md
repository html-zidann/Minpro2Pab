## Nama : Zidan Daffa Ramadhan
## Kelas: Sistem Informasi B 2024
## NIM  : 2409116056


# 🎵 Music Instruments CRUD App

## Deskripsi Aplikasi

Music Instruments CRUD App merupakan aplikasi mobile berbasis **Flutter** yang digunakan untuk mengelola data alat musik dari berbagai merek terkenal di dunia. Aplikasi ini terhubung dengan **database Supabase** sebagai backend untuk menyimpan dan mengelola data secara online.

Pengguna dapat menambahkan, melihat, mengedit, dan menghapus data alat musik seperti gitar, piano, drum, saxophone, dan berbagai instrumen lainnya. Setiap data alat musik memiliki informasi berupa **nama instrumen, tahun pembuatan, pembuat (brand), serta deskripsi**.

Aplikasi ini dibuat sebagai implementasi konsep **CRUD (Create, Read, Update, Delete)** pada pengembangan aplikasi mobile menggunakan Flutter yang terintegrasi dengan layanan backend modern.

---

## Fitur Aplikasi

Aplikasi ini memiliki beberapa fitur utama, yaitu:

### 1. Menampilkan Data Alat Musik (Read)

Aplikasi menampilkan daftar alat musik yang tersimpan di database Supabase dalam bentuk list yang mudah dibaca.

### 2. Menambahkan Data Alat Musik (Create)

Pengguna dapat menambahkan data alat musik baru dengan mengisi form yang terdiri dari:

* Nama alat musik
* Tahun pembuatan
* Pembuat / brand
* Deskripsi alat musik

### 3. Mengedit Data Alat Musik (Update)

Data alat musik yang sudah ada dapat diperbarui jika terdapat kesalahan atau perubahan informasi.

### 4. Menghapus Data Alat Musik (Delete)

Pengguna dapat menghapus data alat musik dari database Supabase.

### 5. Navigasi Antar Halaman

Aplikasi memiliki dua halaman utama:

* **Halaman List Data**
* **Halaman Form Tambah / Edit Data**

### 6. Integrasi Database Supabase

Semua data aplikasi disimpan secara online menggunakan **Supabase Database** sehingga data tidak tersimpan secara lokal.

---

## Struktur Data

Data alat musik yang disimpan memiliki field sebagai berikut:

* **nama** → nama alat musik
* **tahun** → tahun pembuatan alat musik
* **pembuat** → brand atau perusahaan pembuat alat musik
* **deskripsi** → penjelasan singkat mengenai alat musik

---

## Widget yang Digunakan

Aplikasi ini menggunakan berbagai widget Flutter untuk membangun antarmuka pengguna, antara lain:

* **MaterialApp**
* **Scaffold**
* **AppBar**
* **ListView**
* **ListTile**
* **Container**
* **Column**
* **Row**
* **Text**
* **Icon**
* **TextFormField**
* **ElevatedButton**
* **FloatingActionButton**
* **Padding**
* **SizedBox**
* **SingleChildScrollView**

Widget-widget tersebut digunakan untuk membangun tampilan aplikasi yang responsif, mudah digunakan, dan terstruktur dengan baik.

---

## Teknologi yang Digunakan

* **Flutter**
* **Dart**
* **Supabase Database**
* **Supabase Flutter SDK**
* **Material Design**

---

## Tujuan Pembuatan Aplikasi

Aplikasi ini dibuat untuk memenuhi tugas mini project pada mata kuliah pengembangan aplikasi mobile dengan tujuan:

* Memahami konsep CRUD pada aplikasi mobile
* Mengintegrasikan Flutter dengan backend database
* Mengimplementasikan navigasi antar halaman
* Mengelola data secara online menggunakan Supabase

---

## Author

Zidan Daffa
Program Studi Sistem Informasi
Fakultas Teknik
