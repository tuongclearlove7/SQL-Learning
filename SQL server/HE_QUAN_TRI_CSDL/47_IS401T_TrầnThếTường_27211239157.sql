--															ĐỒ ÁN CÁ NHÂN
-- Môn học: Hệ Quản Trị Cơ Sở Dữ Liệu
-- Họ và tên: Trần Thế Tường
-- Lớp: IS401T
-- mssv: 27211239157

--CREATE DATABASE
create database QUANLYLUONG
use QUANLYLUONG

--CREATE TABLE

CREATE TABLE nhanvien (
    manv VARCHAR(20) PRIMARY KEY,
    hoten NVARCHAR(255),
    ngaysinh DATETIME,
    phai int,
    quequan VARCHAR(255),
    sodt VARCHAR(20),
    mapb VARCHAR(20),
	macv VARCHAR(20),
);

CREATE TABLE phongban (
    mapb VARCHAR(20) PRIMARY KEY,
	tenpb NVARCHAR(255),

);


CREATE TABLE chucvu (
    macv VARCHAR(20) PRIMARY KEY,
	tencv NVARCHAR(255),
	hscv decimal,

);

CREATE TABLE hesoluong (
    thang int,
	hsl decimal,
	manv VARCHAR(20),

);

CREATE TABLE tamung (
    matu INT PRIMARY KEY,
    manv VARCHAR(20),
    TONGTIEN DECIMAL(10, 2),
);

CREATE TABLE ct_tamung (
    stt INT PRIMARY KEY,
    ngaythang DATE,
    manv VARCHAR(20),
    matu INT,
    sotien DECIMAL(10, 2),
   
);

ALTER TABLE nhanvien
ADD CONSTRAINT nhanvien_Fk_phongban
    FOREIGN KEY (mapb) REFERENCES phongban(mapb);

ALTER TABLE nhanvien
ADD CONSTRAINT nhanvien_Fk_chucvu
    FOREIGN KEY (macv) REFERENCES chucvu(macv);

ALTER TABLE hesoluong
ADD CONSTRAINT hesoluong_Fk_nhanvien
    FOREIGN KEY (manv) REFERENCES nhanvien(manv);

ALTER TABLE tamung
ADD CONSTRAINT tamung_Fk_nhanvien
    FOREIGN KEY (manv) REFERENCES nhanvien(manv);

ALTER TABLE ct_tamung
ADD CONSTRAINT ct_tamung_Fk_nhanvien
    FOREIGN KEY (manv) REFERENCES nhanvien(manv);

ALTER TABLE ct_tamung
ADD CONSTRAINT ct_tamung_Fk_tamung
    FOREIGN KEY (matu) REFERENCES tamung(matu);

-- Insert dữ liệu vào các bảng đã tạo

INSERT INTO phongban(mapb, tenpb)
VALUES('pb01', N'Phòng kế toán'),
('pb02', N'Phòng marketing'),
('pb03', N'Phòng công nghệ thông tin'),
('pb04', N'Phòng nhân sự'),
('pb05', N'Phòng dịch vụ');

INSERT INTO phongban(mapb, tenpb)
VALUES('pb01', N'Phòng kế toán'),
('pb02', N'Phòng marketing'),
('pb03', N'Phòng công nghệ thông tin'),
('pb04', N'Phòng nhân sự'),
('pb05', N'Phòng dịch vụ');

