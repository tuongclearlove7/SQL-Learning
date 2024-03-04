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
























