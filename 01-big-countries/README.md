# 595. Big Countries
**Category :** `Basic Select`

**Difficulty :**  `Easy`

## Deskripsi Masalah:
Suatu negara dianggap besar jika:
* memiliki luas wilayah setidaknya tiga juta (yaitu, 3.000.000 km2), atau
* memiliki populasi setidaknya dua puluh lima juta (yaitu, 25.000.000).

Tuliskan solusi untuk menemukan nama(`name`), populasi(`population`), dan luas wilayah(`area`) negara-negara besar.
Kembalikan tabel hasil dalam urutan apa pun.

## Tabel Input dan Output
<img width="500" height="300" alt="image" src="https://github.com/user-attachments/assets/b54759e5-baee-4fb7-8704-c583ea6be465" />


## Strategi Analisis:
1. **Melakukan Filter** untuk negara-negara yang akan ditampilkan menggunakan klausa `WHERE` dengan operator logika `OR` untuk memeriksa salah satu kondisi berikut harus terpenuhi, serta operator perbandingan `>=` untuk memenuhi kata kunci "setidaknya" pada soal:
   * luas wilayah (`area >= 3.000.000` km) `OR`
   * populasi (`population >= 25.000.000`)
2. **Menampilkan Kolom** `name`, `population`, `area` menggunakan klausa `SELECT` dari tabel `World`.

## Solusi Query:
```
SELECT name, population, area
FROM World
WHERE area >= 3000000 OR population >= 25000000;
```
