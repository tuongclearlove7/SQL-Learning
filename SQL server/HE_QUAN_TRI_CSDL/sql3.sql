use QUANLYBANHANG

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

select chitiet.mahd,sum(chitiet.slban) from chitiet
where chitiet.mahang in('mh01', 'mh02')
group by chitiet.mahd

select top 3 dmhang.slton from dmhang order by dmhang.slton desc

select top 1 * from dmhang order by dmhang.slton asc

select mancc, count(mahang) from nhacungcap where diachi like N'%Đà Nẵng%' group by mancc

select hoadon.loaihd , count(*) from hoadon group by hoadon.loaihd

SELECT * FROM hoadon WHERE ngayhd BETWEEN '2024-01-01' AND '2024-01-31';

SELECT * FROM hoadon WHERE MONTH(ngayhd) = 1;

SELECT * FROM hoadon WHERE ngaygh BETWEEN '2024-02-01' AND '2024-02-29';

SELECT * FROM hoadon WHERE MONTH(ngaygh) = 2;

select count(mahd) from hoadon group by ngaygh 

SELECT MONTH(ngaygh) AS N'Tháng', COUNT(*) AS N'Số lượng hóa đơn'
FROM hoadon GROUP BY MONTH(ngaygh);

SELECT hoadon.*, DATEDIFF(day, NGAYHD, NGAYGH) AS N'Số ngày chênh lệch'
FROM HOADON WHERE DATEDIFF(day, NGAYHD, NGAYGH) >= 3;

SELECT COUNT(*) AS so_luong_hoa_don
FROM hoadon WHERE DATEDIFF(day, ngayhd, ngaygh) >= 3;

select count(*) from hoadon group by ngayhd

SELECT MONTH(ngayhd) AS thang,
COUNT(DISTINCT mahd) AS N'Số lượng khách hàng mỗi tháng'
FROM hoadon
GROUP BY MONTH(ngayhd);

WITH DanhSachKhachThang AS (
    SELECT MONTH(NGAYHD) AS Thang, COUNT(MAKH) AS LuongKhach
    FROM HOADON GROUP BY MONTH(NGAYHD)
)
SELECT Thang, LuongKhach
FROM DanhSachKhachThang
WHERE LuongKhach = (SELECT MAX(LuongKhach) FROM DanhSachKhachThang) OR 
LuongKhach = (SELECT MIN(LuongKhach) FROM DanhSachKhachThang);


select * from hoadon, chitiet where hoadon.mahd = chitiet.mahd and (chitiet.dongia * chitiet.slban) >= 3000000

SELECT SUM(chitiet.dongia * chitiet.slban) AS tong_tien
FROM hoadon, chitiet where hoadon.mahd = chitiet.mahd
GROUP BY hoadon.mahd;

select hoadon.mahd,SUM(slban * dongia) 
from hoadon, chitiet 
where hoadon.mahd = chitiet.mahd
group by hoadon.mahd 
having sum(slban * dongia)  >= 3000000

select top 3 hoadon.mahd,SUM(slban * dongia) 
from hoadon, chitiet 
where hoadon.mahd = chitiet.mahd
group by hoadon.mahd 
having sum(slban * dongia)  >= 3000000 
order by sum(slban * dongia) desc


select hoadon.mahd, count(chitiet.mahang) 
from hoadon, chitiet, dmhang 
where hoadon.mahd = chitiet.mahd and
dmhang.mahang = chitiet.mahang
group by hoadon.mahd
having count(chitiet.mahang) >= 2

select * from khachhang, hoadon, dmhang, chitiet, nhacungcap 
where khachhang.makh = hoadon.makh and
hoadon.mahd = chitiet.mahd and
dmhang.mahang = nhacungcap.mahang and
dmhang.mahang = chitiet.mahang 

select * from khachhang
select * from dmhang
select * from hoadon
select * from chitiet
select * from nhacungcap


select count(*) from khachhang
select count(*) from hoadon
select count(*) from dmhang
select count(*) from chitiet
select count(*) from nhacungcap

