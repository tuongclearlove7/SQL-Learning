﻿-- thêm dữ liệu
-- kiểu ký tự hoặc ngày cần để trong cặp nháy đơn 
-- nếu có tiếng việt thì cần để chữ N'' trc dấu nháy đơn 
-- hàm GETDATE() là lấy thời gian hiện tại

create table KhachHang(
	MaKH INT,
	Ten nvarchar(50),
	Ngaysinh date,
	gioitinh BIT,
	diachi char(20),
	tienluong float
)
go

insert KhachHang (MaKH,Ten,Ngaysinh,gioitinh,diachi,tienluong)values( 10,N'Trần Thế Tường',
'20020116',1,'DaNang',20000)
insert KhachHang (MaKH,Ten,Ngaysinh,gioitinh,diachi,tienluong)values( 11,N'Tran The Tuong',
'20020116',1,'DaNang',5000)
insert KhachHang (MaKH,Ten,Ngaysinh,gioitinh,diachi,tienluong)values( 12,N'Tran The Tuong',
'20020116',1,'DaNang',10000)

insert KhachHang (MaKH,Ten,Ngaysinh,gioitinh,diachi,tienluong)values( 13,N'Hồ Phương Thảo',
'20030909',0,'DaNang',20000)
insert KhachHang (MaKH,Ten,Ngaysinh,gioitinh,diachi,tienluong)values( 14,N'Ho Phuong Thao',
'20030909',0,'DaNang',5000)
insert KhachHang (MaKH,Ten,Ngaysinh,gioitinh,diachi,tienluong)values( 15,N'Ho Phuong Thao',
'20030909',0,'DaNang',10000)
 
-- xóa dòng trong bảng (phải lấy 1 giá trị riêng nằm trong 1 cột để xóa dòng)
DELETE FROM KhachHang WHERE Ten=N'ho phuong thao'; 
DELETE FROM KhachHang WHERE Ten=N'Hồ Phương Thảo'; 
DELETE FROM KhachHang WHERE MaKH=12;

DELETE FROM KhachHang WHERE Ten='Tran The Tuong' and tienluong < 10000; -- dùng điều kiện
DELETE FROM KhachHang WHERE Ten='Ho Phuong Thao' and tienluong < 10000;

DELETE FROM KhachHang WHERE Ten='Tran The Tuong' and tienluong > 5000;
DELETE FROM KhachHang WHERE Ten='Ho Phuong Thao' and tienluong > 5000;

-- update dữ liệu của từng cột (thay đổi dữ liệu của từng cột)
update KhachHang set tienluong = 20000;

-- update thay đổi dữ liệu dùng điều kiện
update KhachHang set tienluong = 20000 where gioitinh = 0 and Ten= N'Hồ Phương Thảo';
update KhachHang set tienluong = 20000 where gioitinh = 1 and Ten= N'Trần Thế Tường';
go
update KhachHang set tienluong = 10000 where gioitinh = 0 and Ten=N'Ho Phuong Thao';
update KhachHang set tienluong = 10000 where gioitinh = 1 and Ten=N'Tran The Tuong';
go
update KhachHang set diachi = 'DaNang' where MaKH = 10 and Ten= N'Trần Thế Tường';
update KhachHang set diachi = 'DaNang' where MaKH = 13 and Ten= N'Hồ Phương Thảo';
go
update KhachHang set diachi = 'DakLak' where MaKH = 12 and Ten= N'Tran The Tuong';
update KhachHang set diachi = 'DakLak' where MaKH = 15 and Ten= N'Ho Phuong Thao';
go
update KhachHang set Ngaysinh = GETDATE() where gioitinh = 1 and Ten= N'Tran The Tuong';
update KhachHang set Ngaysinh = GETDATE() where gioitinh = 0 and Ten= N'Ho Phuong Thao';

-- update dữ liệu vào cột SoTien
update KhachHang set SoTien = 1000000000 where gioitinh = 0 and Ten= N'Hồ Phương Thảo';
update KhachHang set SoTien = 1000000000 where gioitinh = 1 and Ten= N'Trần Thế Tường';
go
update KhachHang set SoTien = 0 where gioitinh = 0 and Ten=N'Ho Phuong Thao';
update KhachHang set SoTien = 0 where gioitinh = 1 and Ten=N'Tran The Tuong';
go
--xóa cột trong bảng 
alter table KhachHang 
drop COLUMN tienluong

alter table KhachHang add SoTien float      --thêm cột SoTien vào bảng
-- xóa toàn bộ dữ liệu các cột trong bảng khách hàng 
DELETE FROM KhachHang;
-- truy vấn dữ liệu của toàn bộ bảng KhachHang
select * from KhachHang 


























































































































