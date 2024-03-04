-- Họ và tên: Trần Thế Tường
-- Mssv: 39157
--1. Nêu các vấn đề truy xuất đồng thời  
/*
Câu 1: Nêu các vấn đề truy xuất đồng thời?
- Mất dữ liệu cập nhật (Lost update data).
- Đọc dữ liệu chưa commit (Uncommit data).
- Thao tác đọc không thể lặp lại (Unrepeatable data).
Câu 2: Cho ví dụ minh họa vấn đề mất dữ liệu cập nhật?
Ví dụ 2 người T1 và T2 cùng lúc đang chỉnh sửa trên cùng một tài liệu, 
T1 cập nhật giá trị Soluong = 2 nhưng khi cập nhật xong thì T1 lại thấy Soluong = 5, 
lý do vì T2 cũng đồng thời cập nhật giá trị Soluong đó bằng 5 nên việc 
cập nhật của T1 bị ghi đè, gây ra mất dữ liệu của T1.
Câu 3: Cho ví dụ minh họa vấn đề đọc dữ liệu chưa commit?
- Ban đầu Soluong = 1, T1 chỉnh sửa Soluong = 5 nhưng chưa commit, 
T2 cùng lúc đó tham gia vào chỉnh sửa, lấy dữ liệu lên thì thấy Soluong=5,
T1 hủy bỏ việc chỉnh sửa thì giá trị về ban đầu Soluong = 1, 
thì T2 sẽ bị làm việc trên dữ liệu bị sai lệch.

*/
-- Câu 4: Thực hiện giao dịch đặt vé máy bay? (Chú ý: thiết kế Database cho giao dịch trên)

CREATE DATABASE QUANLYDATVE;

CREATE TABLE HangMayBay (
    MaHang VARCHAR(10) PRIMARY KEY,
    TenHang NVARCHAR(100)
);

CREATE TABLE ChuyenBay (
    MaChuyenBay INT PRIMARY KEY,
    MaHang VARCHAR(10) REFERENCES HangMayBay(MaHang),
    NgayGio DATETIME,
    SoLuongGhe INT,
    SoLuongGheTrong INT
);

CREATE TABLE KhachHang (
    MaKhachHang INT PRIMARY KEY,
    HoTen NVARCHAR(100),
    DiaChi NVARCHAR(255),
    Email NVARCHAR(50),
    SoDienThoai NVARCHAR(20)
);

CREATE TABLE TaiKhoan (
    MaTaiKhoan INT PRIMARY KEY,
    MaKhachHang INT REFERENCES KhachHang(MaKhachHang),
    SoDu DECIMAL(18, 2) DEFAULT 0,
    CONSTRAINT UQ_TaiKhoan_MaKhachHang UNIQUE (MaKhachHang)
);

CREATE TABLE DatVe (
    MaVe INT PRIMARY KEY,
    MaChuyenBay INT REFERENCES ChuyenBay(MaChuyenBay),
    MaTaiKhoan INT REFERENCES TaiKhoan(MaTaiKhoan),
    TenHanhKhach NVARCHAR(100),
    SoDienThoai NVARCHAR(20)
)


INSERT INTO HangMayBay (MaHang, TenHang) VALUES
('HA123', 'Vietnam Airlines'),
('VN456', 'Bamboo Airways'),
('VJ789', 'VietJet Air');

INSERT INTO ChuyenBay (MaChuyenBay, MaHang, NgayGio, SoLuongGhe, SoLuongGheTrong) VALUES
(1, 'HA123', '2024-03-01 12:00:00', 150, 50),
(2, 'VN456', '2024-03-02 14:30:00', 120, 80),
(3, 'VJ789', '2024-03-03 10:45:00', 200, 150);

INSERT INTO KhachHang (MaKhachHang, HoTen, DiaChi, Email, SoDienThoai) VALUES
(1, 'Nguyen Van A', '123 Street, City', 'nguyenvana@email.com', '123456789'),
(2, 'Tran Thi B', '456 Street, Town', 'tranthib@email.com', '987654321');

INSERT INTO TaiKhoan (MaTaiKhoan, MaKhachHang, SoDu) VALUES
(101, 1, 5000000),
(102, 2, 7000000);

INSERT INTO DatVe (MaVe, MaChuyenBay, MaTaiKhoan, TenHanhKhach, SoDienThoai) VALUES
(1001, 1, 101, 'Nguyen Van A', '123456789'),
(1002, 2, 102, 'Tran Thi B', '987654321');

BEGIN TRANSACTION;

DECLARE @MaChuyenBay INT = 1;
DECLARE @SoLuongVe INT = 2;

DECLARE @SoLuongGheTrong INT;
SELECT @SoLuongGheTrong = SoLuongGheTrong 
FROM ChuyenBay WHERE MaChuyenBay = @MaChuyenBay;

IF @SoLuongGheTrong >= @SoLuongVe
BEGIN
    UPDATE ChuyenBay SET SoLuongGheTrong = @SoLuongGheTrong - @SoLuongVe WHERE MaChuyenBay = @MaChuyenBay;

    DECLARE @MaKhachHang INT = 1;
    DECLARE @MaTaiKhoan INT;
    SELECT @MaTaiKhoan = MaTaiKhoan FROM TaiKhoan WHERE MaKhachHang = @MaKhachHang;

    INSERT INTO DatVe (MaChuyenBay, MaTaiKhoan, TenHanhKhach, SoDienThoai)
    VALUES (@MaChuyenBay, @MaTaiKhoan, 'Nguyen Van A', '123456789');

    DECLARE @GiaVe DECIMAL(18, 2) = 1000.00; -- Giả sử giá vé là 1000.00
    UPDATE TaiKhoan SET SoDu = SoDu - (@SoLuongVe * @GiaVe) WHERE MaTaiKhoan = @MaTaiKhoan;

    COMMIT;
    PRINT N'Đặt vé thành công.';
END
ELSE
BEGIN
    ROLLBACK;
    PRINT N'Không đủ ghế trống. Đặt vé không thành công.';
END;


select * from ChuyenBay
select * from DatVe
select * from HangMayBay
select * from KhachHang
select * from TaiKhoan







