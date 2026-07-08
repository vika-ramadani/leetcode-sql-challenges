# 1934. Confirmation Rate
**Category :** `Basic Joins` | 
**Difficulty :**  `Medium`

## Deskripsi Masalah:
Tingkat konfirmasi pengguna adalah jumlah pesan yang 'dikonfirmasi' dibagi dengan total jumlah pesan konfirmasi yang diminta. Tingkat konfirmasi pengguna yang tidak meminta pesan konfirmasi adalah 0. Bulatkan tingkat konfirmasi ke dua desimal.
Tuliskan solusi untuk menemukan tingkat konfirmasi setiap pengguna.
Kembalikan tabel hasil dalam urutan apa pun.

## Tabel Input dan Output
<img width="450" height="350" alt="image" src="https://github.com/user-attachments/assets/0bb6ce98-f362-4705-ae38-48bd30ee4b94" /> <img width="350" height="230" alt="image" src="https://github.com/user-attachments/assets/61e06976-f5fd-49da-8276-a06588a6898d" />

## Strategi Analisis:
1. **Identifikasi Output:** Menampilkan tingkat konfirmasi pengguna menggunakan klausa `SELECT`, maka kolom yang dibutuhkan yaitu `user_id` dan `confirmation_rate`(kolom baru untuk menghitung tingkat konfirmasi).
2. **Penggabungan Data (Joins):** Menghubungkan tabel `Signups` dan `Confirmation` dengan menggunakan klausa `LEFT JOIN` untuk menyertakan semua pengguna dari tabel `Signups ` meskipun mereka tidak memiliki catatan di tabel `Confirmation` berdasarkan kolom kunci `user_id`.
3. **Agregasi:** Menghitung tingkat konfirmasi dengan menggunakan rumus berikut:
    * Jumlah pesan yang dikonfirmasi : menggunakan syarat `CASE WHEN` untuk pesan terkonfirmasi, jika pesan terkonfirmasi maka tampilkan(`THEN`) 1, jika tidak maka tampilkan (`ELSE`) 0, lalu menjumlahkan total pesan terkonfirmasi menggunakan fungsi aggregat `SUM`. Kemudian dibagi dengan,
    * Total konfirmasi yang diminta : menggunakan `COUNT` untuk menghitung jumlah permintaan pesan baik itu yang terkonfirmasi ataupun pelanggan yang tidak memiliki pesan terkonfirmasi ditampilkan dengan angka 0 menggunakan fungsi scalar `IFNULL` .
    * Hasil tingkat konfirmasi kemudian dibulatkan menjadi 2 angka dibelakang koma menggunakan fungsi scalar `ROUND`.
5. **Pengelompokan:** Mengelompokkan berdasarkan `user_id` untuk mendapatkan hasil tingkat konfirmasi berdasarkan masing-masing pengguna.

## Solusi Query:
```sql
SELECT
    s.user_id,
    ROUND(IFNULL(SUM(CASE WHEN c.action='confirmed' THEN 1 ELSE 0 END) / COUNT(c.action),0), 2) AS confirmation_rate 
FROM
    signups s 
LEFT JOIN
    confirmations c ON s.user_id = c.user_id 
GROUP BY
    s.user_id 
```
