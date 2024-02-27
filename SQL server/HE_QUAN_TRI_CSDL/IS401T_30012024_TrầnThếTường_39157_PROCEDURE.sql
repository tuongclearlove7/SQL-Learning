--cau 1
create PROCEDURE HIENTHIDANHSACHNHANVIENTHUOCCHUCVU
@tencv nvarchar(255),
@hscv int
AS
BEGIN
    SELECT * from nhanvien, chucvu
	WHERE nhanvien.macv = chucvu.macv and
	chucvu.tencv = @tencv and hscv >= @hscv
END

exec HIENTHIDANHSACHNHANVIENTHUOCCHUCVU @tencv = N'GD', @hscv = 18

-- cau 2
create PROCEDURE THONGKESONHANVIENNAMNU
AS
BEGIN
    SELECT nhanvien.mapb, COUNT(*) as SONHANVIENNAM
	FROM nhanvien, phongban
	WHERE nhanvien.mapb = phongban.mapb and
	phai = 1
	group by nhanvien.mapb
	SELECT nhanvien.mapb, COUNT(*) as SONHANVIENNU
	FROM nhanvien, phongban
	WHERE nhanvien.mapb = phongban.mapb and
	phai = 0
	group by nhanvien.mapb
END

exec THONGKESONHANVIENNAMNU

--cau 3
create PROCEDURE THONGKESONHANVIENTHEOHSL
@hsl int
AS
BEGIN
    SELECT COUNT(*) as SONHANVIEN from nhanvien, hesoluong
	WHERE nhanvien.manv = hesoluong.manv and
	hsl >= @hsl
END

exec THONGKESONHANVIENTHEOHSL @hsl = 4

-- cau 4
create proc CAPNHATHSCV
as
begin 
	begin try
		update chucvu 
		set hscv = hscv + 12
		from chucvu
		where tencv in (N'GD', N'PGD')
	end try
	begin catch
		print N'Lỗi' + ERROR_MESSAGE()
	end catch
end 

exec CAPNHATHSCV

-- cau 5
create proc CAPNHATHSL
as
begin 
	begin try
		update hesoluong 
		set hsl = hsl + 0.5
		from nhanvien, hesoluong
		where nhanvien.manv = hesoluong.manv and
		nhanvien.phai = 0
	end try
	begin catch
		print N'Lỗi' + ERROR_MESSAGE()
	end catch
end 

exec CAPNHATHSL

--cau 6
create PROCEDURE HIENTHIDANHSACHNHANVIENCONGAYSINHTHEOTHANG
@thang int
AS
BEGIN
    SELECT * from nhanvien
	WHERE MONTH(ngaysinh) = @thang
END

exec HIENTHIDANHSACHNHANVIENCONGAYSINHTHEOTHANG @thang = 11

select * from phongban
select * from nhanvien
select * from chucvu
select * from hesoluong

