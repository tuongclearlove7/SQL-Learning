CREATE DATABASE QUANLYCHOTHUESACH

DROP DATABASE QUANLYCHOTHUESACH

CREATE TABLE TACGIA (
    matg VARCHAR(20) PRIMARY KEY,
    tentg NVARCHAR(50)
);

CREATE TABLE SACH (
    masach VARCHAR(20) PRIMARY KEY,
    tensach NVARCHAR(50),
    namxb INT,
    slsach INT,
    matg VARCHAR(20)
);

CREATE TABLE DOCGIA (
    madg VARCHAR(20) PRIMARY KEY,
    tendg NVARCHAR(50),
    sodt VARCHAR(10)
);

CREATE TABLE PHIEUMUONTRA (
    sophieu VARCHAR(20) PRIMARY KEY,
    ngaymuon DATETIME,
    ngaytra DATETIME,
    tinhtrang NVARCHAR(50),
    madg VARCHAR(20)
);

CREATE TABLE CHITIET (
    madg VARCHAR(20),
    masach VARCHAR(20),
    slmuon INT,
    dongia DECIMAL(10,2)
);

ALTER TABLE SACH
ADD CONSTRAINT SACH_TACGIA
FOREIGN KEY (MATG) REFERENCES TACGIA(MATG)

ALTER TABLE PHIEUMUONTRA
ADD CONSTRAINT PHIEUMUONTRA_DOCGIA
FOREIGN KEY (MADG) REFERENCES DOCGIA(MADG)

ALTER TABLE CHITIET
ADD CONSTRAINT CHITIET_DOCGIA
FOREIGN KEY (MADG) REFERENCES DOCGIA(MADG)

ALTER TABLE CHITIET
ADD CONSTRAINT CHITIET_SACH
FOREIGN KEY (MASACH) REFERENCES SACH(MASACH)

INSERT INTO TACGIA (MATG, TENTG) VALUES
('TG01', N'Nguyễn Văn An'),
('TG02', N'Trần Thị Bình'),
('TG03', N'Lê Văn Cơ'),
('TG04', N'Phạm Thị Duyên'),
('TG05', N'Hoàng Văn Em');

INSERT INTO SACH (MASACH, TENSACH, NAMXB, SLSACH, MATG) VALUES
('S01', N'Sách Văn Hóa', 2020, 100, 'TG01'),
('S02', N'Sách Giáo Dục', 2019, 150, 'TG02'),
('S03', N'Sách Chính Trị', 2021, 120, 'TG03'),
('S04', N'Sách Âm Nhạc', 2018, 200, 'TG04'),
('S05', N'Sách Tiểu Thuyết', 2022, 90, 'TG05'),
('S06', N'Sách Giải Trí', 2017, 180, 'TG01'),
('S07', N'Sách Công Nghiệp', 2023, 110, 'TG02'),
('S08', N'Sách Nông Nghiệp', 2016, 220, 'TG03'),
('S09', N'Sách Quốc Phòng', 2024, 80, 'TG04'),
('S10', N'Sách Công Nghệ', 2015, 250, 'TG05');

INSERT INTO DOCGIA (MADG, TENDG, SODT) VALUES
('DG01', N'Nguyễn Thị Xuyên', '0903456789'),
('DG02', N'Trần Văn Yên', '0937654321'),
('DG03', N'Lê Thị Tuyên', '0365478921'),
('DG04', N'Phạm Văn Khánh', '0546782931'),
('DG05', N'Hoàng Thị Linh', '0325469871'),
('DG06', N'Nguyễn Văn Mãi', '0978654321'),
('DG07', N'Trần Thị Nga', '0933456789'),
('DG08', N'Lê Văn Ong', '0987654321'),
('DG09', N'Phạm Hoàng Phước', '0365478921'),
('DG10', N'Hoàng Văn Quyết', '0546782931');

