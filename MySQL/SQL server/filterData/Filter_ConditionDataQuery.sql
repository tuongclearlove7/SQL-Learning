--sử dụng databse QueryCondition
use QueryCondition

select GV.MAGV, GV.HOTEN,NT.TEN from GIAOVIEN as GV , NGUOITHAN as NT

select GV.MAGV, GV.HOTEN, K.TENKHOA from GIAOVIEN as GV,BOMON as BM,KHOA as K

select GV.MAGV, GV.HOTEN,NT.TEN from GIAOVIEN as GV , NGUOITHAN as NT
where GV.MAGV = NT.MAGV

select * from GIAOVIEN as GV , NGUOITHAN as NT

select * from GIAOVIEN
where LUONG > 2000

select * from GIAOVIEN
where LUONG > 2000 and PHAI = N'Nữ'

-- lấy năm hiện tại - cho năm sinh của người đó
select * from GIAOVIEN
--where YEAR(GETDATE()) -  year(NGSINH) > 40
where YEAR('20200101') -  year(NGSINH) > 40

-- dùng điều kiện để lấy ra cột
select HOTEN, NGSINH, YEAR(getdate()) -  year(NGSINH) as N'tuổi' from GIAOVIEN
where YEAR(getdate()) -  year(NGSINH) < 50

select GV.MAGV, GV.HOTEN, K.TENKHOA from GIAOVIEN as GV,BOMON as BM,KHOA as K
where GV.MABM = BM.MABM and BM.MAKHOA = K.MAKHOA

select * from GIAOVIEN as GV , BOMON AS BM
where GV.MAGV = bm.TRUONGBM

-- lấy ra thông tin giáo viên là trưởng bộ môn (gộp 2 bảng vs nhau)
select * from GIAOVIEN as GV , BOMON AS BM
where GV.MAGV = bm.TRUONGBM

-- lấy ra thông tin giáo viên là trưởng bộ môn 
select GV.*,TRUONGBM from GIAOVIEN as GV , BOMON AS BM
where GV.MAGV = bm.TRUONGBM

-- đếm số lượng  giáo viên 
-- dùng hàm count(*) 
select count(*) as N'số giáo viên' from GIAOVIEN 

--đếm số lượng ng thân của giáo viên có mã gv là 007
select count(*) as N'số lượng ng thân' 
from GIAOVIEN as GV, NGUOITHAN as NT
where GV.MAGV = '007' and GV.MAGV = NT.MAGV
select * from GIAOVIEN, NGUOITHAN 
where GIAOVIEN.MAGV = '007' and GIAOVIEN.MAGV = NGUOITHAN.MAGV

-- lấy ra tên người thân của giáo viên có mã gv là 007
select NGUOITHAN.TEN as N'Tên người thân' from GIAOVIEN, NGUOITHAN 
where GIAOVIEN.MAGV = '007' and GIAOVIEN.MAGV = NGUOITHAN.MAGV

-- lấy tên giáo viên và tên đề tài ng đó tham gia
SELECT  GIAOVIEN.HOTEN, DETAI.TENDT  FROM GIAOVIEN, THAMGIADT, DETAI
WHERE GIAOVIEN.MAGV = THAMGIADT.MAGV AND DETAI.MADT = THAMGIADT.MADT 

-- 1.Xuất ra thông tin giáo viên và Giáo viên quản lý chủ nhiệm của người đó
SELECT TTGV .* ,
	   QLGV.HOTEN as N'Giáo viên quản lý chủ nhiệm' 
FROM GIAOVIEN as TTGV, GIAOVIEN as QLGV 
WHERE TTGV.QLGVCN = QLGV.MAGV
--cách 2
SELECT TTGV.HOTEN as N'Họ tên thông tin giáo viên',
	   --TTGV.PHAI as N'Thông tin giáo viên',
	  -- TTGV.NGSINH as N'Thông tin giáo viên',
	  -- TTGV.DIACHI as N'Thông tin giáo viên',
	  -- TTGV.LUONG as N'Thông tin giáo viên',
	 --  TTGV.MABM as N'Thông tin giáo viên',
	   QLGV.HOTEN as N'Giáo viên quản lý chủ nhiệm' 
FROM GIAOVIEN as TTGV, GIAOVIEN as QLGV 
WHERE TTGV.QLGVCN = QLGV.MAGV

-- 2.Xuất ra số lượng giáo viên của khoa CNTT
SELECT  *  FROM GIAOVIEN, KHOA
where  KHOA.MAKHOA = N'CNTT'
SELECT  count(*) as N'số giáo viên khoa CNTT' FROM GIAOVIEN, KHOA
where KHOA.MAKHOA = N'CNTT'

-- 3.lấy thông tin giáo viên và  đề tài ng đó tham gia có kết quả là đạt
SELECT  GIAOVIEN.*,KETQUA  FROM GIAOVIEN, THAMGIADT
WHERE GIAOVIEN.MAGV = THAMGIADT.MAGV and THAMGIADT.KETQUA = N'Đạt'

-- Xuất ra thông tin giáo viên mà có bắt đầu bằng chữ l
-- dùng like so sánh chuỗi 
-- l% sau là bắt đầu
select * from GIAOVIEN
where GIAOVIEN.HOTEN like 'l%' 

-- Xuất ra thông tin giáo viên mà có kết thúc bằng chữ N
-- %N trước là bắt đầu
select * from GIAOVIEN
where GIAOVIEN.HOTEN like '%n'

-- Xuất ra thông tin giáo viên có tồn tại  chữ A
-- syntax : %a% 
select * from GIAOVIEN
where GIAOVIEN.HOTEN like '%A%'

-- Xuất ra thông tin giáo viên có tồn tại chữ à
select * from GIAOVIEN
where GIAOVIEN.HOTEN like N'%À%'

select * from THAMGIADT
select * from KHOA
select * from BOMON
select * from CONGVIEC
select * from DETAI
select * from CHUDE
select * from NGUOITHAN
select * from SDT_GV
select * from GIAOVIEN





