INSERT INTO nhanvien (manv, hoten, ngaysinh, phai, quequan, sodt, mapb) VALUES
('nv01', N'Trần Thế Tường', '1990-01-01', 1, 'Da Nang', '123456789', 'pb01'),
('nv02', N'Nguyễn Ngọc Khánh', '1992-05-15', 0, 'Da Nang', '987654321', 'pb02'),
('nv03', N'Nguyễn Thị Cúc', '1988-11-20', 1, 'Dak Lak', '555555555', 'pb01'),
('nv04', N'Trần Thị Mai', '1995-03-10', 1, 'Da Nang', '777777777', 'pb03'),
('nv05', N'Trần Vinh Quang', '1998-07-02', 0, 'Dak Lak', '888888888', 'pb05'),
('nv06', N'Hồ Phương Thảo', '1993-09-25', 1, 'Da Nang', '444444444', 'pb04'),
('nv07', N'Hồ Nhật Anh', '1996-12-30', 0, 'Da Nang', '666666666', 'pb04'),
('nv08', N'Trần Lê Đức Nhật Anh', '1991-04-05', 1, 'Da Nang', '999999999', 'pb02'),
('nv09', N'Nguyễn Văn Phát', '1987-08-15', 1, 'TP HCM', '111111111', 'pb05'),
('nv10', N'Nguyễn Thu Phương', '1994-06-18', 0, 'Binh Dinh', '222222222', 'pb04');

INSERT INTO chucvu(macv, tencv, hscv, manv) VALUES
('cv01', N'Chức vụ Trưởng phòng', 1.5, 'nv01'),
('cv02', N'Chức vụ Trưởng phòng', 2.0, 'nv02'),
('cv03', N'Chức vụ nhân viên IT', 1.8, 'nv03'),
('cv04', N'Chức vụ nhân viên IT', 1.7, 'nv04'),
('cv05', N'Chức vụ nhân viên Kế toán', 2.2, 'nv05');

INSERT INTO hesoluong (thang, hsl, manv) VALUES
(1, 1.2, 'nv01'),
(1, 1.0, 'nv02'),
(1, 1.5, 'nv03'),
(2, 1.8, 'nv04'),
(2, 1.3, 'nv05'),
(2, 1.7, 'nv06'),
(3, 2.0, 'nv07'),
(3, 1.5, 'nv08'),
(3, 1.9, 'nv09'),
(4, 1.6, 'nv10'),
(4, 1.4, 'nv01'),
(4, 1.1, 'nv02'),
(5, 1.3, 'nv03'),
(5, 1.7, 'nv04'),
(5, 1.5, 'nv05');

INSERT INTO TAMUNG (MATU, MANV, TONGTIEN) VALUES
(1, 'nv01', 500000.00),
(2, 'nv02', 700000.00),
(3, 'nv03', 600000.00),
(4, 'nv04', 800000.00),
(5, 'nv04', 900000.00),
(6, 'nv05', 750000.00),
(7, 'nv05', 600000.00),
(8, 'nv02', 850000.00),
(9, 'nv03', 700000.00),
(10, 'nv01', 750000.00);

-- SELECT 
--cau 1: Tính lương cho nhân viên
select nhanvien.manv, ngaysinh, tencv, 
hsl, thang, hsl*1890000 * hscv as luong 
from nhanvien, hesoluong, chucvu
where nhanvien.macv = chucvu.macv and
nhanvien.manv = hesoluong.manv 
group by nhanvien.manv, nhanvien.ngaysinh, 
chucvu.tencv, hesoluong.hsl, hesoluong.thang, chucvu.hscv

--cau 2: đếm số nhân viên của mỗi phòng ban
select phongban.mapb, tenpb, COUNT(*) as SONHANVIEN
from phongban, nhanvien
where  phongban.mapb = nhanvien.mapb
group by phongban.mapb, phongban.tenpb

-- cau 3: đếm số nhân viên của mỗi chức vụ
select chucvu.macv, tencv, COUNT(*) as SONHANVIEN 
from nhanvien, chucvu
where nhanvien.macv = chucvu.macv
group by chucvu.macv, tencv

-- cau 4: Tính tổng lương của mỗi phòng ban
select phongban.mapb, tenpb, sum(hsl * 1890000 * hscv) as TONGLUONG
from nhanvien, phongban, hesoluong, chucvu
where phongban.mapb = nhanvien.mapb and
nhanvien.manv = hesoluong.manv
group by phongban.mapb, tenpb

