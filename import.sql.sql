-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 27 Agu 2025 pada 06.25
-- Versi server: 10.4.24-MariaDB
-- Versi PHP: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `myclinic`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_activity_task`
--

CREATE TABLE `tbl_activity_task` (
  `id` int(11) NOT NULL,
  `no_reg` varchar(20) NOT NULL,
  `activity` varchar(100) NOT NULL,
  `status` enum('pending','in_progress','done') NOT NULL DEFAULT 'pending',
  `tgl_mulai` datetime NOT NULL,
  `tgl_selesai` datetime DEFAULT NULL,
  `petugas` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tbl_activity_task`
--

INSERT INTO `tbl_activity_task` (`id`, `no_reg`, `activity`, `status`, `tgl_mulai`, `tgl_selesai`, `petugas`) VALUES
(1, '12', '', 'pending', '2025-08-27 08:34:30', '2025-08-28 10:34:30', 'Cindi');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_billing`
--

CREATE TABLE `tbl_billing` (
  `id` int(11) NOT NULL,
  `no_reg` varchar(20) NOT NULL,
  `total_obat` decimal(12,2) NOT NULL,
  `total_jasa` decimal(12,2) NOT NULL,
  `total_tagihan` decimal(12,2) NOT NULL,
  `status_pembayaran` enum('unpaid','paid','partial') NOT NULL DEFAULT 'unpaid',
  `tgl_billing` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_daftar`
--

CREATE TABLE `tbl_daftar` (
  `id` int(11) NOT NULL,
  `no_reg` varchar(20) NOT NULL,
  `no_mr` varchar(20) NOT NULL,
  `kode_poli` varchar(10) NOT NULL,
  `nama_poli` varchar(100) NOT NULL,
  `tanggal_kunjungan` date NOT NULL,
  `dokter_id` int(11) NOT NULL,
  `cara_bayar` enum('jkn','non jkn') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_dokter`
--

CREATE TABLE `tbl_dokter` (
  `id` int(11) NOT NULL,
  `kode_dokter` varchar(10) NOT NULL,
  `nama_dokter` varchar(100) NOT NULL,
  `spesialis` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_obat`
--

CREATE TABLE `tbl_obat` (
  `id` int(11) NOT NULL,
  `kode_obat` varchar(10) NOT NULL,
  `nama_obat` varchar(100) NOT NULL,
  `stok` int(11) NOT NULL,
  `harga` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_pasien`
--

CREATE TABLE `tbl_pasien` (
  `id` int(11) NOT NULL,
  `no_mr` varchar(20) NOT NULL,
  `nama_pasien` varchar(100) NOT NULL,
  `tgl_lahir` tinyint(1) NOT NULL,
  `jenis_kelamin` tinyint(1) NOT NULL,
  `alamat` varchar(200) NOT NULL,
  `tanggal_daftar` date NOT NULL,
  `no_bpjs` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_resep`
--

CREATE TABLE `tbl_resep` (
  `id` int(11) NOT NULL,
  `no_reg` varchar(20) NOT NULL,
  `kode_obat` varchar(10) NOT NULL,
  `jumlah` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `tbl_activity_task`
--
ALTER TABLE `tbl_activity_task`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tbl_billing`
--
ALTER TABLE `tbl_billing`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tbl_daftar`
--
ALTER TABLE `tbl_daftar`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `no_reg` (`no_reg`),
  ADD KEY `fk_mr` (`no_mr`),
  ADD KEY `fk_doctor_id` (`dokter_id`);

--
-- Indeks untuk tabel `tbl_dokter`
--
ALTER TABLE `tbl_dokter`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `kode_dokter` (`kode_dokter`);

--
-- Indeks untuk tabel `tbl_obat`
--
ALTER TABLE `tbl_obat`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `kode_obat` (`kode_obat`);

--
-- Indeks untuk tabel `tbl_pasien`
--
ALTER TABLE `tbl_pasien`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `no_mr` (`no_mr`);

--
-- Indeks untuk tabel `tbl_resep`
--
ALTER TABLE `tbl_resep`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_reg` (`no_reg`),
  ADD KEY `fk_kode_obat` (`kode_obat`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `tbl_activity_task`
--
ALTER TABLE `tbl_activity_task`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `tbl_billing`
--
ALTER TABLE `tbl_billing`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `tbl_daftar`
--
ALTER TABLE `tbl_daftar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `tbl_dokter`
--
ALTER TABLE `tbl_dokter`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `tbl_obat`
--
ALTER TABLE `tbl_obat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `tbl_pasien`
--
ALTER TABLE `tbl_pasien`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `tbl_resep`
--
ALTER TABLE `tbl_resep`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `tbl_daftar`
--
ALTER TABLE `tbl_daftar`
  ADD CONSTRAINT `fk_doctor_id` FOREIGN KEY (`dokter_id`) REFERENCES `tbl_dokter` (`id`),
  ADD CONSTRAINT `fk_mr` FOREIGN KEY (`no_mr`) REFERENCES `tbl_pasien` (`no_mr`);

--
-- Ketidakleluasaan untuk tabel `tbl_resep`
--
ALTER TABLE `tbl_resep`
  ADD CONSTRAINT `fk_kode_obat` FOREIGN KEY (`kode_obat`) REFERENCES `tbl_obat` (`kode_obat`),
  ADD CONSTRAINT `fk_reg` FOREIGN KEY (`no_reg`) REFERENCES `tbl_daftar` (`no_reg`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
