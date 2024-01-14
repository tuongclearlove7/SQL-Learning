

select * from khachhang where diachi = N'Đà Nẵng'
select * from khachhang where diachi like N'%Đà%'
SELECT * FROM khachhang WHERE sodt LIKE N'%0915%495%';


SELECT * FROM khachhang WHERE hoten LIKE N'H%';

SELECT * FROM dmhang WHERE dvt IN (N'thùng', N'kg');

SELECT * FROM hoadon WHERE CONVERT(DATE, ngayhd) = '2024-02-02';

SELECT * FROM hoadon, dmhang, chitiet WHERE hoadon.mahd = chitiet.mahd and dmhang.mahang = chitiet.mahang 

SELECT * FROM hoadon, dmhang, chitiet WHERE hoadon.mahd = chitiet.mahd and dmhang.mahang = chitiet.mahang andhoadon.ngaygh = '2024-02-02' and dmhang.mahang = 'mh01';

SELECT * FROM khachhang WHERE sodt LIKE N'%5'
SELECT * FROM khachhang WHERE hoten LIKE N'%P' or hoten like N'%H'

SELECT * FROM khachhang WHERE sodt is null

SELECT * FROM nhacungcap WHERE diachi NOT LIKE N'%Đà Nẵng%'

SELECT * FROM dmhang WHERE mahang in('mh01','mh02') and dvt = N'Thùng'

SELECT * FROM hoadon WHERE ngayhd BETWEEN '2024-01-01' AND '2024-05-01'

SELECT * FROM khachhang WHERE sodt like N'_6______6%'

SELECT * FROM hoadon WHERE ngaygh BETWEEN '2024-06-01' AND '2024-07-01'

SELECT * FROM nhacungcap WHERE tenncc NOT LIKE N'Công ty sữa'

SELECT TOP 3 * FROM khachhang
SELECT TOP 3 * FROM hoadon
SELECT TOP 3 * FROM dmhang order by slton desc
SELECT TOP 3 * FROM chitiet order by dongia asc

SELECT TOP 2 * FROM chitiet, hoadon, dmhang where 
hoadon.mahd = chitiet.mahd and
dmhang.mahang = chitiet.mahang
order by chitiet.slban asc

SELECT COUNT(*) as N'Số khách hàng' FROM khachhang 
SELECT SUM(chitiet.slban) as N'Tổng số lượng bán' FROM chitiet group by mahd
SELECT SUM(chitiet.dongia) as N'Tổng doanh thu' FROM chitiet group by mahd
SELECT chitiet.mahd,COUNT(mahang) as N'Số hóa đơn' FROM chitiet  group by mahd

SELECT hoadon.makh,COUNT(mahd) as 'Số hóa đơn của khách hàng'  FROM hoadon  group by makh

SELECT hoadon.makh,COUNT(mahd) as 'Số hóa đơn của khách hàng'  FROM hoadon  group by makh

SELECT nhacungcap.mancc,COUNT(mahang) as 'Số mặt hàng của nhà cung cấp'  FROM nhacungcap  group by mancc

SELECT nhacungcap.mahang,COUNT(mancc) as N'Số nhà cung cấp, cung cấp mặt hàng' FROM nhacungcap  group by mahang


select * from khachhang
select * from dmhang
select * from hoadon
select * from chitiet
select * from nhacungcap