-- cau 5 hiển thị 2 phòng ban có tổng lương nhiều nhất
select top 2 phongban.mapb, tenpb, 
sum(hsl * 1890000 * hscv) as TONGLUONG
from nhanvien, phongban, hesoluong, chucvu
where phongban.mapb = nhanvien.mapb and
nhanvien.manv = hesoluong.manv
group by phongban.mapb, tenpb 
order by sum(hsl * 1890000 * hscv) desc

-- cau 6: Hiển thị tổng lương theo tháng
select hesoluong.thang ,sum(hsl * 1890000 * hscv) as TONGLUONG
from nhanvien, hesoluong, chucvu
where nhanvien.manv = hesoluong.manv
group by hesoluong.thang

-- cau 7: Hiển thị 3 nhân viên có tổng lương nhiều nhất
select top 3 nhanvien.manv, ngaysinh, tencv, 
hsl, thang, hsl*1890000 * hscv as luong 
from nhanvien, hesoluong, chucvu
where nhanvien.macv = chucvu.macv and
nhanvien.manv = hesoluong.manv 
group by nhanvien.manv, nhanvien.ngaysinh, 
chucvu.tencv, hesoluong.hsl, hesoluong.thang, chucvu.hscv
order by luong desc

-- cau 8: Cập nhật HSL tăng 0.5 theo mã chức vụ
UPDATE hesoluong
SET hsl = hsl + 0.5
FROM hesoluong, chucvu, nhanvien
WHERE hesoluong.manv = nhanvien.manv and 
chucvu.macv = nhanvien.macv and
chucvu.tencv IN ('GD', 'PGD');

-- cau 9: cập nhật hscv tăng 0.5 của những nhân viên có giới tính nữ
UPDATE chucvu
SET hscv = hscv + 0.5
FROM nhanvien, chucvu
WHERE nhanvien.macv = chucvu.macv and 
nhanvien.phai IN (0);

-- cau 10: tạo thủ tục hiển thị danh sách 
-- phongban.mapb, tenpb, hoten, ngaysinh, phai, hsl, hscv, thang, hsl * 1890000 * hscv AS luong
create PROCEDURE HIENTHIDANHSACH
AS
BEGIN
    SELECT phongban.mapb, tenpb, hoten, ngaysinh, phai, hsl, hscv, thang, hsl * 1890000 * hscv AS luong
	from phongban, nhanvien , hesoluong, chucvu
	where phongban.mapb = nhanvien.mapb and
	nhanvien.macv = chucvu.macv and
	nhanvien.manv = hesoluong.manv
	group by phongban.mapb, tenpb, hoten, ngaysinh, phai, hsl, hscv, thang
END

exec HIENTHIDANHSACH

-- PROCEDURE
-- cau 1: Tạo thủ tục thêm mới nhân viên
create PROCEDURE THEMMOINHANVIEN
AS
BEGIN
    INSERT INTO nhanvien(manv, hoten, ngaysinh, phai, quequan, sodt, mapb, macv)
	VALUES('nv11', N'Nhân viên 11', '2002-01-06', 1, N'Nam Định', N'0915662495', 'pb05', 'cv05');
END

exec THEMMOINHANVIEN;

-- cau 2: Tạo thủ tục thêm mới hệ số lương của nhân viên
create PROCEDURE THEMMOINHANVIENVAOHESOLUONG
AS
BEGIN
    INSERT INTO hesoluong(thang, hsl, manv)
	VALUES(1, 1.5, 'nv11');
END

exec THEMMOINHANVIENVAOHESOLUONG;

-- cau 3: tạo thủ tục Hiển thị danh sách nhân viên theo mapb và macv
create PROCEDURE HIENTHIDANHSACHNHANVIENTHEOMACVVAMAPB
@mapb varchar(20), @macv varchar(20)
AS
BEGIN
    SELECT * FROM nhanvien where mapb = @mapb and macv = @macv
