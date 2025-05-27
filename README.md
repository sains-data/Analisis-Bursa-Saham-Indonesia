# Analisis-Bursa-Saham-Indonesia

## 📄 Ringkasan Proyek

Dokumen ini merupakan spesifikasi proyek Big Data yang disusun oleh **Kelompok 14 - Program Studi Sains Data, Institut Teknologi Sumatera**. Proyek ini berjudul:

**"Implementasi Arsitektur Big Data untuk Analisis Perdagangan Saham BEI 2020–2024"**

Proyek bertujuan untuk membangun arsitektur Big Data berbasis Hadoop (HDFS, Hive, YARN, Spark) yang mampu menyimpan dan memproses data historis saham secara terdistribusi. Sistem ini dirancang dengan pendekatan **Medallion Architecture**:

![image](https://github.com/user-attachments/assets/4b0b9661-4b3a-49e7-92d4-a54125477452)


- 🟤 **Bronze Layer**: Menyimpan data mentah (raw) ke dalam HDFS sebagai data lake.
- ⚪ **Silver Layer**: Pembersihan dan transformasi data menggunakan Apache Spark dan Hive.
- 🟡 **Gold Layer**: Penyajian data siap analisis melalui Hive SQL dan visualisasi dengan Apache Superset.

Tujuan akhir dari sistem ini adalah mendukung analisis historis data saham dan menyajikan informasi secara visual guna membantu pengambilan keputusan di pasar modal.

---

## 👥 Tim Proyek

Kelompok 14 – Sains Data ITERA  
- Kiwit Novitasari  
- Rayan Koemi Karuby  
- Safitri  
- Amalia Melani Putri  
