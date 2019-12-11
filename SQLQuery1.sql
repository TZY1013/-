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
create table UserInfo--�û���Ϣ��
(
	ID int primary key identity(1,1),
	Name varchar(20) not null,
	PassWrod varchar(20) not null,
	spiceID int default(1) check(spiceID=1 or spiceID=2)--1Ա��2����Ա
)

if exists(select * from sys.tables where name='bumen')
drop table bumen
go
create table bumen
(
	bID int primary key identity(1,1),
	bName varchar(20) not null
)

if exists(select * from sys.tables where name='xuelibiao')
drop table xuelibiao
go
create table xuelibiao
(
	xID int primary key identity(1,1),
	xName varchar(20) not null
)

if exists(select * from sys.tables where name='ShoopInfo')
drop table ShoopInfo
go
create table ShoopInfo--Ա����Ϣ��
(
	ShoopID int primary key identity(1001,1),
	age int not null,
	Shoopzhiwei varchar(20) not null,
	Price float not null,
	xID int references xuelibiao(xID),
	bID int references bumen(bID),
	ID int references UserInfo(ID)
)

insert into xuelibiao values('˶ʿ')
insert into xuelibiao values('����')
insert into xuelibiao values('��ר')

insert into UserInfo values('����','123456','1')
insert into UserInfo values('����','123456','1')
insert into UserInfo values('����','123456','1')
insert into UserInfo values('��һ','123456','1')
insert into UserInfo values('admin','admin','2')

insert into bumen values('���Բ�')
insert into bumen values('������')
insert into bumen values('��ά��')

insert into ShoopInfo values('22','��������ʦ','10000','2','2','1')
insert into ShoopInfo values('22','����Ա','2000','1','1','2')
insert into ShoopInfo values('22','�߼�����ʦ','50000','3','3','3')


select * from ShoopInfo,UserInfo,bumen,xuelibiao where ShoopInfo.ID=UserInfo.ID and bumen.bID=ShoopInfo.bID and xuelibiao.xID=ShoopInfo.xID