END

exec HIENTHIDANHSACHNHANVIENTHEOMACVVAMAPB @mapb='pb01', @macv='cv01'

-- cau 4: Tạo thủ tục đếm số nhân viên có hệ số lương >= 3.0
ALTER PROCEDURE THONGKESONHANVIENCOHSL
@HSL FLOAT
AS BEGIN
DECLARE @SOLUONGNHANVIEN INT;
	SELECT  @SOLUONGNHANVIEN = COUNT(distinct manv)  
	FROM  HESOLUONG 
	WHERE HESOLUONG.HSL>=@HSL
PRINT 'SO LUONG NHAN VIEN >=  '+CAST(@HSL AS VARCHAR(10)) +' LA : ' + CAST(@SOLUONGNHANVIEN AS VARCHAR(10));
END;

exec THONGKESONHANVIENCOHSL 3.0

-- CAU 5 TAO PROCEDURE CO THAM SO DAU RA LA SO NHAN VIEN CUA MOI PHONG BAN
CREATE PROCEDURE THAMSODAURADEMSONHANVIENMOIPHONGBAN
    @SONVCUAMOIPHONGBAN INT OUTPUT,
	@MAPB VARCHAR(10)

AS
BEGIN
    SELECT  @SONVCUAMOIPHONGBAN = COUNT(NHANVIEN.MANV)
    FROM nhanvien
	WHERE nhanvien.MAPB=@MAPB
    GROUP BY nhanvien.MAPB;
END;

DECLARE @DepartmentCount INT;
EXEC THAMSODAURADEMSONHANVIENMOIPHONGBAN @DepartmentCount OUTPUT, 'pb01';
SELECT @DepartmentCount AS THAMSODAURADEMSONHANVIENMOIPHONGBAN;

-- cau 6: Tạo thủ tục tính số lương theo tháng
ALTER PROCEDURE THAMSODAURATONGLUONGCUAMOITHANG
    @TONGLUONG FLOAT OUTPUT,
	@thang int
AS
BEGIN
    SELECT  @TONGLUONG = SUM(hsl * 1890000 * hscv)
    FROM nhanvien,hesoluong, chucvu
	WHERE nhanvien.manv = hesoluong.manv and
	chucvu.macv = nhanvien.macv and
	thang = @thang
END;

DECLARE @MONTH INT;
EXEC THAMSODAURATONGLUONGCUAMOITHANG @MONTH OUTPUT, 1
SELECT @MONTH AS SOLUONGTHEOTHANG;

-- CAU 7 TAO PROCEDURE CO THAM SO DAU RA THONG KE SO NHAN VIEN CO HSCV >=X
CREATE PROCEDURE SONHANVIENTHEOHSCV
@HSCV FLOAT,
@SOLUONGNHANVIENVIEN INT OUTPUT
AS BEGIN 
SELECT @SOLUONGNHANVIENVIEN =COUNT(NHANVIEN.MANV)
FROM NHANVIEN, CHUCVU WHERE NHANVIEN.MACV=CHUCVU.MACV AND CHUCVU.HSCV>=@HSCV
END;

DECLARE @TONGNHANVIEN INT;
EXEC SONHANVIENTHEOHSCV 1.5, @TONGNHANVIEN OUTPUT;
SELECT @TONGNHANVIEN AS TONGSONHANVIENTHEOHESOCHUCVU;

-- Trigger

-- cau 1 Tạo bảng tạm ứng
CREATE TABLE tamung (
    matu INT PRIMARY KEY,
    manv VARCHAR(20),
    TONGTIEN DECIMAL(10, 2),
);
-- NHAP DL 10 DONG
INSERT INTO TAMUNG (MATU, MANV, TONGTIEN) VALUES
(1, 'nv01', 500000.00),
(2, 'nv02', 700000.00),
(3, 'nv03', 600000.00),
(4, 'nv04', 800000.00),
(5, 'nv05', 900000.00),
(6, 'nv06', 750000.00),
(7, 'nv07', 600000.00),
(8, 'nv08', 850000.00),
(9, 'nv09', 700000.00),
(10, 'nv10', 750000.00);

