--Họ tên: Trần Thế Tường
--mssv: 39157
--Lớp IS401T
-- ngày 26-01-2024
--cau 1
create proc DANHSACH_HOADON
	@mahd varchar(20) = null,
	@loai nvarchar(20) = null
as
begin
	select mahd, ngayhd, ngaygh from hoadon
	where mahd = @mahd and loaihd = @loai
end

exec DANHSACH_HOADON 'hd01', N'Mua'

--cau 2
create proc DANHSACH_HOADON_THEOTHANG
	@thang_hd int,
	@thang_gh int
as
begin
	select makh, mahd, ngayhd, ngaygh from hoadon
	where MONTH(ngayhd) = @thang_hd and MONTH(ngaygh) = @thang_gh
end

exec DANHSACH_HOADON_THEOTHANG @thang_hd = 7,@thang_gh = 7

--cau 3
create proc SOLUONGHOADONCUAKHACHHANG
	@makh varchar(20) = null
as
begin
	declare @sohoadon int
	select @sohoadon =  count(*)from hoadon
	where makh = @makh
	print N'Số hóa đơn: ' + str(@sohoadon)
end
exec SOLUONGHOADONCUAKHACHHANG 'kh01'

-- cau 4
proc CAPNHAT_SLTON
	@soluongton int
as
begin 
	begin try
		update dmhang 
		set slton = slton + @soluongton
		where mahang = 'mh01'
	end try
	begin catch
		print N'Lỗi' + ERROR_MESSAGE()
	end catch
end 

exec CAPNHAT_SLTON @soluongton = 10

-- cau 5
alter proc CAPNHATBATKY_SLTON
	@soluongton int,
	@mahang varchar(20)
as
begin 
	begin try
		update dmhang 
		set slton = @soluongton
		where mahang = @mahang
	end try
	begin catch
		print N'Lỗi' + ERROR_MESSAGE()
	end catch
end 

exec CAPNHATBATKY_SLTON @soluongton = 10, @mahang = 'mh02'


select * from khachhang
select * from hoadon
select * from dmhang
select * from chitiet
