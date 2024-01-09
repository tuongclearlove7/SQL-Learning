create database ban_hang;
use ban_hang;


CREATE TABLE loaihang (
    maloai     INT primary key  NOT NULL,
    tenloai  NVARCHAR (50)  NULL,
    hinh    NVARCHAR (MAX) NULL,
    CONSTRAINT FK_mathang_loaihang FOREIGN KEY (maloai) REFERENCES loaihang (maloai)
);

CREATE TABLE mathang (
    mahang     nvarchar(10)   primary key   NOT NULL,
    tenhang  NVARCHAR (50)  NULL,
    mota    NVARCHAR (MAX) NULL,
    dongia FLOAT (53)     NULL,
	maloai     INT null,
	hinh    NVARCHAR (MAX) NULL,
	CONSTRAINT FK_donhang_mathang FOREIGN KEY (mahang) REFERENCES mathang (mahang)
);


CREATE TABLE donhang (
    tendangnhap    nvarchar(50) primary key  NOT NULL,
    mahang  NVARCHAR (10)  NULL,
	soluong     INT null,
	CONSTRAINT FK_donhang_khachhang FOREIGN KEY (tendangnhap) REFERENCES donhang (tendangnhap)

);

CREATE TABLE khachhang (
    tendangnhap    nvarchar(50)  primary key    NOT NULL,
    matkhau  NVARCHAR (50)  NULL,
);

CREATE TABLE thanhtoan(
    mathanhtoan INT NOT NULL,
    tendangnhap NVARCHAR(50) NOT NULL,
    sotien FLOAT NULL,
	mahang NVARCHAR (10) NULL,
    PRIMARY KEY CLUSTERED (mathanhtoan ASC),
    CONSTRAINT FK_thanhtoan_mathang FOREIGN KEY (mahang) REFERENCES mathang(mahang)
);

ALTER TABLE mathang
ADD CONSTRAINT FK_mathang_loaihang FOREIGN KEY (maloai)
REFERENCES loaihang (maloai);

ALTER TABLE donhang
ADD CONSTRAINT FK_donhang_mathang FOREIGN KEY (mahang)
REFERENCES mathang (mahang);

ALTER TABLE donhang
ADD CONSTRAINT FK_donhang_khachhang FOREIGN KEY (tendangnhap)
REFERENCES khachhang (tendangnhap);

INSERT INTO loaihang(maloai, tenloai, hinh)
VALUES (1,'Máy tính','maytinh.png'),
		(2,'áo','ao.png'),
		(3,'quần','quan.png'),
		(4,'Túi xách','tuixach.png');

INSERT INTO mathang(mahang, tenhang, mota, dongia, maloai, hinh)
VALUES ('MH01','Máy tính','mota',1000,1,'maytinh.png'),
		('MH02','Máy tính2','mota',2000,1,'maytinh.png'),
		('MH03','Máy tính3','mota',3000,2,'maytinh.png'),
		('MH04','Máy tính4','mota',5000,2,'maytinh.png');

INSERT INTO mathang(mahang, tenhang, mota, dongia, maloai, hinh)
VALUES ('MH05','quan dui','mota',1000,3,'quan.png'),
		('MH06','quan dai','mota',2000,3,'quan.png'),
		('MH07','tui da','mota',3000,4,'tui.png'),
		('MH08','tui gucci','mota',5000,4,'tui.png');



INSERT INTO mathang(mahang, tenhang, mota, dongia, maloai, hinh)
VALUES ('MH09','quan dui','mota',1000,3,'quan.png'),
		('MH10','quan dai','mota',2000,3,'quan.png'),
		('MH11','tui da','mota',3000,4,'tui.png'),
		('MH12','tui gucci','mota',5000,4,'tui.png');

INSERT INTO mathang(mahang, tenhang, mota, dongia, maloai, hinh)
VALUES ('MH13','quan dui','mota',1000,3,'quan.jpg'),
		('MH14','quan dai','mota',2000,3,'quan.jpg'),
		('MH15','quan jean','mota',3000,4,'quan.jpg'),
		('MH16','quần bò','mota',5000,4,'quan.jpg');

INSERT INTO donhang(tendangnhap, mahang, soluong)
VALUES ('user1','MH10',2),
		('user2','MH11',1),
		('user3','MH12',3),
		('user4','MH13',3),
		('user5','MH03',3),
		('user6','MH03',5),
		('user7','MH04',7),
		('user8','MH04',10);



INSERT INTO khachhang(tendangnhap, matkhau)
VALUES ('user1','123456'),
		('user2','123456'),
		('user3','123456'),
		('user4','123456'),
		('user5','123456'),
		('user6','123456'),
		('user7','123456'),
		('user8','123456');

INSERT INTO thanhtoan(mathanhtoan, tendangnhap, sotien, mahang)
VALUES(4,'user4',4000,'MH10'),
		(5,'user5',5000,'MH11'),
		(6,'user6',6000, 'MH12'),
		(7,'user7',7000, 'MH13'),
		(8,'user8',8000, 'MH14');



SELECT * FROM mathang, loaihang
WHERE mathang.maloai = loaihang.maloai
AND loaihang.tenloai = 'Máy tính';

SELECT * FROM mathang, loaihang
WHERE mathang.maloai = loaihang.maloai
AND mathang.maloai = 1;

select tenloai from loaihang
where loaihang.maloai=1;

SELECT mathang.tenhang FROM mathang, loaihang
WHERE mathang.maloai = loaihang.maloai
AND loaihang.tenloai = 'Máy tính';


