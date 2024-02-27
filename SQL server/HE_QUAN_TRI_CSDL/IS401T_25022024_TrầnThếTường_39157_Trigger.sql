
-- cau 1
CREATE TABLE tamung (
    matu INT PRIMARY KEY,
    manv VARCHAR(20),
    TONGTIEN DECIMAL(10, 2),
);

INSERT INTO TAMUNG (MATU, MANV, TONGTIEN) VALUES
(1, 'nv01', 500000.00),
(2, 'nv02', 700000.00),
(3, 'nv03', 600000.00),
(4, 'nv04', 800000.00),
(5, 'nv05', 900000.00),
(6, 'nv06', 750000.00),
(7, 'nv07', 600000.00),
(8, 'nv08', 850000.00),
(9, 'nv09', 700000.00),
(10, 'nv10', 750000.00);

-- cau 2
CREATE TABLE ct_tamung (
    stt INT PRIMARY KEY,
    ngaythang DATE,
    manv VARCHAR(20),
    matu INT,
    sotien DECIMAL(10, 2),
   
);
--cau 3
ALTER TRIGGER TAMUNG_SOTIEN1
ON ct_tamung
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;
    UPDATE tamung
    SET tongtien = tongtien - tam.sotien
    FROM tamung, inserted tam
    WHERE tamung.manv = tam.manv
END;

--cau 4
INSERT INTO ct_tamung(stt, ngaythang, manv, matu, sotien)
VALUES (1, '2024-02-25', 'nv01', 1, 100000.00);

-- cau 5
ALTER TRIGGER NHANVIEN_HUYKHONGTAMUNGNUA1
ON ct_tamung
AFTER DELETE
AS
BEGIN
    SET NOCOUNT ON;
    UPDATE tamung
    SET tongtien = tongtien + huytu.sotien
    FROM tamung, deleted huytu
    WHERE tamung.manv = huytu.manv AND huytu.manv= 'nv01';
END;

delete from ct_tamung where manv = 'nv01';

-- cau 6
alter TRIGGER UNGTHEM_SOVOIBANDAU1
ON ct_tamung
AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;
    IF UPDATE(sotien) 
    BEGIN
		DECLARE @tien decimal(10,2)
        UPDATE ct_tamung
        SET sotien = sotien + 100000.00
        WHERE manv = 'nv01'
        UPDATE tamung
        SET tongtien= tongtien - 100000.00
        WHERE manv IN ('nv01');
    END
END;

update ct_tamung  set sotien = sotien where manv = 'nv01';

-- cau 7
CREATE TRIGGER KIEMSOATUNGTIEN1
ON ct_tamung
AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;
    IF UPDATE(sotien) 
    BEGIN
        DECLARE @tien DECIMAL(10,2);
        DECLARE @maxTongTien DECIMAL(10,2);
        SELECT TOP 1 @tien = tam.sotien
        FROM inserted tam
        WHERE tam.manv = 'nv01'
        ORDER BY tam.sotien;
        SELECT TOP 1 @maxTongTien = tongtien
        FROM tamung
        WHERE manv = 'nv01'
        ORDER BY tongtien DESC;
        BEGIN TRY
            IF @tien IS NOT NULL AND @tien > @maxTongTien
            BEGIN
                PRINT N'Không đủ tiền!';
            END
            ELSE
            BEGIN
                UPDATE ct_tamung
                SET sotien = sotien + @tien
                WHERE manv = 'nv01';

                UPDATE tamung
                SET tongtien = tongtien - @tien
                WHERE manv = 'nv01';
            END
        END TRY
        BEGIN CATCH
            PRINT N'Xử lý lỗi ở đây nếu có';
        END CATCH
    END
END

UPDATE ct_tamung SET sotien = sotien + 20000000.00 WHERE manv = 'nv01';

select * from tamung
select * from ct_tamung

drop trigger KIEMSOATUNGTIEN1