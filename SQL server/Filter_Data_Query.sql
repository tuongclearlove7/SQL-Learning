-- tạo cơ sở dữ liệu mới
create database My_FilterDataQuery
go
use My_FilterDataQuery -- sử dụng database My_FilterDataQuery
go

-- tạo khóa ngoại 
-- khóa trường cột chứa khóa ngoại phải trùng kiểu dữ liệu vs khóa chính
create table MonHoc(
	MaMH char(10) primary key,
	Ten Nvarchar(100)
)
go

create table Lop(
	MaLop char(10) not null,
	Ten Nvarchar(100)
	primary key(malop)
)
go

--điều kiện để tạo khóa ngoại
-- phải tham chiếu tới khóa chính 
--phải cùng kiểu dữ liệu 
-- phải cùng số lượng trường có sắp xếp
--lợi ích là đảm bảo toàn vẹn dữ liệu
-- k có trường hợp tham chiếu tới dữ liệu không tồn tại
create table GiaoVien(
	MaGV char(10) not null,
	Ten Nvarchar(100),
	diachi  Nvarchar(100),
	ngaysinh date,
	Sex bit,
	MaMH char(10),
	foreign key(MaMH) references MonHoc(MaMH)
)
alter table giaovien add primary key(MaGV)
go

create table HocSinh(
	MaHS char(10) primary key,
	Ten Nvarchar(100),
	MaLop char(10)
)
--tạo khóa ngoại ngoài bảng 
alter table hocsinh add foreign key(MaLop) references Lop(MaLop)
--tạo khóa ngoại có tên
alter table hocsinh add constraint FK_HS foreign key(MaLop) references Lop(MaLop)
--cách hủy khóa ngoại
--alter table hocsinh drop constraint FK_HS

insert into MonHoc(MaMH,TenMH)values('MH01',N'Bộ môn 1')
insert into MonHoc(MaMH,TenMH)values('MH02',N'Bộ môn 2')
insert into MonHoc(MaMH,TenMH)values('MH03',N'Bộ môn 3')
insert into MonHoc(MaMH,TenMH)values('MH04',N'Bộ môn 4')

insert into Lop(MaLop,TenLop)values('MaLop01',N'lớp 1')
insert into Lop(MaLop,TenLop)values('MaLop02',N'lớp 2')
insert into Lop(MaLop,TenLop)values('MaLop03',N'lớp 3')
insert into Lop(MaLop,TenLop)values('MaLop04',N'lớp 4')

insert into GiaoVien(MaGV,TenGV,diachi,ngaysinh,gioitinh,MaMH)values('GV01',
																	N'Trần Thị Mai',
																	N'DaNang',
																	GETDATE(),
																	0,
																	'MH01')
insert into GiaoVien(MaGV,TenGV,diachi,ngaysinh,gioitinh,MaMH)values('GV02',
																	N'Hồ Phương Thảo',
																	N'DaNang',
																	GETDATE(),
																	0,
																	'MH02')
insert into GiaoVien(MaGV,TenGV,diachi,ngaysinh,gioitinh,MaMH)values('GV03',
																	N'Tran Thi Mai',
																	N'DakLak',
																	GETDATE(),
																	0,
																	'MH03')
insert into GiaoVien(MaGV,TenGV,diachi,ngaysinh,gioitinh,MaMH)values('GV04',
																	N'Ho Phuong Thao',
																	N'DakLak',
																	GETDATE(),
																	0,
																	'MH04')

insert into HocSinh(MaHS,MaLop,TenHS)values('MaHS01','MaLop01',N'Trần Thế Tường 1')
insert into HocSinh(MaHS,MaLop,TenHS)values('MaHS02','MaLop02',N'Hồ Phương Thảo 2')
insert into HocSinh(MaHS,MaLop,TenHS)values('MaHS03','MaLop03',N'Clearlove 7')
insert into HocSinh(MaHS,MaLop,TenHS)values('MaHS04','MaLop04',N'Rose 7')

