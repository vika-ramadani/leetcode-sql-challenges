# 1907. Count Salary Categories
**Category :** `Advanced Select and Joins` | 
**Difficulty :**  `Medium`

## Deskripsi Masalah:
Tuliskan solusi untuk menghitung jumlah rekening bank untuk setiap kategori gaji. Kategori gaji tersebut adalah:

"Gaji Rendah": Semua gaji kurang dari $20.000.

"Gaji Rata-rata": Semua gaji dalam rentang inklusif [$20.000, $50.000].

"Gaji Tinggi": Semua gaji lebih dari $50.000.

Tabel hasil harus berisi ketiga kategori tersebut. Jika tidak ada rekening dalam suatu kategori, kembalikan 0.

Kembalikan tabel hasil dalam urutan apa pun.

## Tabel Input dan Output
<img width="400" height="300" alt="image" src="https://github.com/user-attachments/assets/26d6ed9d-86a9-44a0-8c68-8d8015c78e40" />

## Strategi Analisis:
1. **Identifikasi Output:** Menggunakan klausa `SELECT` untuk menampilkan kolom hasil `category` (jenis kategori gaji), dan kolom `account_count` (jumlah akun di setiap kategori).
2. **Pembentukan baris kategori (Subquery * Union All):** Membuat tabel sementara (diberi alias `c`) menggunakan operator himpunan `UNION ALL`. Langkah ini bertujuan menghasilkan struktur baris vertikal statis untuk ketiga kategori wajib: `Low Salary`, `Average Salary`, dan `High Salary`.
3. **Penggabungan Data(LEFT-JOIN):** Menghubungkan tabel kategori statis `c` dengan tabel transaksi `Accounts a` menggunakan klausul `LEFT JOIN`. Hal ini memastikan seluruh kategori (termasuk yang tidak memiliki data atau bernilai 0) akan tetap muncul pada hasil akhir. 
4. **Penyaringan Kondisi:** Hasil join `UNION ALL` dengan tabel `Accounts` kemudian menentukan kecocokan data pada klausul `ON` menggunakan ekspresi `CASE WHEN` untuk mengklasifikasikan data `income` ke dalam kategori yang sesuai:
   * `Low Salary`: Jika nilai pendapatan kurang dari $20.000 (`< 20000`).
   * `Average Salary`: Jika nilai pendapatan berada dalam rentang $20.000 hingga $50.000 (`BETWEEN 20000 AND 50000`).
   * `High Salary`: Jika nilai pendapatan di luar kondisi di atas atau lebih dari $50.000 (`> 50000`).
5. **Pengelompokan dan Agregasi:** Mengelompokkan data berdasarkan `c.category` menggunakan klausul `GROUP BY`. Jumlah rekening dihitung menggunakan fungsi agregat `COUNT(a.income)`, sehingga jika suatu kategori tidak memiliki kecocokan data pendapatan, fungsi ini akan mengembalikan nilai `0` secara otomatis. 
## Solusi Query:
```sql
SELECT
    c.category,
    COUNT(a.income) AS accounts_count 
FROM (SELECT 'Low Salary' AS category
UNION ALL
SELECT 'Average Salary'
UNION ALL
SELECT 'High Salary') AS c
LEFT JOIN accounts a 
ON c.category = (
    CASE WHEN a.income < 20000 THEN 'Low Salary' 
    WHEN a.income BETWEEN 20000 AND 50000 THEN 'Average Salary' 
    ELSE 'High Salary' END)
GROUP BY c.category ```
