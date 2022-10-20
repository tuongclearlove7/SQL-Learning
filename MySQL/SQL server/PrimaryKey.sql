-- unique là duy nhất trong 1 bảng trường cột nào có từ khóa unique thì
--không thể có 2 giá trị trùng nhau
--default giá trị mặc định của trường đó nếu không gán giá trị khi insert
--unique not null tương đương với primary key

use ClientDB  
go 
--cách thêm primary key (khóa chính)
create table Userclient (
	id int unique not null ,
	Name nvarchar(100) default N'Tuongclearlove7'
)
alter table Userclient add primary key (id)--sửa cột thành khóa chính
go
--cách 2
create table Userclient2(
	id int not null,
	Name nvarchar(100) default N'Thaorose'
	primary key(id)
)
go
--cách 3
create table Userclient3(
	id int not null,
	Name nvarchar(100) default N'Thaorose'
	constraint PK_Userclient3 -- đây là tên của key để dễ xóa hơn
	primary key(id)
)
go
--cách 4
create table Userclient4(
	id int not null,
	Name nvarchar(100) default N'Thaorose'
	
)
alter table Userclient4 add constraint PK_Userclient4 primary key (id)
go
-- cách tạo trường cột có 2 khóa chính
create table Userclient5(
	id1 int not null,
	id2 int not null,
	Name nvarchar(100) default N'Thaorose'
	primary key (id1,id2)
	
)

insert into Userclient(id)values(0)
insert into Userclient(id)values(1)
insert into Userclient(id)values(2)

select * from Userclient

delete from Userclient



















