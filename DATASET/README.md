## 📊 Dataset Summary: IDX Stock Summary 2020–2024

Dataset ini berisi data historis perdagangan saham di **Bursa Efek Indonesia (BEI)** selama periode **2020 hingga 2024**. Dataset digunakan untuk analisis tren pasar, prediksi harga saham, dan visualisasi performa sektor secara menyeluruh.

---

### 🗃️ Informasi Umum

| Atribut            | Deskripsi                                                  |
|--------------------|------------------------------------------------------------|
| 📅 Periode Waktu   | Januari 2020 – 2024                                        |
| 📈 Jumlah Saham    | ± 938 saham dari berbagai sektor                           |
| 📁 Format Awal     | CSV (mentah), Parquet/ORC (hasil transformasi)             |
| 🔍 Frekuensi Data  | Harian per saham                                           |
| 📦 Sumber Dataset  | [Kaggle - IDX Stock Summary 2020–2024](https://kaggle.com) |
| 🧮 Estimasi Ukuran | ± 50.000+ baris transaksi total                            |

---

### 🧩 Kolom Utama

| Kolom               | Tipe Data   | Deskripsi                                                |
|---------------------|-------------|----------------------------------------------------------|
| `stock_code`        | String      | Kode saham unik tiap perusahaan                          |
| `ticker`            | String      | Simbol saham (umumnya sama dengan stock_code)           |
| `company_name`      | String      | Nama lengkap perusahaan                                  |
| `remarks`           | String      | Keterangan tambahan opsional                             |
| `previous`          | Float       | Harga penutupan hari sebelumnya                          |
| `open_price`        | Float       | Harga pembukaan hari itu                                 |
| `first_trade`       | Float       | Harga transaksi pertama                                  |
| `high`              | Float       | Harga tertinggi harian                                   |
| `low`               | Float       | Harga terendah harian                                    |
| `last_trading_date` | Date        | Tanggal terakhir saham diperdagangkan                    |
| `date_time`         | Timestamp   | Cap waktu data dicatat                                   |

---

### 🧠 Kegunaan Dataset

- Analisis tren harga saham mingguan/bulanan
- Perhitungan volatilitas dan volume sektor
- Prediksi harga saham menggunakan ML
- Dashboard performa saham sektoral

---

### 📂 Lokasi Data di Proyek

| Lapisan   | Folder                     | Format           | Isi                          |
|-----------|----------------------------|------------------|-------------------------------|
| Bronze    | `/data/bronze/`            | CSV              | Data mentah dari sumber eksternal |
| Silver    | `/data/silver/`            | Parquet          | Data bersih hasil ETL        |
| Gold      | `/data/gold/`              | Parquet / ORC    | Data agregasi siap analitik  |

---