-- cau 2 Tạo bảng chi tiết tạm ứng
CREATE TABLE ct_tamung (
    stt INT PRIMARY KEY,
    ngaythang DATE,
    manv VARCHAR(20),
    matu INT,
    sotien DECIMAL(10, 2),
   
);
--cau 3: Tạo trigger tạm ứng số tiền
CREATE TRIGGER TAMUNG_SOTIEN1
ON ct_tamung
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;
    UPDATE tamung
    SET tongtien = tongtien - tam.sotien
    FROM tamung, inserted tam
    WHERE tamung.manv = tam.manv
END;

--cau 4: Thực thi trigger  tạm ứng số tiền
INSERT INTO ct_tamung(stt, ngaythang, manv, matu, sotien)
VALUES (1, '2024-02-25', 'nv01', 1, 100000.00);

-- cau 5: Tạo trigger hủy tạm ứng
CREATE TRIGGER NHANVIEN_HUYKHONGTAMUNGNUA1
ON ct_tamung
AFTER DELETE
AS
BEGIN
    SET NOCOUNT ON;
    UPDATE tamung
    SET tongtien = tongtien + huytu.sotien
    FROM tamung, deleted huytu
    WHERE tamung.manv = huytu.manv AND huytu.manv= 'nv01';
END;

delete from ct_tamung where manv = 'nv01';

-- cau 6: Thực thi trigger hủy tạm ứng
alter TRIGGER UNGTHEM_SOVOIBANDAU1
ON ct_tamung
AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;
    IF UPDATE(sotien) 
    BEGIN
		DECLARE @tien decimal(10,2)
        UPDATE ct_tamung
        SET sotien = sotien + 100000.00
        WHERE manv = 'nv01'
        UPDATE tamung
        SET tongtien= tongtien - 100000.00
        WHERE manv IN ('nv01');
    END
END;

update ct_tamung  set sotien = sotien where manv = 'nv01';

-- CAU 7 TAO TRIGGER KIEM SOAT DIEM KIEM KHI CO NHAN VIEN NAO DO TAM UNG TRONG 
-- TRUONG HOP NEU NHAN VIEN TAM UNG VOI SO TIEN > TIEN 
-- TRONG TAM UNG THI IN RA TAM UNG VUOT SO CHO PHEP.
CREATE TRIGGER KIEMSOATUNGTIEN1
ON ct_tamung
AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;
    IF UPDATE(sotien) 
    BEGIN
        DECLARE @tien DECIMAL(10,2);
        DECLARE @maxTongTien DECIMAL(10,2);
        SELECT TOP 1 @tien = tam.sotien
        FROM inserted tam
        WHERE tam.manv = 'nv01'
        ORDER BY tam.sotien;
        SELECT TOP 1 @maxTongTien = tongtien
        FROM tamung
        WHERE manv = 'nv01'
        ORDER BY tongtien DESC;
        BEGIN TRY
            IF @tien IS NOT NULL AND @tien > @maxTongTien
            BEGIN
                PRINT N'Không đủ tiền!';
            END
            ELSE
            BEGIN
                UPDATE ct_tamung
                SET sotien = sotien + @tien
                WHERE manv = 'nv01';

                UPDATE tamung
                SET tongtien = tongtien - @tien
                WHERE manv = 'nv01';
            END
        END TRY
        BEGIN CATCH
            PRINT N'Xử lý lỗi ở đây nếu có';
        END CATCH
    END
END

UPDATE ct_tamung SET sotien = sotien + 20000000.00 WHERE manv = 'nv01';

-- FUNCTION
-- CAU 1 TAO FUNCTION THONG KE VA IN RA SO NHAN VIEN NAM, NU CUA MOI PHONG BAN
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

