-- tạo cơ sở dữ liệu mới
create database Primary_Foreign 
go
use Primary_Foreign  -- sử dụng database Primary_Foreign
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

insert into Lop(MaLop,TenLop)values('MH01',N'lớp 1')
insert into Lop(MaLop,TenLop)values('MH02',N'lớp 2')
insert into Lop(MaLop,TenLop)values('MH03',N'lớp 3')

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

insert into HocSinh(MaHS,MaLop,TenHS)values('MaHS01','MH01',N'Trần Thế Tường 1')
insert into HocSinh(MaHS,MaLop,TenHS)values('MaHS02','MH02',N'Hồ Phương Thảo 2')
insert into HocSinh(MaHS,MaLop,TenHS)values('MaHS03','MH03',N'Clearlove 7')

alter table giaovien 
drop COLUMN Sex
alter table giaovien add gioitinh bit

alter table Monhoc 
drop COLUMN Ten
alter table Monhoc add TenMH Nvarchar(100) 

alter table lop 
drop COLUMN tenHS
alter table lop add TenLop Nvarchar(100)

alter table GiaoVien
drop COLUMN ten
alter table GiaoVien add TenGV Nvarchar(100) 

alter table HocSinh
drop COLUMN ten
alter table HocSinh add TenHS Nvarchar(100)

delete from Lop
delete from MonHoc
delete from GiaoVien
delete from HocSinh

select * from MonHoc
where MaMH = 'MH01'
select * from Lop
select * from GiaoVien
where gioitinh < 100
select * from HocSinh
 
