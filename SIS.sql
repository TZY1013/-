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
--登陆表
create table UserInfo
(
	ID int primary key identity(1,1),--编号
	Name varchar(20) not null,--登录名
	PassWrod varchar(20) not null,--密码
	spiceID int default(1) check(spiceID=1 or spiceID=2)--1员工2管理员
)

if exists(select * from sys.tables where name='bumen')
drop table bumen
go
--部门表
create table bumen
(
	bID int primary key identity(1,1),--部门编号
	bName varchar(20) not null--部门名称
)

if exists(select * from sys.tables where name='xuelibiao')
drop table xuelibiao
go
--学历表
create table xuelibiao
(
	xID int primary key identity(1,1),--学历编号
	xName varchar(20) not null,--学历名称
	
)

if exists(select * from sys.tables where name='ShoopInfo')
drop table ShoopInfo
go
--员工信息表
create table ShoopInfo
(
	ShoopID int primary key identity(1001,1),--员工编号
	age int not null,--年龄
	Shoopzhiwei varchar(20) not null,--职位
	Price float not null,--工资
	xID int references xuelibiao(xID),--学历编号
	bID int references bumen(bID),--部门编号
	ID int references UserInfo(ID)--编号
)

insert into xuelibiao values('硕士')
insert into xuelibiao values('本科')
insert into xuelibiao values('大专')

insert into UserInfo values('张三','123456','1')
insert into UserInfo values('李四','123456','1')
insert into UserInfo values('王五','123456','1')
insert into UserInfo values('见一','123456','1')
insert into UserInfo values('admin','admin','2')

insert into bumen values('测试部')
insert into bumen values('开发部')
insert into bumen values('运维部')

insert into ShoopInfo values('22','开发工程师','10000','2','2','1')
insert into ShoopInfo values('22','测试员','2000','1','1','2')
insert into ShoopInfo values('22','高级工程师','50000','3','3','3')


select * from ShoopInfo,UserInfo,bumen,xuelibiao where ShoopInfo.ID=UserInfo.ID and bumen.bID=ShoopInfo.bID and xuelibiao.xID=ShoopInfo.xID

