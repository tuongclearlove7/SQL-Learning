create proc SOMATHANG_HOADON
@mahd varchar(20) = null
as
begin
	declare @somathang int
	select @somathang = COUNT(*)
	from chitiet
	where mahd = @mahd
	print N'Số mặt hàng: ' + str(@somathang)
end

exec SOMATHANG_HOADON @mahd='hd01'

alter proc TANG_GIA
	@phantram int,
	@mahang varchar(20)
as
begin 
	begin try
		declare @Type decimal(3,1) = 1 + @phantram / 100.0
		update chitiet 
		set dongia = dongia * @Type 
		where mahang = @mahang
	end try
	begin catch
		print N'Lỗi' + ERROR_MESSAGE()
	end catch
end 

exec TANG_GIA @phantram = 20, @mahang = 'mh01'

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


select * from khachhang
select * from hoadon
select * from dmhang
select * from chitiet
