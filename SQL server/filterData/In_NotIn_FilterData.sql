use QueryCondition
go
--truy vấn lồng
--kiểm tra xem giáo viên 001 có phải là quản lý giáo viên chủ nhiệm hay k
--ý tưởng 
-- lấy ra danh sách các mã giáo viên QLQVCN
--sau đó kiểm tra MAGV tồn tại trong danh sách đó 
-- in là 1 cái gì đó tồn tại bên trong 1 danh sách gì đó
--not in là không tồn tại bên trong
select * from GIAOVIEN
where MAGV = '001' and MAGV in(select QLGVCN from GIAOVIEN)
select * from GIAOVIEN
where MAGV = '001' and MAGV not in(select QLGVCN from GIAOVIEN)

--truy vấn lồng trong from
select * from GIAOVIEN, (select * from DETAI ) as DT

-- xuất ra danh sách giáo viên tham gia nhiều hơn 1 đề tài 
-- lấy ra tất cả thông tin giáo viên
-- khi mà số lượng đề tài giáo viên đó tham gia > 1
-- trong bảng THAMGIADT nếu MAGV xuất hiện bao nhiêu lần 
-- thì giao viên đó tham gia chừng đó đề tài 
select * from GIAOVIEN as GV
where 1 <(
select count(*) as N'số gv' from THAMGIADT
where MAGV = GV.MAGV
)
-- xuất ra thông tin giáo viên mà có hơn 1 ng thân
-- MAGV của ng đó xuất hiện bao nhiêu lần trong bảng NGUOITHAN
-- thì ng đó có chừng đó ng thân
select * from GIAOVIEN	
where 1 < (
select count(*) as N'số gv' from NGUOITHAN 
where GIAOVIEN.MAGV = NGUOITHAN.MAGV
)
-- đếm xem có bao nhiêu giáo viên có số ng thân nhiều hơn 1
select count(*) as N'số giáo viên' from GIAOVIEN as GV
where 1 < (
select count(*) from NGUOITHAN
where MAGV = GV.MAGV
)


-- xuất ra thông tin giáo viên mà k có ng thân nào
select * from GIAOVIEN	
where (
select count(*) as N'số gv' from NGUOITHAN 
where GIAOVIEN.MAGV = NGUOITHAN.MAGV
) = 0



--xuất ra thông tin của khoa mà có nhiều hơn 2 giáo viên 
-- lấy ra danh sách bộ môn nằm trong khoa hiện tại
select * from KHOA
where  2 < (
select count(*) from GIAOVIEN,BOMON
where BOMON.MAKHOA = KHOA.MAKHOA and BOMON.MABM = GIAOVIEN.MABM
)
-- sắp xếp giảm dần
select magv from GIAOVIEN
order by MAGV desc
-- sắp xếp tăng dần
select magv from GIAOVIEN
order by MAGV asc
--lấy ra top 5 phần tử 
select top(5) * from GIAOVIEN


--Xuất ra danh sách các giáo viên lớn tuổi hơn ít nhất 5 giáo viên trong trg


select * from THAMGIADT
select * from KHOA
select * from BOMON
select * from CONGVIEC
select * from DETAI
select * from CHUDE
select * from NGUOITHAN
select * from SDT_GV
select * from GIAOVIEN