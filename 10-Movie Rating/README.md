# 1341. Movie Rating
**Category :** `Subqueries` | 
**Difficulty :**  `Medium`

## Deskripsi Masalah:
Tuliskan solusi untuk:
* Temukan nama pengguna yang telah memberikan peringkat film terbanyak. Jika terjadi seri, kembalikan nama pengguna yang secara leksikografis (urutan sesuai abjad) lebih kecil.
* Temukan nama film dengan peringkat rata-rata tertinggi di Februari 2020. Jika terdapat peringkat yang sama, kembalikan nama film yang secara leksikografis (urutan sesuai abjad) lebih kecil.

## Tabel Input dan Output
<img width="350" height="350" alt="image" src="https://github.com/user-attachments/assets/bda3c40b-2b34-4d42-be2e-7bad4cc3d4a6" />
<img width="350" height="350" alt="image" src="https://github.com/user-attachments/assets/75118f2f-f819-4791-a760-bb6cc52bff52" />


<img width="200" height="200" alt="image" src="https://github.com/user-attachments/assets/d480332c-7565-4887-92b0-02450cdc61a8" />

## Strategi Analisis:
1. **Identifikasi Output:** Menggunakan klausa `SELECT` untuk menampilkan hasil gabungan dalam satu kolom bernama `results`. Kolom ini berisi nama pengguna (`name`) dengan ulasan terbanyak pada baris pertama, dan nama film (`title`) dengan rating rata-rata tertinggi pada baris kedua. Jika terjadi seri, hasil akan diurutkan berdasarkan abjad terkecil/terawal.
2. **Pembentukan Baris Hasil (Subquery dan Union):** Menggabungkan dua query independen menggunakan operator `UNION ALL` untuk menampilkan dua baris hasil secara vertikal:
   * **Baris Pertama (Pengguna Teraktif)**: 
     * Melakukan `INNER JOIN` antara tabel `Users u` dan `MovieRating mr` berdasarkan kolom kunci `user_id`.
     * Mengelompokkan data berdasarkan `u.name` menggunakan `GROUP BY`.
     * Mengurutkan data menggunakan `ORDER BY` berdasarkan jumlah ulasan terbanyak secara menurun (`COUNT(*) DESC`), lalu berdasarkan nama pengguna secara menaik (`u.name ASC`) untuk mengatasi hasil seri berdasarkan abjad terawal.
     * Menggunakan `LIMIT 1` untuk mengambil satu pengguna teratas.
   * **Baris Kedua (Film Rating Tertinggi - Februari 2020)**:
     * Melakukan `INNER JOIN` antara tabel `Movies m` dan `MovieRating mr` berdasarkan kolom kunci `movie_id`.
     * Menyaring data menggunakan klausa `WHERE` dengan fungsi `DATE_FORMAT(mr.created_at, '%Y-%m') = '2020-02'` untuk membatasi riwayat transaksi hanya pada bulan Februari tahun 2020.
     * Mengelompokkan data berdasarkan judul film menggunakan `GROUP BY m.title`.
     * Mengurutkan data menggunakan `ORDER BY` berdasarkan rata-rata rating tertinggi secara menurun (`AVG(mr.rating) DESC`), kemudian berdasarkan judul film secara menaik (`m.title ASC`) untuk menangani hasil seri sesuai urutan abjad.
     * Menggunakan `LIMIT 1` untuk mengambil satu judul film terbaik.

## Solusi Query:
```sql
(
  SELECT u.name AS results
  FROM users u 
  JOIN MovieRating mr ON u.user_id = mr.user_id 
  GROUP BY u.name 
  ORDER BY COUNT(*) DESC, u.name ASC 
  LIMIT 1
) 
UNION ALL
(
  SELECT m.title 
  FROM movies m 
  JOIN MovieRating mr ON m.movie_id = mr.movie_id 
  WHERE date_format(mr.created_at, '%Y-%m') = '2020-02' 
  GROUP BY m.title 
  ORDER BY avg(mr.rating) DESC, m.title ASC 
  LIMIT 1
)
```
