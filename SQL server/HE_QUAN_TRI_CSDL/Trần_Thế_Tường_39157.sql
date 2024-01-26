-- Họ tên: Trần Thế Tường
-- lớp: IS401T
-- massv: 39157 
use QUANLYBANHANG

-- cau 1
select hoadon.mahd, count(chitiet.mahang) as SOMATHANG
from hoadon, chitiet, dmhang 
where hoadon.mahd = chitiet.mahd and
dmhang.mahang = chitiet.mahang
group by hoadon.mahd

-- cau 2
select hoadon.mahd, count(chitiet.mahang) 
as SOMATHANG
from hoadon, chitiet, dmhang 
where hoadon.mahd = chitiet.mahd and
dmhang.mahang = chitiet.mahang
group by hoadon.mahd
having count(chitiet.mahang) >= 2

-- cau 3
select month(hoadon.ngayhd) as thang,sum(dongia * slban) 
as TONGTIEN
from hoadon, chitiet, dmhang 
where hoadon.mahd = chitiet.mahd and
dmhang.mahang = chitiet.mahang
group by month(hoadon.ngayhd)

-- cau 4
select month(hoadon.ngaygh) as thang,count(hoadon.mahd) as SODONGIAO
from hoadon, chitiet, dmhang 
where hoadon.mahd = chitiet.mahd and
dmhang.mahang = chitiet.mahang and
hoadon.ngaygh IS NOT NULL
group by month(hoadon.ngaygh) 
having count(hoadon.mahd)  >= 2

-- cau 5
select hoadon.loaihd,sum(dongia * slban) as TONGTIEN
from hoadon, chitiet, dmhang 
where hoadon.mahd = chitiet.mahd and
dmhang.mahang = chitiet.mahang and
hoadon.loaihd is not null
group by hoadon.loaihd