SELECT * FROM mathang, loaihang
WHERE mathang.maloai = loaihang.maloai
AND loaihang.tenloai = 'áo';

SELECT * FROM mathang, loaihang
WHERE mathang.maloai = loaihang.maloai
AND loaihang.tenloai = 'quần';



SELECT * FROM mathang, loaihang
WHERE mathang.maloai = loaihang.maloai
AND loaihang.tenloai = 'túi xách';


SELECT mathang.hinh FROM mathang, loaihang
WHERE mathang.maloai = loaihang.maloai
AND loaihang.tenloai = 'túi xách';

update mathang
set tenhang = 'áo thun'
where maloai = 2;

update mathang
set tenhang = 'lap top MSI'
where mahang = 'MH02';

update mathang
set tenhang = 'PC gamming'
where mahang = 'MH01';

update mathang
set hinh = 'pc_gamming.jpg'
where maloai = 1;

update mathang
set hinh = 'lap_msi.jpg'
where mahang = 'MH02';

update mathang
set hinh = 'ao.jpg'
where maloai = 2;

update mathang
set hinh = 'quan.jpg'
where maloai = 3;

update mathang
set hinh = 'quan.jpg'
where maloai = 3;

update mathang
set hinh = 'tui2.jpg', tenhang = '' where maloai = 3;


update mathang
set maloai = 3
where hinh = 'quan.jpg';

UPDATE donhang SET donhang.soluong = 2 WHERE donhang.tendangnhap = 'user1';

select loaihang.tenloai from loaihang;

select count(*) from mathang;

select count(*) from loaihang;

select * from loaihang where loaihang.maloai = 3;
 


select dongia * maloai  from mathang;

UPDATE mathang SET mahang = 'MH01' where mathang.maloai = 3;

ALTER TABLE mathang NOCHECK CONSTRAINT FK_mathang_loaihang;
ALTER TABLE donhang NOCHECK CONSTRAINT FK_donhang_mathang;
ALTER TABLE donhang NOCHECK CONSTRAINT FK_donhang_khachhang;

ALTER TABLE mathang CHECK CONSTRAINT FK_mathang_loaihang;
ALTER TABLE donhang CHECK CONSTRAINT FK_donhang_mathang;
ALTER TABLE donhang CHECK CONSTRAINT FK_donhang_khachhang;

delete  from mathang where mahang = 'MH01' and tenhang = 'Máy tính';
delete  from mathang where mahang = 'MH04';
delete  from mathang where mahang = 'MH03';
delete  from mathang where mahang = 'MH02' and tenhang like 'Máy tính2';
delete  from mathang where mahang in('MH03') and tenhang like 'Máy tính3';

delete  from loaihang where maloai = 1;
delete  from loaihang where maloai = 2;

delete  from mathang where mathang.maloai = 2;

SELECT COUNT(*) FROM donhang WHERE mahang = 'MH01';
SELECT COUNT(*) FROM donhang INNER JOIN mathang ON donhang.mahang = mathang.mahang WHERE mathang.maloai = 1;


select * from mathang , loaihang where mathang.maloai = loaihang.maloai order by mathang.dongia asc;
select * from mathang , loaihang where mathang.maloai = loaihang.maloai order by mathang.maloai DESC;

select * from mathang , loaihang where mathang.maloai = loaihang.maloai and mathang.maloai = 1;

update donhang set soluong = 2 where tendangnhap like 'user1' and mahang like '%01';

select donhang.tendangnhap from donhang, khachhang where donhang.tendangnhap = khachhang.tendangnhap;

select * from mathang, donhang where mathang.mahang = donhang.mahang and donhang.tendangnhap like '%1' order by mathang.dongia asc;

DELETE FROM donhang WHERE donhang.mahang IN ('MH01','MH02') and donhang.tendangnhap like 'user1';
select * from mathang, donhang where mathang.mahang = donhang.mahang and mathang.mahang = 'MH01';
select * from mathang, donhang where mathang.mahang = donhang.mahang and donhang.tendangnhap = 'user3';

select * from mathang, donhang where mathang.mahang = donhang.mahang;
select * from mathang, donhang where mathang.mahang = donhang.mahang and mathang.maloai = 2 and donhang.tendangnhap = 'user7';

select * from mathang, loaihang where mathang.maloai = loaihang.maloai;
select * from mathang, loaihang where mathang.maloai = loaihang.maloai AND loaihang.tenloai = 'áo';

select * from loaihang;
select * from mathang;
select * from donhang;
select * from khachhang;
select * from thanhtoan;

SELECT * FROM thanhtoan, khachhang, mathang, donhang WHERE thanhtoan.tendangnhap = khachhang.tendangnhap and donhang.tendangnhap = khachhang.tendangnhap;

SELECT * FROM khachhang, thanhtoan WHERE khachhang.tendangnhap = thanhtoan.tendangnhap and thanhtoan.tendangnhap like 'user1';

select * from mathang, donhang where mathang.mahang = donhang.mahang and donhang.tendangnhap = 'user7' and donhang.mahang = 'MH04';
select * from mathang, donhang where mathang.mahang = donhang.mahang;

SELECT dongia*soluong as 'thanhtien' , CASE WHEN donhang.soluong > 0 
THEN 'Chưa thanh toán' ELSE 'Đã thanh toán' END as 'thanhtoan',* 
FROM mathang, donhang, thanhtoan 
WHERE mathang.mahang = thanhtoan.mahang AND mathang.mahang = donhang.mahang;



drop table loaihang;
drop table mathang;
drop table donhang;
drop table khachhang;
drop table thanhtoan;

















