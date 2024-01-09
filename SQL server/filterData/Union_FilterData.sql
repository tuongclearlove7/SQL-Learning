use QueryCondition
go

select * from GIAOVIEN
select * from NGUOITHAN

select MAGV from GIAOVIEN
select MAGV from NGUOITHAN

-- union sẽ lấy ra cột trường mà giống nhau của 2 bảng 
select MAGV from GIAOVIEN
union
select MAGV from NGUOITHAN


select MAGV from GIAOVIEN
where LUONG < 2000
union
select MAGV from NGUOITHAN
where PHAI = N'Nam'



select * from THAMGIADT
select * from KHOA
select * from BOMON
select * from CONGVIEC
select * from DETAI
select * from CHUDE
select * from NGUOITHAN
select * from SDT_GV
select * from GIAOVIEN