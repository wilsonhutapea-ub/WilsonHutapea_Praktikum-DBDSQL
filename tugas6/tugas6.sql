use akademik;

# Latihan I

# No 1
INSERT INTO akademik.mahasiswa values('155150404', 1, 212,'JESSY',2016,'1999-2-10','BANDUNG','F'),
('155150405', 2 ,219,'BAMBANG',2014,'1996-9-27','MAKASSAR','M');

# No 2
CREATE TABLE AKADEMIK.MAHASISWA_PINDAHAN
(
    NIM VARCHAR(15) NOT NULL PRIMARY KEY,
    ID_SELEKSI_MASUK SMALLINT,
    FOREIGN KEY (ID_SELEKSI_MASUK) REFERENCES AKADEMIK.SELEKSI_MASUK(ID_SELEKSI_MASUK),
    ID_PROGRAM_STUDI SMALLINT,
    FOREIGN KEY (ID_PROGRAM_STUDI) REFERENCES AKADEMIK.PROGRAM_STUDI(ID_PROGRAM_STUDI),
    NAMA VARCHAR(45),
    ANGKATAN SMALLINT,
    TGL_LAHIR DATE,
    KOTA_LAHIR VARCHAR(60),
    JENIS_KELAMIN CHAR(1) CHECK (JENIS_KELAMIN IN ('M','F'))
);

# No 3
INSERT INTO AKADEMIK.MAHASISWA_PINDAHAN
    VALUES  ('155150500', 1 ,211,'BUDI', 2015,'1997-3-3','BANYUWANGI','M'),
            ('155150501', 2,212,'ANDI',2015,'1997-2-21','JAKARTA','M'),
            ('155150502', 2 ,211,'DIMAS', 2015,'1998-4-11','SURABAYA','M'),
            ('155150503', 2 ,211,'DIDIN',2015,'1997-2-26','BANDUNG','M');

# No 4
select mp.NIM, mp.NAMA, mp.JENIS_KELAMIN, mp.KOTA_LAHIR, mp.ANGKATAN
    from(
        select *
            from AKADEMIK.MAHASISWA_PINDAHAN mp1
            where substr(mp1.KOTA_LAHIR, 1, 1) = 'B'
        union
        select *
            from AKADEMIK.MAHASISWA_PINDAHAN mp2
            where substr(mp2.NAMA, 1, 1) = 'D'
    ) mp;

# No 5
select data.NIM, data.NAMA, data.JENIS_KELAMIN, data.KOTA_LAHIR, data.ANGKATAN
    from(
        select * from AKADEMIK.mahasiswa m1
            where m1.ANGKATAN = 2015
        union
        select *
        from(
            select * from AKADEMIK.MAHASISWA_PINDAHAN mpz
            except
            select * from AKADEMIK.MAHASISWA_PINDAHAN mp
                     where substr(mp.KOTA_LAHIR, 1, 1) = 'M'
        ) mp_tanpa_inisial_m
    ) data;

# LATIHAN II

# No 1 - Subquery
select m.NIM, m.NAMA, m.ANGKATAN from AKADEMIK.mahasiswa m, (
        select * from akademik.mahasiswa_pindahan mp where mp.NAMA like "%budi%"
    ) mp_budi
where m.KOTA_LAHIR = mp_budi.KOTA_LAHIR;

# No 2 - Subquery
select m.NIM, m.NAMA, m.ANGKATAN, m.KOTA_LAHIR, "sama kota lahir dengan", mp.NAMA, mp.KOTA_LAHIR
from AKADEMIK.mahasiswa m, (
    select * from AKADEMIK.mahasiswa_pindahan
) mp
where m.KOTA_LAHIR = mp.KOTA_LAHIR;

