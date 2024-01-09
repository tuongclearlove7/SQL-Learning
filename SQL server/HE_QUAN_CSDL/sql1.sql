create database QUANLYBANHANG

create table khachhang(

	makh varchar(5) not null primary key,
	hoten nvarchar(20),
	diachi nvarchar(20),
	sodt nvarchar(20),


)

create table hoadon(

	mahd varchar(5) not null primary key,
	ngayhd datetime,
	ngaygh datetime,
	makh varchar(5),


)

create table dmhang(

	mahang varchar(5) not null primary key,
	tenhang nvarchar(20),
	dvt nvarchar(20),
	slton int,


)


create table nhacungcap(

	mancc varchar(5) not null primary key,
	tenncc nvarchar(20),
	diachi nvarchar(20),
	slton nvarchar(255),
	sodt nvarchar(20),
	mahang varchar(5),


)

create table chitiet(

	
	mahd varchar(5),
	mahang varchar(5),
	slban int,
	dongia decimal



)

ALTER TABLE hoadon
ADD CONSTRAINT hoadon_Fk_khachhang
    FOREIGN KEY (makh) REFERENCES khachhang(makh);

ALTER TABLE nhacungcap
ADD CONSTRAINT nhacungcap_Fk_dmhang
    FOREIGN KEY (mahang) REFERENCES dmhang(mahang);

ALTER TABLE chitiet
ADD CONSTRAINT chitiet_Fk_dmhang
    FOREIGN KEY (mahang) REFERENCES dmhang(mahang);

ALTER TABLE chitiet
ADD CONSTRAINT chitiet_Fk_hoadon
    FOREIGN KEY (mahd) REFERENCES hoadon(mahd);

drop table khachhang
drop table hoadon
drop table donhang
drop table nhacungcap
drop table chitiet


































