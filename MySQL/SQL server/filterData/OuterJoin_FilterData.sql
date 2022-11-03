use QueryCondition
go

select * from GIAOVIEN,BOMON
where GIAOVIEN.MABM = BOMON.MABM

-- gom 2 bảng lại theo điều kiện bên nào k có dữ liệu thì để null
select * from GIAOVIEN full outer join BOMON
on BOMON.MABM = GIAOVIEN.MABM

--cross join là tổ hợp mỗi record của bảng A với all record của bảng B
--cross join k có cần điều kiện on
select * from GIAOVIEN cross join BOMON



select * from THAMGIADT
select * from KHOA
select * from BOMON
select * from CONGVIEC
select * from DETAI
select * from CHUDE
select * from NGUOITHAN
select * from SDT_GV
select * from GIAOVIEN