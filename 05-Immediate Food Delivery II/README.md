# 1174. Immediate Food Delivery II
**Category :** `Basic Aggregate Function` | 
**Difficulty :**  `Medium`

## Deskripsi Masalah:
Jika tanggal pengiriman yang diinginkan pelanggan sama dengan tanggal pemesanan, maka pesanan tersebut disebut segera; jika tidak, disebut terjadwal.

Pesanan pertama seorang pelanggan adalah pesanan dengan tanggal pemesanan paling awal yang pernah dibuat pelanggan. Dijamin bahwa setiap pelanggan hanya memiliki satu pesanan pertama.

Tuliskan solusi untuk menemukan persentase pesanan segera dalam pesanan pertama semua pelanggan, dibulatkan hingga 2 desimal.

## Tabel Input dan Output
<img width="750" height="450" alt="image" src="https://github.com/user-attachments/assets/8c98cf38-4c6b-40d7-8bf1-f1c745c927d7" />

## Strategi Analisis:
1. **Identifikasi Output:** Berdasarkan permintaan soal untuk menemukan persentase pesanan segera, dengan menggunakan klausa `SELECT` maka ditampilkan kolom `immediate_percentage` yaitu kolom baru untuk menghitung persentase tersebut.
2. **Agregasi dan Ekspresi Kondisional:** untuk menghitung persentase pesanan segera menggunakan kombinasi fungsi berikut:
   * Menghitung jumlah `SUM` **pesanan segera** dengan menggunakan kondisi `CASE WHEN`,pesanan disebut segera jika tanggal pengiriman (`order_date`) = tanggal pemesanan (`customer_pref_delivery_date`) maka kembalikan `THEN` nilai 1, dan `ELSE` 0 jika tidak.
   * Hasil perhitungan **jumlah pesanan** segera kemudian **dibagi** dengan **jumlah baris data pengiriman** menggunakan fungsi `COUNT(*)`.
   * Kemudian untuk mendapatkan hasil persentase maka hasil bagi tersebut dikalikan dengan 100, hasilnya kemudian dibulatkan hingga 2 desimal dengan menggunakan fungsi `ROUND`.
3. **Penyaringan Kondisi:** Karena persentase pesanan segera ini harus sesuai dengan **pesanan pertama** semua pelanggan, maka dilakukan penyaringan menggunakan klausa `WHERE` dan operator `IN` hanya untuk mengambil pelanggan dengan pesanan pertama mereka,
   hal ini membutuhkan *subquery* untuk mencari data hanya dari tanggal pesanan paling awal `MIN(order_date)` untuk masing-masing pelanggan `GROUP BY customer_id`.
## Solusi Query:
```sql
SELECT
    ROUND(
        SUM(
          CASE WHEN order_date = customer_pref_delivery_date THEN 1 ELSE 0 END) / COUNT(*) * 100, 2)
          AS immediate_percentage
FROM delivery 
WHERE (customer_id, order_date) 
IN (SELECT customer_id, MIN(order_date)
    FROM delivery
    GROUP BY customer_id)
```
