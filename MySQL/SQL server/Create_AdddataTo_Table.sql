--create table

create database SQLDBQuery
go -- go la lenh thuc thi lenh tiep theo
use SQLDBQuery
go
create table GiangVien(
	MaGV nvarchar(10),
	Hoten nvarchar(100)
)
go
create table SinhVien(
	MaSV nvarchar(10),
	Hoten nvarchar(100)
)
go

insert  SinhVien (MaSV,Hoten,ngaysinh) -- thêm dữ liệu vào các cột trong bảng
values(N'5',N'Tran The Tuong','20020116')
go

--xóa cột trong bảng 
alter table SinhVien 
drop COLUMN ngaysinh

alter table SinhVien add ngaysinh date  --sửa bảng , thêm cột 
alter table GiangVien add ngaysinh date

truncate table SinhVien -- xóa toàn bộ dữ liệu trong bảng 
delete from SinhVien	-- hoặc sử dụng delete from SinhVien

update SinhVien set MaSV = N'S7'; 
update SinhVien set Hoten = N'Trần Thế Tường'; 
update SinhVien set ngaysinh = GETDATE(); 

drop table SinhVien      --xóa bảng

go
drop table GiangVien

select * from SinhVien -- truy vấn dữ liệu của toàn bộ bảng SinhVien














