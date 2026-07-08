# 1045. Customers Who Bought All Products
**Category :** `Sorting and Grouping` | 
**Difficulty :**  `Medium`

## Deskripsi Masalah:
Tuliskan solusi untuk melaporkan ID pelanggan dari tabel Pelanggan yang membeli semua produk di tabel Produk.
Kembalikan tabel hasil dalam urutan apa pun.

## Tabel Input dan Output
<img width="350" height="250" alt="image" src="https://github.com/user-attachments/assets/d37f23df-dab3-43e7-988e-f78ce1c252dc" /> <img width="255" height="212" alt="image" src="https://github.com/user-attachments/assets/b6942979-2ef3-4851-a38e-42c4e73be510" />


## Strategi Analisis:
1. **Identifikasi Output:** Menampilkan ID Pelanggan (`customer_id`) dengan syarat membeli semua produk di tabel produk menggunakan klausa `SELECT`.
2. **Pengelompokan:** Melakukan pengelompokan (`GROUP BY`) pada kolom  `customer_id` untuk masing-masing transaksi pelanggan.
3. **Penyaringan Kondisi dan agregasi:** Hanya menampilkan `customer_id` yang membeli semua produk maka dilakukan penyaringan setelah pengelompokan menggunakan kondisi `Having`.
4. **Validasi Jumlah Produk (Subquery)**: Membandingkan jumlah produk unik yang dibeli oleh pelanggan menggunakan `COUNT(DISTINCT product_key)` dengan total seluruh produk yang tersedia di tabel `Product` menggunakan *subquery* `SELECT COUNT(product_key) FROM product`. Jika nilainya sama, maka pelanggan tersebut valid membeli semua produk.

## Solusi Query:
```sql
SELECT
    customer_id
FROM Customer
GROUP BY customer_id
HAVING COUNT(DISTINCT product_key) = (
    select count(product_key) from product
)
```
