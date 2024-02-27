create database QUANLYCHOTHUEXE

create table dmxe(

	maxe varchar(20) primary key,
	tenxe varchar(255),
	hangxe varchar(255),
	slxe int
)
go
create table hdthue(

	mahd varchar(20) primary key,
	maxe varchar(20),
	slxethue int
)

ALTER TABLE hdthue
ADD CONSTRAINT hdthue_Fk_dmxe
    FOREIGN KEY (maxe) REFERENCES dmxe(maxe);


-- cau 1
CREATE TRIGGER capnhatSLXeThueLa1
ON hdthue
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;
    UPDATE dmxe
    SET slxe = slxe - thue.slxethue
    FROM dmxe, inserted thue
    WHERE dmxe.maxe = thue.maxe AND 
	thue.maxe = 'mx01' AND 
	thue.slxethue = 1
END;

INSERT INTO hdthue (mahd, maxe, slxethue)
VALUES ('hd01', 'mx01', 1);

-- cau 2
CREATE TRIGGER capnhatSLXeThueLa3
ON hdthue
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;
    UPDATE dmxe
    SET slxe = slxe - thue.slxethue
    FROM dmxe, inserted thue
    WHERE dmxe.maxe = thue.maxe AND 
	thue.maxe = 'mx02' AND 
	thue.slxethue = 3
END

INSERT INTO hdthue (mahd, maxe, slxethue)
VALUES ('hd02', 'mx02', 3);

-- cau 3
CREATE TRIGGER HuyDonMuaXEHD01
ON hdthue
AFTER DELETE
AS
BEGIN
    SET NOCOUNT ON;
    UPDATE dmxe
    SET slxe = slxe + huy.slxethue
    FROM dmxe, deleted huy
    WHERE dmxe.maxe = huy.maxe AND huy.mahd = 'hd01';
END;

delete from hdthue where mahd = 'hd01';

-- cau 4
CREATE TRIGGER thueThem2Xe
ON hdthue
AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;
    IF UPDATE(slxethue) 
    BEGIN
        UPDATE hdthue
        SET slxethue = slxethue + 2
        WHERE mahd IN (SELECT mahd FROM inserted);
        UPDATE dmxe
        SET slxe = slxe - 2
        WHERE maxe IN (SELECT maxe FROM inserted);
    END
END;

update hdthue  set slxethue = slxethue + 2;

-- cau 5
CREATE TRIGGER thueThem1Xe
ON hdthue
AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;
    IF CONTEXT_INFO() = 0x01
    BEGIN
        RETURN;
    END
    IF UPDATE(slxethue) OR UPDATE(mahd)
    BEGIN
        SET CONTEXT_INFO 0x01;
        UPDATE hdthue
        SET slxethue = slxethue + 1
        WHERE mahd = 'hd02' AND maxe = 'mx02';
        SET CONTEXT_INFO 0x00;
    END
END;

UPDATE hdthue
SET slxethue = slxethue + 1
WHERE mahd = 'hd02' AND maxe = 'mx02';

drop trigger thueThem1Xe

select * from dmxe
select * from hdthue


