use QueryCondition
go
 
select * from GIAOVIEN, BOMON
where BOMON.MABM = GIAOVIEN.MABM

--xuất ra danh sách tên bộ môn và  số lượng giáo viên của bộ môn đó
select TENBM,count(*) as N'số lương giáo viên' from BOMON, GIAOVIEN 
where BOMON.MABM = GIAOVIEN.MABM
group by TENBM

--xuất ra danh sách tên giao viên và tên bộ môn và số lượng bộ môn của giao viên đó
-- vì mỗi giáo viên chỉ có 1 bộ môn nên số lượng bm sẽ là 1
select HOTEN,TENBM,count(*) as N'số lương bộ môn' from BOMON, GIAOVIEN 
where GIAOVIEN.MABM = BOMON.MABM
group by HOTEN,TENBM

-- lấy ra tổng lương của tất cả các giáo viên cộng lại 
select sum(LUONG) as N'tổng lương' from GIAOVIEN
--lấy ra số lương trung bình của các giáo viên
select sum(LUONG)/COUNT(*) as N'số lương trung bình' from GIAOVIEN

-- lấy ra danh sách giáo viên có lương lớn hơn lương trung bình của giáo viên
select * from GIAOVIEN
where LUONG > (select sum(LUONG) from GIAOVIEN)/(select count(*) from GIAOVIEN)

--xuất ra tên giáo viên và số lượng đề tài giáo viên đó đã làm
select GIAOVIEN.HOTEN, count(*) as N'số lượng đề tài' from GIAOVIEN, THAMGIADT
where GIAOVIEN.MAGV = THAMGIADT.MAGV
group by GIAOVIEN.HOTEN, GIAOVIEN.MAGV

--xuất ra tên giáo viên và số ng thân của giáo viên đó
select GV.HOTEN, count(*) as N'số người thân' from GIAOVIEN as GV, NGUOITHAN as NT
where GV.MAGV = NT.MAGV
group by GV.HOTEN, NT.MAGV

-- xuất ra tên giáo viên và số lượng đề tài đã hoàn thành mà giáo viên đó tham gia
select GV.HOTEN,count(*) as N'số lượng đề tài hoàn thành' from GIAOVIEN as GV,THAMGIADT as TGDT
where GV.MAGV = TGDT.MAGV and TGDT.KETQUA = N'Đạt'  
group by GV.HOTEN, TGDT.MAGV
--cách 2
SELECT GV.HOTEN, SLDT.SL
	FROM dbo.GIAOVIEN AS GV 
		JOIN
		(
			SELECT MAGV, COUNT(*) AS SL
			FROM dbo.THAMGIADT
			WHERE KETQUA = N'Đạt'
			GROUP BY MAGV
		) AS SLDT
	ON GV.MAGV = SLDT.MAGV


--xuất ra tên khoa có tổng số lương của giáo viên trong khoa là lớn nhất
-- dùng top(1) và order by desc để lấy 1 hàng có lương trung bình lớn nhất
SELECT top(1) K.TENKHOA, SUM(GV.LUONG) / COUNT(*) AS LTB
FROM GIAOVIEN AS GV, BOMON AS BM, KHOA AS K
WHERE GV.MABM = BM.MABM AND BM.MAKHOA = K.MAKHOA
GROUP BY K.TENKHOA,GV.MABM,BM.MAKHOA
ORDER BY LTB desc

--xuất ra tên khoa có tổng số lương của giáo viên trong khoa là bé nhất
-- dùng top(1) và order by asc để lấy 1 hàng có lương trung bình bé nhất
SELECT top(1) K.TENKHOA, SUM(GV.LUONG) / COUNT(*) AS LTB
FROM GIAOVIEN AS GV, BOMON AS BM, KHOA AS K
WHERE GV.MABM = BM.MABM AND BM.MAKHOA = K.MAKHOA
GROUP BY K.TENKHOA,GV.MABM,BM.MAKHOA
ORDER BY LTB asc

select * from THAMGIADT
select * from KHOA
select * from BOMON
select * from CONGVIEC
select * from DETAI
select * from CHUDE
select * from NGUOITHAN
select * from SDT_GV
select * from GIAOVIEN






















