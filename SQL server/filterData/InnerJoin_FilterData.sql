use QueryCondition
go

--inner join cách này có thể sau này không còn được hỗ trợ
-- mọi join đều cần điều kiện
select * from GIAOVIEN,BOMON
where GIAOVIEN.MABM = BOMON.MABM

-- truy vấn kiểu inner join
select * from GIAOVIEN inner join BOMON
on BOMON.MABM = GIAOVIEN.MABM

-- có thể viết tắt inner join là join
select * from KHOA join BOMON
on KHOA.MAKHOA = BOMON.MAKHOA


select * from THAMGIADT
select * from KHOA
select * from BOMON
select * from CONGVIEC
select * from DETAI
select * from CHUDE
select * from NGUOITHAN
select * from SDT_GV
select * from GIAOVIEN