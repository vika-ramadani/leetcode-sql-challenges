# 1141. User Activity for the Past 30 Days I
**Category :** `Sorting and Grouping` | 
**Difficulty :**  `Easy`

## Deskripsi Masalah:
Tuliskan solusi untuk menemukan jumlah pengguna aktif harian selama periode 30 hari yang berakhir pada 27 Juli 2019 (termasuk). 
Seorang pengguna dianggap aktif pada suatu hari jika mereka melakukan setidaknya satu aktivitas pada hari tersebut.

Kembalikan tabel hasil dalam urutan apa pun.

Catatan: Aktivitas apa pun dari ('open_session', 'end_session', 'scroll_down', 'send_message') akan dianggap sebagai aktivitas yang valid agar seorang pengguna dianggap aktif pada suatu hari.

## Tabel Input dan Output
<img width="450" height="300" alt="image" src="https://github.com/user-attachments/assets/fb889284-3b12-418c-aaa3-4dd17aa97597" /> <img width="300" height="150" alt="image" src="https://github.com/user-attachments/assets/e6b67685-e4b6-4818-a92f-47f6fe72cec9" />

## Strategi Analisis:
1. **Identifikasi Output:** Menampilkan jumlah pengguna aktif harian dengan setidaknya melakukan satu aktivitas apapun pada hari tersebut, kolom output yang tampil yaitu tanggal/hari `day` dari kolom `activity_date` dan jumlah pengguna yang aktif pada hari itu `active_user` (kolom baru untuk menghitung jumlah pengguna aktif).
2. **Agregasi:** Untuk menghitung jumlah pengguna aktif maka digunakan fungsi agregat `COUNT` pada kolom `user_id` unik(`distinct`) agar tidak terjadi perhitungan duplikat pada id yang muncul berulang kali di beberapa baris.
3. **Penyaringan Kondisi**: Periode perhitungan tanggal selama 30 hari dan berakhir di tanggal 27 Juli 2019 maka dilakukan penyaringan menggunakan klausa `WHERE` dan operator perbandingan `BETWEEN` untuk mefilter data berdasarkan rentang waktu periode. Jika berakhir di tanggal **27 Juli 2019** maka _30 hari sebelumnya_ tepat berada di tanggal **28 Juni 2019**.
5. **Pengelompokan:** Karena outputnya adalah jumlah pengguna aktif harian maka jumlah pengguna di kelompokkan `GROUP BY` berdasarkan kolom `activity_date`.

## Solusi Query:
```sql
SELECT
    activity_date AS day,
    COUNT(distinct user_id) AS active_users
FROM activity
WHERE activity_date BETWEEN '2019-06-28' AND '2019-07-27'
GROUP BY activity_date
```
