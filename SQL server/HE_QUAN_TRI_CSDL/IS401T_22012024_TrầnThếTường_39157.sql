--Họ tên: Trần Thế Tường
-- Massv: 39157

-- cau 1
create procedure ThongkeHoadonTheoTungLoai
	@loaihd nvarchar(50)
as 
begin
	select loaihd,count(*) as SLHOADON 
	from hoadon 
	where loaihd = @loaihd
	group by loaihd
end

exec ThongkeHoadonTheoTungLoai
@loaihd = N'Bán'

--cau 2
create procedure ThongkeSoluongMathangTrenMoiHoadon
	@mahd nvarchar(50)
as 
begin
	select mahd,count(mahang) as SLMATHANG 
	from chitiet 
	where mahd = @mahd
	group by mahd
end

exec ThongkeSoluongMathangTrenMoiHoadon
@mahd = N'hd04'

-- cau 3
create procedure SoDonHangDatTrongThang
	@thang int
as 
begin
	select MONTH(hoadon.ngaygh) as thang,count(mahd) as SLDHDAT 
	from hoadon 
	where MONTH(ngaygh) = @thang group by MONTH(hoadon.ngaygh)
end
exec SoDonHangDatTrongThang
@thang = 7

-- cau 4
create procedure SoDonHangDaGiaoTrongThang
	@thang int
as 
begin
	select MONTH(ngaygh) as thang,count(ngaygh) as SLDHGIAO 
	from hoadon 
	where MONTH(ngaygh) = @thang group by MONTH(ngaygh)
end
exec SoDonHangDaGiaoTrongThang @thang = 7

-- cau 5
CREATE PROCEDURE ThongTinMatHangTheoNhaCungCap
	@MANCC VARCHAR(20)
AS
BEGIN
    SELECT NHACUNGCAP.MANCC,NHACUNGCAP.TENNCC, NHACUNGCAP.DIACHI,DMHANG.TENHANG
    FROM NHACUNGCAP, DMHANG 
	WHERE NHACUNGCAP.MANCC = @MANCC AND DMHANG.MAHANG=NHACUNGCAP.MAHANG;
END;

exec ThongTinMatHangTheoNhaCungCap
@mancc = 'ncc01'

--cau 6
CREATE PROCEDURE SoluongHoadonCuaKhachHang
	@makh VARCHAR(20)
AS
BEGIN
    SELECT makh, COUNT(mahd) as SLHOADON
    FROM hoadon 
	WHERE makh = @makh 
	group by makh
END

exec SoluongHoadonCuaKhachHang
@makh = 'kh01'


select * from hoadon
select * from dmhang
select * from chitiet
select * from khachhang
select * from nhacungcap


select mahd,COUNT(mahang) from chitiet where mahd = 'hd02' group by mahd


DROP PROCEDURE IF EXISTS SoluongHoadonCuaKhachHang;