-- CAU 2 TAO FUNCTION THONG KE VA IN RA SO NHAN VIEN THEO TUNG CHUC VU
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

-- CAU 3 TAO FUNCTION HIEN THI DS CAC NHAN VIEN THEO TUNG PHONG BAN
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


-- CAU 4 TAO FUNCTION HIEN THI DS CAC NHAN VIEN DUOC TRA LUONG THEO TUNG THANG, DS NHAN VIEN GOM THONG TIN : MANV, HOTEN, NGAYSINH, PHAI, MAPB, TENCV, LUONG
-- TRONG DO LUONG = 1845000 * HSL * HSCV
CREATE FUNCTION HIENTHI_DANHSACH_LUONGNHANVIENTHEOTHANG (@thang int)
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


-- CAU 5 TAO FUNCTION TINH TONG LUONG CHO MOI PHONG BAN 
CREATE FUNCTION TINHTONGLUONG_CHOMOIPB (@mapb varchar(50))
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

-- CAU 6 TAO FUNCTION HIEN THI DANH SACH CAC NHAN VIEN CO NGAY SINH NHAT TRONG THANG
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

-- TRANSACTION
-- Tạo TRANSACTION đặt vé xem phim
-- tạo database, table
CREATE DATABASE QUANLYDATXEMPHIM;

use QUANLYDATXEMPHIM

CREATE TABLE Phim (
    MaPhim INT PRIMARY KEY,
    TenPhim NVARCHAR(100),
    TheLoai NVARCHAR(50),
    ThoiLuong INT
);


CREATE TABLE RapChieu (
    MaRap INT PRIMARY KEY,
    TenRap NVARCHAR(100),
    DiaChi NVARCHAR(200)
);


CREATE TABLE SuatChieu (
    MaSuatChieu INT PRIMARY KEY,
    MaPhim INT,
    MaRap INT,
    ThoiGian DATETIME,
	SoLuongVeConLai INT,
    FOREIGN KEY (MaPhim) REFERENCES Phim(MaPhim),
    FOREIGN KEY (MaRap) REFERENCES RapChieu(MaRap)
);


CREATE TABLE NguoiDung (
    MaNguoiDung INT PRIMARY KEY,
    HoTen NVARCHAR(100),
    Email NVARCHAR(100),
    MatKhau NVARCHAR(50)
);


CREATE TABLE Ve (
    MaVe INT PRIMARY KEY,
    MaSuatChieu INT,
    MaNguoiDung INT,
    SoLuong INT,
    GiaTien DECIMAL(10, 2),
    FOREIGN KEY (MaSuatChieu) REFERENCES SuatChieu(MaSuatChieu),
    FOREIGN KEY (MaNguoiDung) REFERENCES NguoiDung(MaNguoiDung)
);


BEGIN TRANSACTION;
DECLARE @MaSuatChieu INT, @MaNguoiDung INT, @SoLuongVe INT, @Mave INT;
SET @MaSuatChieu = 1; 
SET @MaNguoiDung = 1; 
SET @SoLuongVe = 2; 
SET @Mave = 2;

INSERT INTO Ve (MaVe,MaSuatChieu, MaNguoiDung, SoLuong, GiaTien)
VALUES (@Mave,@MaSuatChieu, @MaNguoiDung, @SoLuongVe, @SoLuongVe * 10000);

UPDATE SuatChieu
SET SoLuongVeConLai = SoLuongVeConLai - @SoLuongVe
WHERE MaSuatChieu = @MaSuatChieu;

IF @@ERROR <> 0
BEGIN
    ROLLBACK;
    PRINT N'Đặt vé thất bại. Hủy bỏ transaction.';
END
ELSE
BEGIN
    COMMIT;
    PRINT N'Đặt vé thành công. Commit transaction.';
END

select * from Ve
select * from SuatChieu
select * from NguoiDung
select * from RapChieu
select * from Phim