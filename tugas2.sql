create schema PENJUALANDVD

create table PENJUALANDVD.MOVIE
(
	KODE_DVD VARCHAR(10) primary key,
	JUDUL VARCHAR(60),
	HARGA_SEWA DOUBLE,
	DENDA DOUBLE,
	TAHUN_RILIS smallint
)

create table penjualandvd.GENRE_MOVIE
(
	ID_GENRE smallint,
	KODE_DVD VARCHAR(10),
	foreign key (ID_GENRE) references penjualandvd.GENRE(ID_GENRE),
	foreign key (KODE_DVD) references penjualandvd.MOVIE(KODE_DVD),
	primary key (ID_GENRE, KODE_DVD)
)

create table penjualandvd.GENRE
(
	ID_GENRE smallint primary key,
	GENRE VARCHAR(45)
)

create table penjualandvd.KECAMATAN
(
	ID_KECAMATAN smallint primary key,
	KECAMATAN VARCHAR(45)
)

create table penjualandvd.KELURAHAN
(
	ID_KELURAHAN smallint primary key,
	ID_KECAMATAN smallint,
	KELURAHAN VARCHAR(45),
	foreign key (ID_KECAMATAN) references penjualandvd.KECAMATAN(ID_KECAMATAN)
)

create table penjualandvd.PELANGGAN
(
	KODE_PELANGGAN VARCHAR(10) primary key,
	ID_KELURAHAN smallint,
	NAMA VARCHAR(45),
	ALAMAT VARCHAR(60),
	JENIS_KELAMIN CHAR(1),
	foreign key (ID_KELURAHAN) references penjualandvd.KELURAHAN(ID_KELURAHAN)
	constraint CHK_JENIS_KELAMIN check (JENIS_KELAMIN in ('P', 'L'))
)

create table KONTAK_PELANGGAN
(
	NO_HP VARCHAR(25) UNIQUE,
	KODE_PELANGGAN VARCHAR(10),
	foreign key (KODE_PELANGGAN) references penjualandvd.PELANGGAN(KODE_PELANGGAN)
)

create table penjualandvd.TRANSAKSI
(
	KODE_DVD VARCHAR(10),
	KODE_PELANGGAN VARCHAR(10),
	TANGGAL_SEWA DATE,
	TANGGAL_WAJIB_KEMBALI DATE,
	TANGGAL_REALISASI_KEMBALI DATE,
	foreign key (KODE_DVD) references penjualandvd.MOVIE(KODE_DVD),
	foreign key (KODE_PELANGGAN) references penjualandvd.PELANGGAN(KODE_PELANGGAN),
	primary key (KODE_DVD, KODE_PELANGGAN, TANGGAL_SEWA)
)

alter table penjualandvd.MOVIE modify TAHUN_RILIS YEAR(4)