INSERT INTO PHIEUMUONTRA (SOPHIEU, NGAYMUON, NGAYTRA, TINHTRANG, MADG) VALUES
('PM01', '2024-03-01', '2024-03-15', N'Đã trả', 'DG01'),
('PM02', '2024-03-02', '2024-03-16', N'Đang Mượn', 'DG02'),
('PM03', '2024-03-03', '2024-03-17', N'Đã trả', 'DG03'),
('PM04', '2024-03-04', '2024-03-18', N'Đang Mượn', 'DG04'),
('PM05', '2024-03-05', '2024-03-19', N'Đã trả', 'DG05'),
('PM06', '2024-03-06', '2024-03-20', N'Đang Mượn', 'DG06'),
('PM07', '2024-03-07', '2024-03-21', N'Đã trả', 'DG07'),
('PM08', '2024-03-08', '2024-03-22', N'Đang Mượn', 'DG08'),
('PM09', '2024-03-09', '2024-03-23', N'Đã trả', 'DG09'),
('PM10', '2024-03-10', '2024-03-24', N'Đang Mượn', 'DG10'),
('PM11', '2024-03-11', '2024-03-25', N'Đã trả', 'DG01'),
('PM12', '2024-03-12', '2024-03-26', N'Đang Mượn', 'DG02'),
('PM13', '2024-03-13', '2024-03-27', N'Đã trả', 'DG03'),
('PM14', '2024-03-14', '2024-03-28', N'Đang Mượn', 'DG04'),
('PM15', '2024-03-15', '2024-03-29', N'Đã trả', 'DG05'),
('PM16', '2024-03-16', '2024-03-30', N'Đang Mượn', 'DG06'),
('PM17', '2024-03-17', '2024-03-31', N'Đã trả', 'DG07'),
('PM18', '2024-03-18', '2024-04-01', N'Đang Mượn', 'DG08'),
('PM19', '2024-03-19', '2024-04-02', N'Đã trả', 'DG09'),
('PM20', '2024-03-20', '2024-04-03', N'Đang Mượn', 'DG10');

INSERT INTO CHITIET (MADG, MASACH, SLMUON, DONGIA) VALUES
('DG01', 'S01', 2, 25000.00),
('DG02', 'S02', 1, 30000.00),
('DG03', 'S03', 3, 20000.00),
('DG04', 'S04', 2, 22000.00),
('DG05', 'S05', 1, 27000.00),
('DG06', 'S06', 2, 18000.00),
('DG07', 'S07', 3, 16000.00),
('DG08', 'S08', 2, 21000.00),
('DG09', 'S09', 1, 26000.00),
('DG10', 'S10', 3, 15000.00),
('DG01', 'S02', 1, 30000.00),
('DG02', 'S03', 2, 20000.00),
('DG03', 'S04', 3, 22000.00),
('DG04', 'S05', 1, 27000.00),
('DG05', 'S06', 2, 18000.00),
('DG06', 'S07', 3, 16000.00),
('DG07', 'S08', 2, 21000.00),
('DG08', 'S09', 1, 26000.00),
('DG09', 'S10', 3, 15000.00),
('DG10', 'S01', 2, 25000.00),
('DG01', 'S03', 1, 20000.00),
('DG02', 'S04', 2, 22000.00),
('DG03', 'S05', 3, 27000.00),
('DG04', 'S06', 1, 18000.00),
('DG05', 'S06', 3, 18000.00);

-- Lập danh sách các độc giả có sođt bắt đầu là 093 và 090
select * from DOCGIA 
where sodt like '093%' or 
sodt like '090%'

-- Lập danh sách độc giả có ngày mượn từ 01/03/2024 đến 10/03/2024
select sophieu, ngaymuon 
from PHIEUMUONTRA 
where YEAR(ngaymuon) = 2024 and 
MONTH(ngaymuon) = 3 and 
DAY(ngaymuon) <= 10

-- Lập danh sách các độc giả chưa trả sách
select * from PHIEUMUONTRA, DOCGIA where 
DOCGIA.madg = PHIEUMUONTRA.madg and
tinhtrang like N'%Đang%'

