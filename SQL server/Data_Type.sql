-- cac kieu du lieu hay su dung 
-- int 
-- float
-- char kiểu ký tự bộ nhớ cấp phát cứng (không viết đc tiếng việt)
--varchar kiểu ký tự bộ nhớ cấp phát động , varchar(10)
--nchar kiểu ký tự có thể lưu tiếng việt
--nvarchar kiểu ký tự cấp phát động có thể lưu tiếng việt 
--date lưu trữ ngày tháng năm , giờ
-- time lưu trữ giờ , phút , giây ...
--bit lưu giá trị 0 và 1
-- text lưu văn bản lớn
-- ntext lưu văn bản lớn có tiếng việt
create table test(
	MaSV char(10),
	Ngaysinh date,
	Sex BIT,
	Docs nvarchar(50),
)
go

































































































