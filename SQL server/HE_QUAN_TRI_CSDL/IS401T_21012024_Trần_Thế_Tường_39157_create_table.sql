create database QUANLYLUONG
use QUANLYLUONG

CREATE TABLE nhanvien (
    manv VARCHAR(20) PRIMARY KEY,
    hoten NVARCHAR(255),
    ngaysinh DATETIME,
    phai int,
    quequan VARCHAR(255),
    sodt VARCHAR(20),
    mapb VARCHAR(20),
);

CREATE TABLE phongban (
    mapb VARCHAR(20) PRIMARY KEY,
	tenpb NVARCHAR(255),

);


CREATE TABLE chucvu (
    macv VARCHAR(20) PRIMARY KEY,
	tencv NVARCHAR(255),
	hscv decimal,

);

CREATE TABLE hesoluong (
    thang int,
	hsl decimal,
	manv VARCHAR(20),

);

ALTER TABLE nhanvien
ADD CONSTRAINT nhanvien_Fk_phongban
    FOREIGN KEY (mapb) REFERENCES phongban(mapb);

ALTER TABLE nhanvien
ADD CONSTRAINT nhanvien_Fk_chucvu
    FOREIGN KEY (macv) REFERENCES chucvu(macv);

ALTER TABLE hesoluong
ADD CONSTRAINT hesoluong_Fk_nhanvien
    FOREIGN KEY (manv) REFERENCES nhanvien(manv);


ALTER TABLE chucvu
DROP CONSTRAINT chucvu_Fk_nhanvien;

ALTER TABLE chucvu
DROP COLUMN manv;

ALTER TABLE nhanvien
add macv varchar(20);





