# 1193. Monthly Transactions I
**Category :** `Basic Aggregate Function` | 
**Difficulty :**  `Medium`

## Deskripsi Masalah:
Tuliskan kueri SQL untuk mencari, untuk setiap bulan dan negara, jumlah transaksi dan total nilainya, serta jumlah transaksi yang disetujui dan total nilainya.
Kembalikan tabel hasil dalam urutan apa pun.

## Tabel Input dan Output
<img width="1100" height="500" alt="image" src="https://github.com/user-attachments/assets/797780dc-ab80-46b0-a634-667d5fedd6a2" />

## Strategi Analisis:
1. **Identifikasi Output:** Menampilkan kolom menggunakan klausa `SELECT` untuk setiap bulan (`Month`), setiap negara (`country`),
   jumlah transaksi (`trans_count`), total nilai transaksi (`trans_total_amount`), jumlah transaksi yang disetujui (`approved_count`),
   dan total nilai transaksi yang disetujui (`approved_total_amount`).
3. **Ekspresi Kondisional dan Aggregasi:**
   Menggunakan Conditional Formatting `CASE WHEN` untuk beberapa kondisi berikut:
   * Menghitung transaksi jika disetujui (`approved`) maka kembalikan `THEN` nilai 1, jika tidak `ELSE` mengembalikan nilai 0,
   kemudian menghitung jumlah transaksi yang disetujui tersebut menggunakan fungsi `SUM`.
   * Total nilai transaksi jika disetujui (`approved`) maka kembalikan `THEN` `amount`, kemudian menjumlahkan seluruh nilai transaksi menggunakan fungsi `SUM`.
   * Menghitung banyaknya transaksi yang terjadi menggunakan fungsi `COUNT(*)`.
   * Menghitung total nilai transaksi keseluruhan menggunakan fungsi `SUM(amount)`
4. **Pengelompokan:** Kemudian mengelompokkan berdasarkan masing-masing bulan di masing-masing negara juga menggunakan klausa `GROUP BY`.
   
## Solusi Query:
```sql
SELECT
    DATE_FORMAT(trans_date, '%Y-%m') AS month, 
    country, 
    COUNT(*) AS trans_count,
    SUM(CASE WHEN state = 'approved' THEN 1 ELSE 0 END) AS approved_count, 
    SUM(amount) AS trans_total_amount,
    SUM(CASE WHEN state = 'approved' THEN amount ELSE 0 END) AS approved_total_amount
FROM transactions
GROUP BY month, country
```
