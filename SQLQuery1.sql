if exists(select * from sys.databases where name='SIS')
drop database SIS
go
create database SIS
go
use SIS
go
if exists(select * from sys.tables where name='UserInfo')
drop table UserInfo
go
create table UserInfo
(
	ID int primary key identity(1,1),
	Name varchar(20) not null,
	PassWrod varchar(20) not null,
	spice int default(1) check(spice=1 or spice=2)
)

if exists(select * from sys.tables where name='ShoopInfo')
drop table ShoopInfo
go
create table ShoopInfo
(
	ShoopID int primary key identity(1,1), --��ƷID
	ShoopName varchar(20) not null,
	Shoopjifen int not null,
	Price float not null,
	Much int not null,
	ShoopTime datetime not null,
	ID int references UserInfo(ID)
)

insert into UserInfo values('����','123456','1')
insert into UserInfo values('����','123456','1')
insert into UserInfo values('admin','admin','2')

insert into ShoopInfo values('����','1','2','20','2019-12-09','1')
insert into ShoopInfo values('�Ͳ�','2','3','20','2019-12-09','1')
insert into ShoopInfo values('����','1','1','10','2019-12-09','1')
insert into ShoopInfo values('ʳ����','5','20','5','2019-12-09','1')

select * from UserInfo

select * from ShoopInfo