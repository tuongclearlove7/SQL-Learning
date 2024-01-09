-- created db1
create table Lop(
Malop nvarchar(10) primary key,
TenLop nvarchar(50) unique,
CVHT nvarchar(50)
)
go
--Tao bang sinh vien
create table SinhVien(
MaSV nvarchar(10) primary key,
HoLot nvarchar(20) not null,
TenSV nvarchar(10) not null,
Phai bit,
Ngaysinh datetime,
Diachi nvarchar(100),
Malop nvarchar(10),
constraint ML_SV_Lop foreign key(Malop) references Lop(Malop)
)
go
--Tao ban mon hoc
create table Monhoc(
MaMH nvarchar(10) primary key,
TenMH nvarchar(50) unique,
SoTC int
)
go
--Tao bang diem
create table Diem
(
 MaMH nvarchar(10),
 MaSV nvarchar(10),
 DiemLan1 float,
 DiemLan2 float,
 constraint khoachinh primary key(MaSV,MaMH),
 constraint MaMH_Diem_MonHoc foreign key(MaMH) references Monhoc(MaMH),
 constraint MaSV_Diem_SV foreign key(MaSV) references SinhVien(MaSV)
 )
 go
insert into Lop values('k19TPM','k19TPM','Le Anh')
insert into Lop values('k19TPM','k19TPM','The Tuong')
insert into Lop values('k19TPM','k19TPM','Phuong Thao')
go
insert SinhVien values('SV01','Le','Anh','1','2002-01-10',N'20 Le Lai DN','k26TPM')
insert SinhVien values('SV02',N'Tran The','Tuong','0','2002-01-10',N'20 Le Lai DN','k26TPM')
insert SinhVien values('SV03','Phuong','Thao','1','2002-01-10',N'20 Le Lai DN','k26TPM')
go
insert  SinhVien values('MH01','SV01',4.5,6.5)
insert  SinhVien values('MH02','SV01',2.5,7.5)
insert  SinhVien values('MH03','SV01',6.5,8.5)
go
insert  SinhVien values('MH01','SV02',3.5,9.5)
insert  SinhVien values('MH02','SV02',5.5,8.5)
insert  SinhVien values('MH03','SV02',6.5,7.5)
go
select * from SinhVien

select * from Lop
delete from Lop

select * from Monhoc

select * from Diem

select M.MaMH,M.TenMH,M.SoTC,D.DiemLan1
from Monhoc M,Diem D
where M.MaMH=d.MaMH and D.MaSV='SV01'

Select M.MaMH, M.TenMH, M.SoTC, D.DiemLan2 
from Sinhvien S, Monhoc M, Diem D
where s.MaSV=D.MaSV and D.MaMH=M.MaMH and S.TenSV='Anh'

select * from Diem
selecT S.MaSV,S.TenSV
from Sinhvien S
where S.MaSV not in (select D.MaSV from Diem D)

select M.MaMH, M.TenMH
from Monhoc M
where M.MaMH not  in (select MaMH from Diem)

delete from Monhoc where MaMH not in (select MaMH from Diem)

select * from Monhoc
insert into Monhoc values('MH04',N'lap trinh HDT',4)
select * from Diem

select S.MaSV,S.HoLot,S.TenSV,S.Diachi,case when S.Phai='1' then 'Nam' else N'Nữ' end as N'Giới Tính',
year(getdate())-year(S.Ngaysinh) as N'Tuổi'

from Sinhvien S
select S.MaSV,S.HoLot,S.TenSV,S.Diachi,case when S.Phai='1' then 'Nam' else N'Nữ' end as N'Giới Tính',
year(getdate())-year(S.Ngaysinh) as N'Tuổi'
from Sinhvien S
where S.Diachi like N'%ĐN%'

select S.MaSV,S.HoLot,S.TenSV,S.Diachi,case when S.Phai='1' then 'Nam' else N'Nữ' end as N'Giới Tính',
year(getdate())-year(S.Ngaysinh) as N'Tuổi',sum(D.Diemlan1*M.SoTC)/sum(M.Sotc) as 'DTB'
from SinhVien S,Diem D,Monhoc M
where S.MaSV=D.MaSV and D.MaMH=M.MaMH 
group by S.MaSV,S.HoLot,S.TenSV,S.Diachi,S.Ngaysinh,S.Phai




















