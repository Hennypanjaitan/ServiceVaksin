CREATE DATABASE Vaksin_07


CREATE TABLE Akun (
	id_akun INT NOT NULL IDENTITY(1,1),
	username VARCHAR (20) NOT NULL,
	password VARCHAR(30) NOT NULL,
	role VARCHAR (30) NOT NULL,
	PRIMARY KEY (id_akun));

CREATE TABLE Data_Vaksin (
	no_register VARCHAR(20) NOT NULL,
	tanggal_dibuat datetime NOT NULL DEFAULT GETDATE() ,
	PRIMARY KEY (no_register));

CREATE TABLE Data_Pasien  (
	id_pasien SMALLINT NOT NULL IDENTITY(1,1),
	no_rekam_medis VARCHAR (20) NOT NULL,
	nama_pasien VARCHAR(30) NOT NULL,
	PRIMARY KEY (id_pasien));

CREATE TABLE Masyarakat  (
	nik VARCHAR (20) NOT NULL,
	nama VARCHAR (20) NOT NULL,
	alamat VARCHAR (20),
	jenis_kelamin VARCHAR(10)
	PRIMARY KEY (nik));
	
CREATE TABLE Data_Penduduk  (
	id_data SMALLINT NOT NULL IDENTITY(1,1),
	nik VARCHAR (20) NOT NULL,
	PRIMARY KEY (id_data),
	FOREIGN KEY (nik) REFERENCES Masyarakat (nik));

insert into Akun values
	('sonya', 'sonya123', 'Pemerintah'),
	('jennifer', 'jeni123', 'Masyarakat'),
	('henny', 'henny123', 'BPOM'),
	('andre', 'andre123', 'Produsen'),
	('rstrutung', 'rstrutung899', 'RumahSakit');

insert into Masyarakat values
	('123456756780', 'mustika', 'balige', 'perempuan'),
	('098765434567', 'nursista', 'sibolga', 'perempuan'),
	('422353454545', 'pahala', 'medan', 'laki-laki'),
	('467896543349', 'sonya', 'tarutung', 'perempuan');

insert into Data_Penduduk values
	('123456756780'),
	('098765434567'),
	('422353454545'),
	('467896543349');

insert into Data_Vaksin values
	('345678',''),
	('456788',''),
	('654444',''),
	('234566','');

select * from Data_Vaksin