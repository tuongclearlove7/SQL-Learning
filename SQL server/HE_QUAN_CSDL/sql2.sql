INSERT INTO khachhang(makh, hoten, diachi, sodt)
VALUES('001', N'Trần Thế Tường', N'da nang', N'0915662495');

INSERT INTO khachhang(makh, hoten, diachi, sodt)
VALUES('kh02', N'Nguyễn Ngọc Khánh', N'Đà Nẵng', N'0915454355'),
('kh03', N'Hồ Nhật Anh', N'Đà Nẵng', N'0325454355'),
('kh04', N'Nhật Anh', N'Đà Nẵng', N'09456657755');

INSERT INTO dmhang(mahang, tenhang, dvt, slton)
VALUES('mh01', N'Laptop MSI', N'Cái', 20),
('mh02', N'Laptop DELL', N'Cái', 30),
('mh03', N'Laptop ASUS', N'Cái', 40);

INSERT INTO hoadon (mahd, ngayhd, ngaygh, makh)
VALUES('hd01', '2024-01-09T12:30:00', '2024-01-10T14:45:00', 'kh01'),
  ('hd02', '2024-01-10T08:15:00', '2024-01-11T10:30:00', 'kh02'),
  ('hd03', '2024-01-11T15:00:00', '2024-01-12T17:20:00', 'kh03'),
  ('hd04', '2024-01-12T09:45:00', '2024-01-13T11:00:00', 'kh04');




update khachhang set makh = 'kh01'
update khachhang set hoten = N'Trần Thế Tường'
update khachhang set diachi = N'Đà Nẵng'


select * from khachhang
select * from dmhang
select * from hoadon


ALTER TABLE hoadon
ALTER COLUMN mahd VARCHAR(10);