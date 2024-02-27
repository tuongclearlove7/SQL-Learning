-- Họ và tên: Trần Thế Tường
-- Mssv: 27211239157
-- Lớp: IS401T

-- cau 1
ALTER FUNCTION THONGKE_SONHANVIENNAMNU (@gioitinh int, @mapb varchar(50))
RETURNS TABLE
AS
RETURN (
    SELECT mapb, COUNT(*) as sonhanvien
    FROM nhanvien
    WHERE phai = @gioitinh and mapb = @mapb group by mapb
);
SELECT * FROM dbo.THONGKE_SONHANVIENNAMNU(1, 'pb01'); 
SELECT * FROM dbo.THONGKE_SONHANVIENNAMNU(0, 'pb02'); 

-- cau 2
CREATE FUNCTION THONGKE_SONHANVIENTHEOCHUCVU (@macv varchar(50))
RETURNS TABLE
AS
RETURN (
    SELECT macv, COUNT(*) as sonhanvien
    FROM nhanvien
    WHERE macv = @macv group by macv
);
SELECT * FROM dbo.THONGKE_SONHANVIENTHEOCHUCVU('cv01'); 
SELECT * FROM dbo.THONGKE_SONHANVIENTHEOCHUCVU('cv02'); 
SELECT * FROM dbo.THONGKE_SONHANVIENTHEOCHUCVU('cv03'); 

-- cau 3
CREATE FUNCTION HIEN_DS_NHANVIEN_THEOTUNGPHONGBAN (@mapb varchar(50))
RETURNS TABLE
AS
RETURN (
    SELECT  *
    FROM nhanvien
    WHERE mapb = @mapb
);
SELECT * FROM dbo.HIEN_DS_NHANVIEN_THEOTUNGPHONGBAN('pb01'); 
SELECT * FROM dbo.HIEN_DS_NHANVIEN_THEOTUNGPHONGBAN('pb02'); 

-- cau 4
ALTER FUNCTION HIENTHI_DANHSACH_LUONGNHANVIENTHEOTHANG (@thang int)
RETURNS TABLE
AS
RETURN (
    SELECT nhanvien.manv, hoten, ngaysinh, phai, mapb, tencv, 184500 * hsl * hscv as luong
    FROM nhanvien, chucvu, hesoluong
    WHERE nhanvien.manv = hesoluong.manv and 
	nhanvien.macv = chucvu.macv and
	thang = @thang
);
SELECT * FROM dbo.HIENTHI_DANHSACH_LUONGNHANVIENTHEOTHANG(1); 
SELECT * FROM dbo.HIENTHI_DANHSACH_LUONGNHANVIENTHEOTHANG(2); 
SELECT * FROM dbo.HIENTHI_DANHSACH_LUONGNHANVIENTHEOTHANG(3); 

-- cau 5
ALTER FUNCTION TINHTONGLUONG_CHOMOIPB (@mapb varchar(50))
RETURNS TABLE
AS
RETURN (
     SELECT nhanvien.mapb, sum(184500 * hsl * hscv) as tongluong
    FROM nhanvien, chucvu, hesoluong
    WHERE nhanvien.manv = hesoluong.manv and 
	nhanvien.macv = chucvu.macv and
	nhanvien.mapb = @mapb group by nhanvien.mapb
);
SELECT * FROM dbo.TINHTONGLUONG_CHOMOIPB('pb01'); 
SELECT * FROM dbo.TINHTONGLUONG_CHOMOIPB('pb02');
SELECT * FROM dbo.TINHTONGLUONG_CHOMOIPB('pb03'); 
SELECT * FROM dbo.TINHTONGLUONG_CHOMOIPB('pb04'); 
SELECT * FROM dbo.TINHTONGLUONG_CHOMOIPB('pb05'); 

-- cau 6
CREATE FUNCTION HIENTHI_DANHSACH_NHANVIEN_CONGAYSNTRONGTHANG (@thang int)
RETURNS TABLE
AS
RETURN (
    SELECT  *
    FROM nhanvien
    WHERE month(ngaysinh) = @thang
);
SELECT * FROM dbo.HIENTHI_DANHSACH_NHANVIEN_CONGAYSNTRONGTHANG(1); 
SELECT * FROM dbo.HIENTHI_DANHSACH_NHANVIEN_CONGAYSNTRONGTHANG(11); 

select * from nhanvien
select * from chucvu
select * from hesoluong
select * from phongban
select * from tamung
select * from ct_tamung






