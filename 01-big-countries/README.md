# 595. Big Countries
**Kategori :** `Basic Select`

**Tingkat Kesulitan :**  `Easy`

## Deskripsi Masalah:
Suatu negara dianggap besar jika:
* memiliki luas wilayah setidaknya tiga juta (yaitu, 3.000.000 km2), atau
* memiliki populasi setidaknya dua puluh lima juta (yaitu, 25.000.000).

Tuliskan solusi untuk menemukan nama(`name`), populasi(`population`), dan luas wilayah(`area`) negara-negara besar.
Kembalikan tabel hasil dalam urutan apa pun.

## Tabel Input dan Output
<img width="500" height="300" alt="image" src="https://github.com/user-attachments/assets/b54759e5-baee-4fb7-8704-c583ea6be465" />


## Strategi Analisis:
1. Mendefinisikan kolom secara spesifik di bagian `select` sesuai permintaan yaitu menampilkan nama, populasi, dan luas wilayah negara-negara besar.
2. Menentukan negara-negara besar dengan 2 kondisi (luas wilayah, populasi) dimana minimal salah satu dari kondisi harus bernilai `True`, maka dari itu digunakan operator logika `OR`.
3. Menerapkan filter logika `>=` untuk menyaring syarat ambang batas yang telah ditentukan untuk luas wilayah dan populasi.

## Solusi Query:
```
SELECT name, population, area
FROM World
WHERE area >= 3000000 OR population >= 25000000;
```
