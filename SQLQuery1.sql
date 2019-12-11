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
--角色表
create table UserInfo
(
	ID int primary key identity(1,1),
	Name varchar(20) not null,
	PassWrod varchar(20) not null,
	spice int default(1) check(spice=1 or spice=2 or spice=3)
)

if exists(select * from sys.tables where name='ShoopInfo')
drop table ShoopInfo
go
--商品信息表
create table ShoopInfo
(
	ShoopID int primary key identity(1,1), --商品ID
	ShoopName varchar(20) not null,
	Shoopjifen int not null,
	Price float not null,
	Much int not null,
	ShoopTime datetime not null,
	ID int references UserInfo(ID)
)
go



insert into UserInfo values('张三','123456','1')
insert into UserInfo values('李四','123456','2')
insert into UserInfo values('admin','admin','3')

insert into ShoopInfo values('土豆','1','2','20','2019-12-09','1')
insert into ShoopInfo values('油菜','2','3','20','2019-12-09','1')
insert into ShoopInfo values('酸奶','1','1','10','2019-12-09','1')
insert into ShoopInfo values('食用油','5','20','5','2019-12-09','1')

select * from UserInfo

select * from ShoopInfo