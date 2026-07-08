# 180. Consecutive Numbers
**Category :** `Advanced Select and Joins` | 
**Difficulty :**  `Medium`

## Deskripsi Masalah:
Temukan semua angka yang muncul setidaknya tiga kali berturut-turut.

Kembalikan tabel hasil dalam urutan apa pun.

## Tabel Input dan Output
<img width="300" height="400" alt="image" src="https://github.com/user-attachments/assets/a072fdd9-9e57-461e-985e-ba2efc1ce3e9" />

## Strategi Analisis:
1. **Identifikasi Output:** Menampilkan angka(`num`) apa saja yang minimal muncul tiga kali secara berturut turut menggunakan klausa `SELECT` dengan kolom baru yang diberi nama alias `ConsecutiveNums`.
2. **Penggabungan Data(Self-Join):** Menghubungkan tabel `logs` dengan dirinya sendiri sebanyak 3 kali (diwakili alias `a`, `b`, `c`) untuk membandingkan baris yang berurutan.
   * Tabel `b` digabungkan berdasarkan kondisi `a.id + 1 = b.id` untuk memastikan baris tepat 1 langkah setelah tabel `a`. Misal baris pertama tabel `a` dengan `id = 1` maka tabel `b` bergabung ke samping tabel `a` dengan memastikan `id = 2` (`1 + 1 = 2`).
   * Tabel `c` digabungkan berdasarkan kondisi `a.id + 2 = c.id` untuk memastikan baris tepat 2 langkah setelah tabel `a`. Sama seperti konsep tabel `b`, jika di baris pertama tabel `a` dengan `id=1` maka di `b` adalah `id=2` dan di `c` adalah `id=3` (hasil `1 + 2 = 3`). 
3. **Penyaringan Kondisi(Filter):** Menerapkan klausa `WHERE` untuk memastikan bahwa nilai angka pada ketiga baris berurutan tersebut sama nilainya (`a.num = b.num AND b.num = c.num`)
## Solusi Query:
```sql
SELECT
    a.num AS ConsecutiveNums 
FROM
    logs a 
JOIN
    logs b ON a.id + 1 = b.id
JOIN
    logs c ON a.id + 2 = c.id
WHERE a.num = b.num AND b.num = c.num
```
