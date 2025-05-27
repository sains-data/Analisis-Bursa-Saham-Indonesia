# 📊 Pemrosesan & Visualisasi Data Saham dengan Arsitektur Big Data 3-Tier

## 📌 Ringkasan
Proyek ini mengimplementasikan **arsitektur Big Data 3-tier (Bronze, Silver, Gold)** untuk memproses dan memvisualisasikan data historis perdagangan saham dari Bursa Efek Indonesia (BEI) untuk periode 2020–2024. Pipeline ini menggunakan **HDFS**, **Apache Spark**, **Apache Hive**, dan **Power BI** untuk mendukung pemrosesan batch skala besar dan analitik visual yang interaktif.

📄 Akses Laporan Lengkap: [Google Drive](https://drive.google.com/drive/folders/1qT34g7YxNixQLdyZcuhSUoH6VsAgaZLm?usp=sharing)

---

## ⚙️ Arsitektur

### 🥉 Lapisan Bronze
- Menyimpan data mentah di **Hadoop Distributed File System (HDFS)**
- Format asli dipertahankan untuk keperluan audit dan replikasi

### 🥈 Lapisan Silver
- Pembersihan dan transformasi data dengan **Apache Spark**
- Proses ETL meliputi:
  - Normalisasi waktu
  - Agregasi bulanan
  - Pembersihan dan format data

### 🥇 Lapisan Gold
- Menyimpan data hasil olahan dalam format CSV terstruktur
- Data didaftarkan sebagai tabel eksternal di **Apache Hive**
- Siap digunakan untuk analisis lanjutan

---

## 📊 Visualisasi Data
Dashboard **Power BI** meliputi:
- 📈 Grafik Garis: Tren harga penutupan saham (2020–2024)
- 📉 Grafik Area: Dinamika volume transaksi harian
- 📊 Grafik Batang: Perbandingan volume transaksi per kuartal
- 🎯 Grafik Gauge: Total volume transaksi keseluruhan

Fokus utama pada **saham sektor perbankan** (contoh: BBCA, BBRI, BBNI, BMRI, BBTN).

---

## 📁 Dataset
- Sumber: [Kaggle IDX Historical Data](https://www.kaggle.com/datasets/eren2222/indonesia-stock-exchange-idx-historical-price)
- Periode: 2020–2024
- Isi: >900 saham dari berbagai sektor industri
- Format: CSV (berisi open, close, high, low, volume, kapitalisasi, tanggal)

---

## ✅ Temuan Utama
- Arsitektur 3-tier terbukti efisien dan scalable dalam menangani data saham historis.
- Terdapat lonjakan volume transaksi di kuartal keempat, menunjukkan pola musiman.
- Power BI memungkinkan eksplorasi data yang kaya dan interaktif untuk mendukung pengambilan keputusan berbasis data.

---

## 📌 Kesimpulan
- Pipeline berhasil dirancang dan diimplementasikan secara menyeluruh untuk pengolahan data saham berskala besar.
- Proses ETL dengan Apache Spark menunjukkan performa tinggi.
- Visualisasi melalui Power BI memberikan wawasan yang dapat ditindaklanjuti oleh investor dan analis.

---

## 🧠 Saran Pengembangan
1. **Integrasi variabel eksternal** (contoh: indikator ekonomi makro, sentimen media) untuk analisis lebih dalam.
2. **Implementasi pemrosesan data real-time** dengan Apache Kafka atau Spark Streaming.
3. **Penerapan machine learning** untuk deteksi anomali dan prediksi harga saham.
4. Kembangkan visualisasi lebih lanjut dengan **heatmap, filter drill-down, dan sistem penilaian performa**.
5. Lakukan **pengujian skalabilitas** terhadap dataset yang lebih kompleks.

---

## 👨‍💻 Teknologi yang Digunakan
- Hadoop Distributed File System (HDFS)
- Apache Spark
- Apache Hive
- Power BI
- Python (untuk scripting dan transformasi data)
"""
