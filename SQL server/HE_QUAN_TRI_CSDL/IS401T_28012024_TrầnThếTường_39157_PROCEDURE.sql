--cau 1
create PROCEDURE HIENTHIDANHSACHNHANVIEN
@mapb varchar(20)
AS
BEGIN
    SELECT * from phongban, nhanvien 
	where phongban.mapb = nhanvien.mapb and 
	nhanvien.mapb = @mapb
END

exec HIENTHIDANHSACHNHANVIEN @mapb = 'pb01'

--cau 2
create PROCEDURE HIENTHIDANHSACHCHUCVUCUANHANVIEN
@macv varchar(20)
AS
BEGIN
    SELECT *
	from chucvu, nhanvien 
	where chucvu.macv = nhanvien.macv and nhanvien.macv = @macv
END

exec HIENTHIDANHSACHCHUCVUCUANHANVIEN @macv = 'cv01'

-- cau 3
create PROCEDURE HIENTHITHONGTINNHANVIEN
@thang int,
@manv varchar(20)
AS
BEGIN
    SELECT phongban.mapb, tenpb, hoten, tencv, hsl, hscv, hsl*1890000 * hscv as luong 
	from nhanvien, phongban, hesoluong, chucvu
	where phongban.mapb = nhanvien.mapb and 
	chucvu.macv = nhanvien.macv and
	nhanvien.manv = hesoluong.manv and 
	hesoluong.manv = @manv and 
	hesoluong.thang = @thang
	group by phongban.mapb, tenpb, hoten, tencv, hsl, hscv
END

exec HIENTHITHONGTINNHANVIEN @thang = 1,@manv = 'nv01'

-- cau 4
create PROCEDURE SONHANVIENCUAMOIPHONGBAN
AS
BEGIN
    SELECT mapb,count(manv) as N'Số nhân viên'
	from nhanvien
	group by mapb
END

exec SONHANVIENCUAMOIPHONGBAN

-- cau 5
create proc CAPNHAT_HSCV
as
begin 
	begin try
		update chucvu 
		set hscv = hscv + 1.5
	end try
	begin catch
		print N'Lỗi' + ERROR_MESSAGE()
	end catch
end 

exec CAPNHAT_HSCV

-- cau 6
create proc CAPNHAT_HSL
	@phantram int,
	@mapb varchar(20)
as
begin 
	begin try
		declare @Type decimal(3,1) = 1 + @phantram / 100.0
		update hesoluong 
		set hsl = hsl * @Type 
		from nhanvien, hesoluong
		where nhanvien.manv = hesoluong.manv and 
		nhanvien.mapb = @mapb
	end try
	begin catch
		print N'Lỗi' + ERROR_MESSAGE()
	end catch
end 

exec CAPNHAT_HSL @phantram = 10, @mapb = 'pb01'

select * from nhanvien, hesoluong 
where nhanvien.manv = hesoluong.manv and 
nhanvien.mapb = 'pb01'

select * from phongban
select * from nhanvien
select * from chucvu
select * from hesoluong

