create database ThucTap;

create table Khoa (
	makhoa char(10) primary key,
	tenkhoa char(30),
	dienthoai char(10)
)

create table GiangVien (
	magv int primary key,
	hotengv char(30),
	luong decimal(5,2),
	makhoa char(10),
	foreign key (makhoa) references Khoa
)

create table SinhVien (
	masv int primary key,
	hotensv char(30),
	makhoa char(10),
	namsinh int, 
	quequan char(30)
	foreign key (makhoa) references Khoa
)

create table DeTai (
	madt char(10) primary key, 
	tendt char(30),
	kinhphi int,
	NoiThucTap char(30)
)

create table HuongDan (
	masv int, 
	madt char(10),
	magv int, 
	ketqua decimal(5,2),
	primary key(masv,madt,magv),
	foreign key (masv) references SinhVien,
	foreign key (madt) references DeTai,
	foreign key (magv) references GiangVien
)
INSERT INTO Khoa VALUES
('Geo','Dia ly va QLTN',3855413),
('Math','Toan',3855411),
('Bio','Cong nghe Sinh hoc',3855412);

INSERT INTO GiangVien VALUES
(11,'Thanh Xuan',700,'Geo'),
(12,'Thu Minh',500,'Math'),
(13,'Chu Tuan',650,'Geo'),
(14,'Le Thi Lan',500,'Bio'),
(15,'Tran Xoay',900,'Math');

INSERT INTO SinhVien VALUES
(1,'Le Van Sao','Bio',1990,'Nghe An'),
(2,'Nguyen Thi My','Geo',1990,'Thanh Hoa'),
(3,'Bui Xuan Duc','Math',1992,'Ha Noi'),
(4,'Nguyen Van Tung','Bio',null,'Ha Tinh'),
(5,'Le Khanh Linh','Bio',1989,'Ha Nam'),
(6,'Tran Khac Trong','Geo',1991,'Thanh Hoa'),
(7,'Le Thi Van','Math',null,'null'),
(8,'Hoang Van Duc','Bio',1992,'Nghe An');

INSERT INTO DeTai VALUES
('Dt01','GIS',100,'Nghe An'),
('Dt02','ARC GIS',500,'Nam Dinh'),
('Dt03','Spatial DB',100, 'Ha Tinh'),
('Dt04','MAP',300,'Quang Binh' );

INSERT INTO HuongDan VALUES
(1,'Dt01',13,8),
(2,'Dt03',14,0),
(3,'Dt03',12,10),
(5,'Dt04',14,7),
(6,'Dt01',13,Null),
(7,'Dt04',11,10),
(8,'Dt03',15,6);


--Cau 1:
select madt,tendt
from DeTai 
where 2<( select count(masv) from HuongDan where HuongDan.madt=DeTai.madt)
go
--Cau 2:
select madt, tendt
from DeTai
where kinhphi = ( select max(kinhphi)
				from DeTai)
go
--Cau 3:
select tenkhoa, COUNT(masv) 
from Khoa join SinhVien on Khoa.makhoa =SinhVien.makhoa
group by Khoa.tenkhoa;
go