-- thực hiện cập nhật đơn giá của sách S01 tăng 10%
UPDATE CHITIET 
SET dongia = dongia + dongia * 0.1 
WHERE masach = 'S01';

-- Thực tính thành tiền thuê sách cho các độc giả DOCGIA.madg, tendg, ngaymuon, tensach, namxb, slmuon
SELECT  DOCGIA.madg, tendg, ngaymuon, tensach, namxb, 
slmuon, dongia, sum(dongia * slmuon) as thanhtien
FROM SACH, DOCGIA, PHIEUMUONTRA, CHITIET 
WHERE SACH.masach = CHITIET.masach AND
DOCGIA.madg = CHITIET.madg AND
DOCGIA.madg = PHIEUMUONTRA.madg 
GROUP by DOCGIA.madg, tendg, ngaymuon, tensach, namxb, 
slmuon, dongia

-- Thống kê số lượng sách của mỗi độc giả DOCGIA.madg, tendg, sosach
SELECT DOCGIA.madg, tendg, count(masach) as sosach 
FROM CHITIET,  DOCGIA 
WHERE DOCGIA.madg = CHITIET.madg
GROUP BY DOCGIA.madg, tendg

-- Tạo PROCEDURE thêm mới dữ liệu vào bảng độc giả
CREATE PROCEDURE THEMMOIDULIEU_DOCGIA1
@madg varchar(20), @tendg nvarchar(255), @sodt varchar(50)
AS
BEGIN
    INSERT INTO DOCGIA(madg, tendg, sodt)
	VALUES(@madg, @tendg, @sodt);
END

exec THEMMOIDULIEU_DOCGIA1 @madg = 'DG11', @tendg = N'Trần Thế Tường', @sodt = '0915662495';

-- tạo PROCEDURE tính tổng tiền thuê sách của mỗi độc giả
CREATE PROCEDURE HIENTHITONGTIEN1
AS
BEGIN
    SELECT  DOCGIA.madg, tendg, sum(dongia * slmuon) as tongtien
	FROM DOCGIA, CHITIET 
	WHERE  DOCGIA.madg = CHITIET.madg
	GROUP by DOCGIA.madg, tendg, slmuon, dongia
END

EXEC HIENTHITONGTIEN1

-- tạo PROCEDURE cho biết số độc giả mượn sách mỗi tháng
CREATE PROCEDURE SODOCGIAMUONSACHMOITHANG1
AS
BEGIN
    SELECT  MONTH(ngaymuon) as thang, count(*) as sodocgiamuon
	FROM PHIEUMUONTRA 
	GROUP BY MONTH(ngaymuon)
END

EXEC SODOCGIAMUONSACHMOITHANG1


-- tạo PROCEDURE cho biết số độc giả trả sách mỗi tháng
CREATE PROCEDURE SODOCGIATRASACHMOITHANG1
AS
BEGIN
    SELECT  MONTH(ngaytra) as thang, count(*) as sodocgiatra
	FROM PHIEUMUONTRA 
	GROUP BY MONTH(ngaytra)
END

EXEC SODOCGIATRASACHMOITHANG1


-- tao function in ra tong tien thue sach cho moi doc gia
CREATE FUNCTION dbo.TONGTIENTHUESACHCUACACDOCGIA1 ()
RETURNS TABLE
AS
RETURN (
    SELECT madg, SUM(slmuon*dongia) as TONGTIEN 
	FROM CHITIET
    GROUP BY madg
);



SELECT * FROM dbo.TONGTIENTHUESACHCUACACDOCGIA1();


-- tao function in ra so sach muon da tra tren moi phieu muon
CREATE FUNCTION dbo.SOSACHDATRACUACACDOCGIA ()
RETURNS TABLE
AS
RETURN (
    SELECT PHIEUMUONTRA.madg, sophieu, COUNT(*) as SOSACHDATRA 
	FROM CHITIET, PHIEUMUONTRA
	WHERE CHITIET.madg = PHIEUMUONTRA.madg
	AND PHIEUMUONTRA.tinhtrang = N'Đã trả'
    GROUP BY PHIEUMUONTRA.madg, sophieu
);



