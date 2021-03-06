--建立商品类别表
create table Category(
--自动增长，从1开始，主键
Cid int primary key identity(1,1),--类型名称，不能为空且不能重复Cname nvarchar(10) not null unique,--类别描述，可以为空Description nvarchar(20) null
)
--商品信息表（Ware）
create table Ware(
--商品的编号（即条形码），主键
Wid int primary key identity(1,1),--商品名称，必填且不能重复Wname nvarchar(20) not null unique,--商品所属的类别（外键），必填Cid int not null foreign key references Category(cid),
--商品进价，必须大于0
PurchasePrice decimal(10,2) not null,--商品售价，必须大于0SalesPrice decimal(10,2) not null,--商品库存量，必须大于0Amount decimal(10,2) not null
)
--员工表（Employee）
create table Employee(
--员工编号，主键，自动增长，从1001开始
Eid int primary key identity(1001,1),
--员工姓名，必填
Ename nvarchar(10) not null,
--员工密码，不少于六位
Epassword varchar(10) check(len(Epassword)>6),--备注，可不填Remark nvarchar(20) not null
)
--销售记录表（SalesInfo）
create table SalesInfo(
--主键，自动增长，从1开始
Sid int primary key identity(1,1),
--所销售的商品的编号（外键），必填
Wid int foreign key references ware(Wid),
--商品销售的时间，必填
SalesDate datetime not null,
--商品销售的数量，必填且必须大于0
SalesAmount int not null default 1,
--收银员的编号（外键），必填
Eid int not null foreign key references Employee(Eid)
)
select*from Category
select*from ware
select*from Employee
select*from SalesInfo