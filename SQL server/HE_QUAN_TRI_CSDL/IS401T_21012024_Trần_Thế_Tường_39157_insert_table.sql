


INSERT INTO phongban(mapb, tenpb)
VALUES('pb01', N'Phòng kế toán'),
('pb02', N'Phòng marketing'),
('pb03', N'Phòng công nghệ thông tin'),
('pb04', N'Phòng nhân sự'),
('pb05', N'Phòng dịch vụ');

INSERT INTO phongban(mapb, tenpb)
VALUES('pb01', N'Phòng kế toán'),
('pb02', N'Phòng marketing'),
('pb03', N'Phòng công nghệ thông tin'),
('pb04', N'Phòng nhân sự'),
('pb05', N'Phòng dịch vụ');

INSERT INTO nhanvien (manv, hoten, ngaysinh, phai, quequan, sodt, mapb) VALUES
('nv01', N'Trần Thế Tường', '1990-01-01', 1, 'Da Nang', '123456789', 'pb01'),
('nv02', N'Nguyễn Ngọc Khánh', '1992-05-15', 0, 'Da Nang', '987654321', 'pb02'),
('nv03', N'Nguyễn Thị Cúc', '1988-11-20', 1, 'Dak Lak', '555555555', 'pb01'),
('nv04', N'Trần Thị Mai', '1995-03-10', 1, 'Da Nang', '777777777', 'pb03'),
('nv05', N'Trần Vinh Quang', '1998-07-02', 0, 'Dak Lak', '888888888', 'pb05'),
('nv06', N'Hồ Phương Thảo', '1993-09-25', 1, 'Da Nang', '444444444', 'pb04'),
('nv07', N'Hồ Nhật Anh', '1996-12-30', 0, 'Da Nang', '666666666', 'pb04'),
('nv08', N'Trần Lê Đức Nhật Anh', '1991-04-05', 1, 'Da Nang', '999999999', 'pb02'),
('nv09', N'Nguyễn Văn Phát', '1987-08-15', 1, 'TP HCM', '111111111', 'pb05'),
('nv10', N'Nguyễn Thu Phương', '1994-06-18', 0, 'Binh Dinh', '222222222', 'pb04');

INSERT INTO chucvu(macv, tencv, hscv, manv) VALUES
('cv01', N'Chức vụ 1', 1.5, 'nv01'),
('cv02', N'Chức vụ 2', 2.0, 'nv02'),
('cv03', N'Chức vụ 3', 1.8, 'nv03'),
('cv04', N'Chức vụ 4', 1.7, 'nv04'),
('cv05', N'Chức vụ 5', 2.2, 'nv05');

INSERT INTO hesoluong (thang, hsl, manv) VALUES
(1, 1.2, 'nv01'),
(1, 1.0, 'nv02'),
(1, 1.5, 'nv03'),
(2, 1.8, 'nv04'),
(2, 1.3, 'nv05'),
(2, 1.7, 'nv06'),
(3, 2.0, 'nv07'),
(3, 1.5, 'nv08'),
(3, 1.9, 'nv09'),
(4, 1.6, 'nv10'),
(4, 1.4, 'nv01'),
(4, 1.1, 'nv02'),
(5, 1.3, 'nv03'),
(5, 1.7, 'nv04'),
(5, 1.5, 'nv05');


INSERT INTO TAMUNG (MATU, MANV, TONGTIEN) VALUES
(1, 'nv01', 500000.00),
(2, 'nv02', 700000.00),
(3, 'nv03', 600000.00),
(4, 'nv04', 800000.00),
(5, 'nv04', 900000.00),
(6, 'nv05', 750000.00),
(7, 'nv05', 600000.00),
(8, 'nv02', 850000.00),
(9, 'nv03', 700000.00),
(10, 'nv01', 750000.00);

select * from nhanvien, phongban, chucvu, hesoluong
where phongban.mapb = nhanvien.mapb and
nhanvien.manv = chucvu.manv and
nhanvien.manv = hesoluong.manv


