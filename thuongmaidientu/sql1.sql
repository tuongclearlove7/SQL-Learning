create database ban_hang;
use ban_hang;


CREATE TABLE loaihang (
    maloai     INT primary key  NOT NULL,
    tenloai  NVARCHAR (50)  NULL,
    hinh    NVARCHAR (MAX) NULL,
   
);

CREATE TABLE mathang (
    mahang     nvarchar(10)   primary key   NOT NULL,
    tenhang  NVARCHAR (50)  NULL,
    mota    NVARCHAR (MAX) NULL,
    dongia FLOAT (53)     NULL,
	maloai     INT null,
	hinh    NVARCHAR (MAX) NULL,
);


CREATE TABLE donhang (
    tendangnhap    nvarchar(50) primary key  NOT NULL,
    mahang  NVARCHAR (10)  NULL,
	soluong     INT null,
);

CREATE TABLE khachhang (
    tendangnhap    nvarchar(50)  primary key    NOT NULL,
    matkhau  NVARCHAR (50)  NULL,
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

INSERT INTO donhang(tendangnhap, mahang, soluong)
VALUES ('user1','MH01',2),
		('user2','MH01',1),
		('user3','MH02',3),
		('user4','MH02',3),
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


SELECT * FROM mathang, loaihang
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
set hinh = 'tui.jpg'
where maloai = 4;

select * from loaihang;
select * from mathang;
select * from donhang;
select * from khachhang;



drop table loaihang;
drop table mathang;
drop table donhang;
drop table khachhang;
















