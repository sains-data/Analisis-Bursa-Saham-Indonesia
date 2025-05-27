# 📁 Project Files – Analisis Bursa Saham Indonesia

Folder ini berisi seluruh file dan skrip yang digunakan dalam implementasi proyek Big Data untuk analisis perdagangan saham BEI (2020–2024).

---

## 📂 Struktur Folder

```
Project Files/
├── docker-compose.yml # Konfigurasi cluster Hadoop + Spark + Hive + Superset
├── spark_jobs/ # Skrip Spark untuk pembersihan dan agregasi data
│ ├── clean_saham.py
│ └── agg_saham.py
├── ingestion/ # Skrip pengambilan data dari sumber eksternal
│ └── fetch_saham.sh
├── hive/ # DDL Hive untuk membuat tabel
│ └── idx_summary.ddl
├── data/ # Folder data berdasarkan lapisan
│ ├── bronze/ # Data mentah (CSV)
│ ├── silver/ # Data hasil pembersihan (Parquet)
│ ├── gold/ # Data agregasi akhir (ORC/Parquet)
│ └── tmp/ # Folder sementara jika dibutuhkan
├── models/ # Output model prediksi saham (jika disimpan)
└── logs/ # File log job Spark & ingestion
```

---

## 🔍 Deskripsi Singkat

- `spark_jobs/`: berisi pipeline Spark (ETL) untuk memproses data saham
- `ingestion/`: shell script otomatisasi pengambilan data via `curl` dan penempatan ke HDFS
- `hive/`: skrip untuk membuat tabel Hive eksternal
- `data/`: struktur data berdasarkan arsitektur Bronze–Silver–Gold
- `models/`: hasil pelatihan model prediksi saham
- `logs/`: catatan hasil eksekusi pipeline

---

## 📌 Catatan

- Gunakan perintah `docker-compose up -d` untuk menjalankan seluruh container proyek.
- Superset tersedia di `http://localhost:8088` untuk eksplorasi visualisasi.
- File prediksi atau hasil agregasi akan muncul di `data/gold/` dan tabel Hive.

---


