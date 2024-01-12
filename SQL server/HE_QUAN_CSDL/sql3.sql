update khachhang set makh = 'kh01'
update khachhang set hoten = N'Trần Thế Tường'
update khachhang set diachi = N'Đà Nẵng'

update dmhang set dvt = N'Chiếc' where mahang = 'mh01'
update hoadon set ngayhd = '2024-02-02'



select * from khachhang where diachi = N'Đà Nẵng'
select * from khachhang where diachi like N'%Đà%'
SELECT * FROM khachhang WHERE sodt LIKE N'%0915%495%';


SELECT * FROM khachhang WHERE hoten LIKE N'H%';

SELECT * FROM dmhang WHERE dvt IN (N'thùng', N'kg');

SELECT * FROM hoadon WHERE CONVERT(DATE, ngayhd) = '2024-02-02';

SELECT * FROM hoadon, dmhang, chitiet WHERE hoadon.mahd = chitiet.mahd and dmhang.mahang = chitiet.mahang 

SELECT * FROM hoadon, dmhang, chitiet WHERE hoadon.mahd = chitiet.mahd and dmhang.mahang = chitiet.mahang andhoadon.ngaygh = '2024-02-02' and dmhang.mahang = 'mh01';

SELECT * FROM khachhang WHERE sodt LIKE N'%5';

SELECT * FROM khachhang WHERE hoten LIKE N'%P' or hoten like N'%H';


ALTER TABLE hoadon
ALTER COLUMN mahd VARCHAR(10);

select * from khachhang
select * from dmhang
select * from hoadon
select * from chitiet
select * from nhacungcap