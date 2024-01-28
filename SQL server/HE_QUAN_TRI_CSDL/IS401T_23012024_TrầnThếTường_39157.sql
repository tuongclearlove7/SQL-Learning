
--cau 1
select nhanvien.manv, ngaysinh, tencv, 
hsl, thang, hsl*1890000 * hscv as luong 
from nhanvien, hesoluong, chucvu
where nhanvien.manv = chucvu.manv and
nhanvien.manv = hesoluong.manv 
group by nhanvien.manv, nhanvien.ngaysinh, 
chucvu.tencv, hesoluong.hsl, hesoluong.thang, chucvu.hscv

--cau 2
select phongban.mapb, tenpb, COUNT(*) as SONHANVIEN
from phongban, nhanvien
where  phongban.mapb = nhanvien.mapb
group by phongban.mapb, phongban.tenpb

-- cau 3
select macv, tencv, COUNT(*) as SONHANVIEN 
from nhanvien, chucvu
where nhanvien.manv = chucvu.manv
group by macv, tencv

-- cau 4
select phongban.mapb, tenpb, sum(hsl * 1890000 * hscv) as TONGLUONG
from nhanvien, phongban, hesoluong, chucvu
where phongban.mapb = nhanvien.mapb and
nhanvien.manv = hesoluong.manv
group by phongban.mapb, tenpb

-- cau 5
select top 2 phongban.mapb, tenpb, 
sum(hsl * 1890000 * hscv) as TONGLUONG
from nhanvien, phongban, hesoluong, chucvu
where phongban.mapb = nhanvien.mapb and
nhanvien.manv = hesoluong.manv
group by phongban.mapb, tenpb 
order by sum(hsl * 1890000 * hscv) desc

-- cau 6
select hesoluong.thang ,sum(hsl * 1890000 * hscv) as TONGLUONG
from nhanvien, hesoluong, chucvu
where nhanvien.manv = hesoluong.manv
group by hesoluong.thang

-- cau 7
select top 3 nhanvien.manv, ngaysinh, tencv, 
hsl, thang, hsl*1890000 * hscv as luong 
from nhanvien, hesoluong, chucvu
where nhanvien.manv = chucvu.manv and
nhanvien.manv = hesoluong.manv 
group by nhanvien.manv, nhanvien.ngaysinh, 
chucvu.tencv, hesoluong.hsl, hesoluong.thang, chucvu.hscv
order by luong desc

-- cau 8
UPDATE hesoluong
SET hsl = hsl + 0.5
FROM hesoluong, chucvu
WHERE hesoluong.manv = chucvu.manv and 
chucvu.tencv IN ('GD', 'PGD');

-- cau 9
UPDATE chucvu
SET hscv = hscv + 0.5
FROM nhanvien, chucvu
WHERE nhanvien.manv = chucvu.manv and 
nhanvien.phai IN (0);

-- cau 10
create PROCEDURE HIENTHIDANHSACH
AS
BEGIN
    SELECT phongban.mapb, tenpb, hoten, ngaysinh, phai, hsl, hscv, thang, hsl * 1890000 * hscv AS luong
	from phongban, nhanvien , hesoluong, chucvu
	where phongban.mapb = nhanvien.mapb and
	nhanvien.manv = chucvu.manv and
	nhanvien.manv = hesoluong.manv
	group by phongban.mapb, tenpb, hoten, ngaysinh, phai, hsl, hscv, thang
END

exec HIENTHIDANHSACH










