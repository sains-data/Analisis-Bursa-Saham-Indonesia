# 📈 Big Data untuk Analisis Perdagangan Saham BEI 2020–2024

Repositori ini merupakan dokumentasi dan implementasi proyek Big Data untuk menganalisis data historis perdagangan saham di Bursa Efek Indonesia (BEI) selama tahun 2020 hingga 2024.

> 🧠 Proyek ini merupakan tugas besar mata kuliah *Pergudangan Data* oleh Kelompok 14, Program Studi Sains Data, Institut Teknologi Sumatera.

---

## 📊 Studi Kasus

Analisis dilakukan menggunakan dataset "IDX Stock Summary 2020–2024" dari Kaggle. Sistem dirancang untuk menyimpan, membersihkan, dan menganalisis data saham secara efisien menggunakan arsitektur **Big Data** modern.

### 🔍 Tantangan

- Volume data sangat besar dan kompleks.
- Format data tidak seragam dan membutuhkan transformasi.
- Kebutuhan visualisasi untuk pengambilan keputusan pasar modal.

---

## 🏗️ Arsitektur Sistem

Sistem dibangun dengan pendekatan **Medallion Architecture (Bronze, Silver, Gold)** dan komponen utama:

- **Bronze Layer**: Penyimpanan data mentah (CSV).
- **Silver Layer**: Transformasi & pembersihan (Parquet).
- **Gold Layer**: Agregasi data & analisis (Parquet/ORC).

🛠 Tools yang digunakan:
- HDFS, YARN (Hadoop)
- Apache Spark & Hive
- Apache Superset
- Docker (untuk klaster lokal)

---

## ⚙️ Implementasi

Pipeline data berjalan secara batch dan otomatis:

1. `fetch_saham.sh`: Mengambil data dari API/FTP dan menyimpan di Bronze Layer.
2. `clean_saham.py`: Membersihkan data dengan Spark.
3. `agg_saham.py`: Agregasi data saham ke Gold Layer.
4. Visualisasi menggunakan Superset Dashboard.

📁 Struktur Folder:

```
/opt/bigdata/
├── data/bronze/
├── data/silver/
├── data/gold/
├── spark_jobs/
├── ingestion/
├── hive/
└── logs/
```

---

## 📈 Contoh Analisis & Model ML

- Prediksi harga penutupan saham menggunakan **Random Forest Regression**.
- Visualisasi tren harga & volume perdagangan per saham.
- Hasil disimpan ke Hive dan divisualisasikan di Superset.

---

## 🧪 Pengujian

✅ Pengambilan data  
✅ Transformasi dan pembersihan  
✅ Agregasi dan query Hive  
✅ Visualisasi dashboard  
✅ Evaluasi model ML

---

## 📎 Dokumentasi Lengkap

📄 [Klik untuk melihat Dokumen Proyek (PDF)](https://drive.google.com/file/d/1OLikgquoFKu4zpKcU_TfUTdACWch-qRi/view?usp=sharing)

---

