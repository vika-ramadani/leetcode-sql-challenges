# 1581. Customer Who Visited but Did Not Make Any Transaction
**Category :** `Basic Joins`

**Difficulty :**  `Easy`

## Deskripsi Masalah:
Tuliskan solusi untuk menemukan ID pengguna yang mengunjungi situs tanpa melakukan transaksi apa pun dan jumlah kunjungan yang mereka lakukan tanpa melakukan transaksi.

Kembalikan tabel hasil yang diurutkan dalam urutan apa pun .
## Tabel Input dan Output
<img width="350" height="250" alt="image" src="https://github.com/user-attachments/assets/dc3b35d2-cf1f-42c5-9101-38a5354e5134" /> <img width="300" height="200" alt="image" src="https://github.com/user-attachments/assets/f7a87349-00cd-4af1-97fb-3612d1caedba" />

## Strategi Analisis:
1. **Identifikasi Output:** Menampilkan kolom yang diminta dengan menggunakan klausa `SELECT`, yaitu kolom ID Pengguna (`customer_id`) dan jumlah kunjungan pelanggan yang tidak melakukan transaksi (`count_no_Trans`).
2. **Penggabungan Data:** Menggunakan metode `LEFT JOIN` untuk menghubungkan tabel utama `Visits` dengan tabel `Transaction` berdasarkan kolom kunci `visit_id`.
3. **Penyaringan Fiter:** Menggunakan klausa `WHERE` dengan kondisi `t.transaction_id IS NULL` untuk menyaring pelanggan yang tidak melakukan transaksi apapun.
4. **Agregasi:** Menggunakan fungsi aggregat `COUNT(v.visit_id)` untuk menghitung jumlah id kunjungan yang tidak melakukan transaksi pada hasil filter.
5. **Grouping:** Mengelompokkan pelanggan berdasarkan id menggunakan klausa `GROUP BY v.customer_id` agar perhitungan jumlah id kunjungan tanpa transaksi di hitung akurat per masing-masing pelanggan.
## Solusi Query:
```sql
SELECT
    v.customer_id,
    COUNT(v.visit_id) AS count_no_trans
FROM Visits v
LEFT JOIN Transactions t on v.visit_id = t.visit_id
WHERE t.transaction_id IS NULL
GROUP BY v.customer_id
```
