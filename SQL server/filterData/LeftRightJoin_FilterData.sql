use QueryCondition
go

use QueryCondition
go


select * from BOMON join GIAOVIEN
on BOMON.MABM = GIAOVIEN.MABM

--Left join
-- left join là bảng bên phải nhập vào bảng bên trái
-- record nào bảng bên phải k có thì null
-- record nào bảng bên trái k có thì k điền vào 
select * from BOMON left join GIAOVIEN
on BOMON.MABM = GIAOVIEN.MABM

--right join
select * from BOMON right join GIAOVIEN
on BOMON.MABM = GIAOVIEN.MABM



select * from THAMGIADT
select * from KHOA
select * from BOMON
select * from CONGVIEC
select * from DETAI
select * from CHUDE
select * from NGUOITHAN
select * from SDT_GV
select * from GIAOVIEN