SELECT * FROM dbo.SOSACHDATRACUACACDOCGIA();

-- tao fucntion thong ke so sach cua moi nha xuat ban
CREATE FUNCTION dbo.SOSACHCUACUAMOINHAXUATBAN1 ()
RETURNS TABLE
AS
RETURN (
    SELECT TACGIA.matg, COUNT(*) as SOSACH 
	FROM SACH, TACGIA
	WHERE TACGIA.matg = SACH.matg
    GROUP BY TACGIA.matg
);



SELECT * FROM dbo.SOSACHCUACUAMOINHAXUATBAN1();

-- Tạo PROCEDURE với tham số đầu ra là tổng tiền của mỗi phiếu mượn
CREATE PROCEDURE TONGTIENCUAMOIPHIEUMUON1

AS
BEGIN
    SELECT PHIEUMUONTRA.sophieu, SUM(slmuon * dongia) as TONGTIEN
	FROM CHITIET, PHIEUMUONTRA 
	WHERE CHITIET.madg = PHIEUMUONTRA.madg
	GROUP BY PHIEUMUONTRA.sophieu
END

exec TONGTIENCUAMOIPHIEUMUON1;

-- Tạo PROCEDURE với tham số đầu ra là so luong sach cua moi tac gia
CREATE PROCEDURE SOLUONGSACHCUAMOITACGIA1

AS
BEGIN
    SELECT TACGIA.matg, COUNT(*) as SOLUONGSACH
	FROM TACGIA, SACH 
	WHERE TACGIA.matg = SACH.matg
	GROUP BY TACGIA.matg
END

exec SOLUONGSACHCUAMOITACGIA1;

-- Tạo PROCEDURE in ra so luong doc gia muon, tra sach theo moi thang
CREATE PROCEDURE SOLUONGSACHCUAMOITACGIA_PROCEDURE
@thang int, @tinhtrangmuon NVARCHAR(255), @tinhtrangtra NVARCHAR(255)
AS
BEGIN
	DECLARE @soluongdocgiamuon INT
    DECLARE @soluongdocgiatra INT

    SELECT @soluongdocgiamuon = COUNT(*)
	FROM PHIEUMUONTRA
	WHERE MONTH(ngaymuon) = @thang
	AND tinhtrang = @tinhtrangmuon

	SELECT @soluongdocgiatra =  COUNT(*)
	FROM PHIEUMUONTRA
	WHERE MONTH(ngaymuon) = @thang
	AND tinhtrang =  @tinhtrangtra

	PRINT N'Số lượng độc giả mượn sách là: ' + CAST(@soluongdocgiamuon AS NVARCHAR(10))
    PRINT N'Số lượng độc giả trả sách là: ' + CAST(@soluongdocgiatra AS NVARCHAR(10))

END


exec SOLUONGSACHCUAMOITACGIA_PROCEDURE @thang = 3, 
@tinhtrangmuon = N'Đang Mượn', 
@tinhtrangtra = N'Đã trả';


-- Tạo PROCEDURE cập nhật dongia tăng thêm 5000 cho tat ca sach thue
CREATE PROCEDURE CAPNHATTHEM5000CHOTATCACACSACH1
@sotien decimal
AS
BEGIN
    UPDATE CHITIET SET  dongia = dongia + @sotien
END

exec CAPNHATTHEM5000CHOTATCACACSACH1 @sotien = 5000.0;


-- Tạo PROCEDURE với tham số đầu ra là tổng tiền thuê sách của mỗi độc giả
CREATE PROCEDURE TONGTIENTHUESACHCUAMOIDOCGIA2

AS
BEGIN
    SELECT CHITIET.madg, SUM(slmuon * dongia) as TONGTIEN
	FROM CHITIET
	GROUP BY CHITIET.madg
END

exec TONGTIENTHUESACHCUAMOIDOCGIA2;


select * from TACGIA
select * from SACH
select * from DOCGIA
select * from PHIEUMUONTRA
select * from CHITIET











