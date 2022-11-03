use QueryCondition
go

-- select * into  sẽ lấy ra toàn bộ dữ liệu trong bảng giáo viên
-- và thêm vào bảng mới được tạo ra là Teacher
select * into Teacher from GIAOVIEN

-- select MAGV,HOTEN into sẽ lấy ra trường cột MAGV và HOTEN 
-- và thêm vào bảng mới được tạo ra là Teacher
select MAGV,HOTEN into Teacher from GIAOVIEN

-- có điều kiện
-- select MAGV,HOTEN into sẽ lấy ra trường cột MAGV và HOTEN 
--có điều kiện phái là nữ
-- và thêm vào bảng mới được tạo ra là Teacher
select MAGV,HOTEN into Teacher from GIAOVIEN
where PHAI = N'Nữ'

select * from Teacher
delete from Teacher

-- tạo ra một bảng bằng backup bảng giáo viên đưa vào Database backup
--tạo 1 bảng mới và đưa dữ liệu từ nhiều bảng vào
select MAGV,HOTEN,TENBM into BackupTable from GIAOVIEN,BOMON
where GIAOVIEN.MABM = BOMON.MABM
select * from BackupTable

-- tạo ra một bảng mà các cột giống với bảng giáo viên
-- nhưng bên trong k có dữ liệu
-- thì ta cho điều kiện sai vào
select * into NullTable from GIAOVIEN
where 7>9
select * from NullTable

-- insert into select sao chép dữ liệu vào bảng đã tồn tại
-- clone ra 1 bảng giáo viên mới có tên là Clone_GV 
-- với đk sai thì bảng Clone_GV sẽ k có dữ liệu
-- lưu ý trường dữ trường cột phải tương đồng nhau
select * into Clone_GV from GIAOVIEN
where 1=0
insert into Clone_GV -- và insert dữ liệu từ bảng giáo viên vào bảng Clone_GV
select * from GIAOVIEN
select * from Clone_GV

select * from THAMGIADT
select * from KHOA
select * from BOMON
select * from CONGVIEC
select * from DETAI
select * from CHUDE
select * from NGUOITHAN
select * from SDT_GV
select * from GIAOVIEN