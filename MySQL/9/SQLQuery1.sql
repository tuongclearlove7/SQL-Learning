USE HowKteam
GO

SELECT GV.MAGV, HOTEN, NT.TEN FROM dbo.GIAOVIEN AS GV, dbo.NGUOITHAN AS NT
WHERE gv.MAGV = nt.MAGV

SELECT * FROM dbo.GIAOVIEN

-- Lấy ra giáo viên lương > 2000
SELECT * FROM dbo.GIAOVIEN
WHERE LUONG > 2000

-- Lấy ra giáo viên Là nữ và lương > 2000
SELECT * FROM dbo.GIAOVIEN 
WHERE LUONG > 2000 AND PHAI = N'Nữ'

-- Lấy ra giáo viên lớn hơn 40 tuổi
-- YEAR -> lấy ra năm của ngày
-- GETDATE -> lấy ngày hiện tại

SELECT * FROM dbo.GIAOVIEN
WHERE YEAR(GETDATE()) - YEAR(NGSINH) > 40

-- Lấy ra Họ tên giáo viên, năm sinh và tuổi của giáo viên nhỏ hơn 40 tuổi
SELECT HOTEN, NGSINH, YEAR(GETDATE()) - YEAR(NGSINH) FROM dbo.GIAOVIEN
WHERE YEAR(GETDATE()) - YEAR(NGSINH) <= 40

-- Lấy ra Mã GV, Tên GV và Tên khoa của giáo viên đó làm việc.
SELECT gv.MAGV, gv.HOTEN, k.TENKHOA FROM dbo.GIAOVIEN AS GV,dbo.BOMON AS BM, dbo.KHOA AS K
WHERE GV.MABM = bm.MABM AND bm.MAKHOA = k.MAKHOA

-- Lấy ra giáo viên là trưởng bộ môn
SELECT gv.* FROM dbo.GIAOVIEN AS GV, dbo.BOMON AS BM
WHERE gv.MAGV = bm.TRUONGBM

-- Đếm số lượng giáo viên
-- COUNT(*) -> đếm số lượng của tất cả record
-- COUNT(tên trường nào đó) -> Đếm số lượng của tên trường đó
SELECT COUNT(*) AS N'Số lượng giáo viên' FROM dbo.GIAOVIEN

-- Đếm số lượng người thân của Giáo viên có mã GV là 007
SELECT COUNT(*) AS N'Số lượng người thân' 
FROM dbo.GIAOVIEN, dbo.NGUOITHAN
WHERE GIAOVIEN.MAGV = '007' 
AND GIAOVIEN.MAGV = NGUOITHAN.MAGV

-- Lấy ra tên giáo viên và tên đề tài người đó tham gia
SELECT HOTEN, TENDT FROM dbo.GIAOVIEN, dbo.THAMGIADT, dbo.DETAI
WHERE GIAOVIEN.MAGV = THAMGIADT.MAGV
AND DETAI.MADT = THAMGIADT.MADT

-- Lấy ra tên giáo viên và tên đề tài người đó tham gia khi mà người đó tham gia nhiều hơn 1 lần
-- Truy vấn lồng sẽ giải quyết


-- Bài tập:
-- 1.Xuất ra thông tin giáo viên và Giáo viên quản lý chủ nhiệm của người đó
SELECT gv1.HOTEN, gv2.HOTEN FROM dbo.GIAOVIEN AS GV1, dbo.GIAOVIEN AS GV2
WHERE gv1.GVQLCM = GV2.MAGV

-- 2.Xuất ra số lượng giáo viên của khoa CNTT
SELECT COUNT(*) FROM dbo.GIAOVIEN AS GV, dbo.BOMON AS BM, dbo.KHOA AS K
WHERE gv.MABM = bm.MABM 
AND bm.MAKHOA = k.MAKHOA
AND k.MAKHOA = 'CNTT'

-- 3.Xuất ra thông tin giáo viên và đề tài người đó tham gia khi mà kết quả là đạt
SELECT GV.* FROM dbo.GIAOVIEN AS GV, dbo.THAMGIADT as TG
WHERE gv.MAGV = tg.MAGV
AND tg.KETQUA = N'Đạt'