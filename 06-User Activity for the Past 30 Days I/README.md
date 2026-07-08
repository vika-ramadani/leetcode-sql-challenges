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
## Solusi Query:
```sql
SELECT
    activity_date AS day,
    COUNT(distinct user_id) AS active_users
FROM activity
WHERE activity_date BETWEEN '2019-06-28' AND '2019-07-27'
GROUP BY activity_date
```