update GiaoVien set ngaysinh = GETDATE()
update GiaoVien set ngaysinh = '20030909' where TenGV = N'Hồ Phương Thảo'
update GiaoVien set ngaysinh = '20030909' where TenGV = N'Ho Phuong Thao'
update Lop set MaLop = 'MaLop01' where TenLop = N'lớp 1'
update Lop set MaLop = 'MaLop02' where TenLop = N'lớp 2'
update Lop set MaLop = 'MaLop03' where TenLop = N'lớp 3'
update HocSinh set TenHS = 'Rose 9' where MaHS = 'MaHS04'
update HocSinh set MaLop = 'MaLop01' where MaHS = 'MaHS01'
update HocSinh set GT_HS = 1 where TenHS = N'Trần Thế Tường 1'
update HocSinh set GT_HS = 0 where TenHS = N'Hồ Phương Thảo 2'
update HocSinh set GT_HS = 1 where TenHS = N'Clearlove 7'
update HocSinh set GT_HS = 0 where TenHS = N'Rose 9'

update giaovien set GT_GV = 0

alter table giaovien 
drop COLUMN Sex

alter table giaovien
drop COLUMN gioitinh
alter table giaovien add GT_GV bit

alter table HocSinh
drop COLUMN gioitinh
alter table HocSinh add GT_HS bit

alter table Monhoc 
drop COLUMN Ten
alter table Monhoc add TenMH Nvarchar(100) 

alter table lop 
drop COLUMN Ten
alter table lop add TenLop Nvarchar(100)

alter table GiaoVien
drop COLUMN ten
alter table GiaoVien add TenGV Nvarchar(100) 

alter table HocSinh
drop COLUMN ten
alter table HocSinh add TenHS Nvarchar(100)
alter table HocSinh add gioitinh bit

delete from Lop
delete from MonHoc
delete from GiaoVien
delete from HocSinh

select * from MonHoc

select * from Lop

select * from GiaoVien

select * from HocSinh


select MaGV,TenGV from GiaoVien

--hiển thị đổi tên cột
select MaGV as N'mã giáo viên',TenGV as N'Tên', ngaysinh from GiaoVien

--truy vấn nhiều bảng gộp lại vs nhau 
-- xuất ra mã giáo viên, tên giáo viên, tên bộ môn giáo viên đó dạy 
-- có 4 dòng nên số dòng sẽ nhân 4 lên  
select MaGV, TenGV, TenMH from GiaoVien, MonHoc

-- đặt biệt danh cho GiaoVien và MonHoc
select GV.MaGV, GV.TenGV, MH.TenMH 
from GiaoVien as GV, MonHoc as MH

select MaGV, TenLop, TenGV, TenMH, TenHS , diachi, ngaysinh, GT_GV 
from GiaoVien, MonHoc, Lop, HocSinh
where GT_GV = 0

select GV.MaGV, TenGV, HS.TenHS  
from GiaoVien as GV, HocSinh as HS

-- Truy vấn có điều kiện 
select GV.MaGV, TenGV, HS.TenHS, MH.TenMH  
from GiaoVien as GV, HocSinh as HS, MonHoc as MH
where GV.MaGV = MH.MaMH

select GV.MaGV, GV.TenGV, HS.TenHS  from GiaoVien as GV, HocSinh as HS

select GV.MaGV, TenGV, MH.TenMH  
from GiaoVien as GV, MonHoc as MH
where GV.MaGV = MH.MaGV

select * from GiaoVien
where GT_GV = 0 and diachi = N'DaNang'

-- lấy năm hiện tại - cho năm sinh của người đó
select * from GiaoVien
where YEAR(getdate()) -  year(ngaysinh) > 18

-- dùng điều kiện để lấy ra cột
select TenGV, ngaysinh, YEAR(getdate()) -  year(ngaysinh) as tuoi from GiaoVien
where YEAR(getdate()) -  year(ngaysinh) < 18


select TenGV, ngaysinh, YEAR(getdate()) -  year(ngaysinh) as tuoi from GiaoVien
where YEAR(getdate()) -  year(ngaysinh) > 18


select GV.MaGV, GV.TenGV, MH.TenMH  
from GiaoVien as GV, MonHoc as MH
where GV.MaMH = MH.MaMH 



