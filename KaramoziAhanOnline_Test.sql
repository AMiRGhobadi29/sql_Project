--Use master

--Create DataBase Db_Company

Use Db_Company

--Create Table T_Sales(
--	SalesId Tinyint Primary Key identity(1,1),
--	OrderId TinyInt NOT NULL,
--	Customer varchar(10) NOT NULL,
--	Product varchar(10) NOT NULL,
--	--Date DateTime Default(GETDATE()) NULL,
--	Date TinyInt NOT NULL,
--	Quantity TinyInt NOT NULL,
--	UnitPrice int NOT NULL
--)
--Go
--Create Table T_SaleProfit(
--	Product varchar(10) NOT NULL,
--	ProfitRatio TinyInt NOT NULL
--)
--Go
--Insert Into T_Sales([OrderId],[Customer],[Product],[Date],[Quantity],[UnitPrice])
--Values
--(1,'C1','P1',1,2,100),
--(1,'C1','P2',1,4,150),
--(2,'C2','P2',1,5,150),
--(3,'C3','P4',1,3,550),
--(4,'C4','P3',1,1,300),
--(4,'C4','P6',1,6,150),
--(4,'C4','P4',1,6,550),
--(5,'C5','P2',1,3,150),
--(5,'C5','P1',1,6,100),
--(6,'C1','P6',1,3,150),
--(6,'C1','P3',1,2,300),
--(7,'C3','P5',1,4,400),
--(7,'C3','P1',1,6,100),
--(7,'C3','P3',1,1,300),
--(8,'C5','P2',1,3,150),
--(8,'C5','P5',1,4,400),
--(8,'C5','P1',1,2,100),
--(9,'C2','P3',2,1,300),
--(9,'C2','P4',2,3,550),
--(9,'C2','P5',2,6,400),
--(9,'C2','P1',2,4,100),
--(10,'C4','P6',2,3,150),
--(11,'C6','P3',2,2,300),
--(11,'C6','P4',2,3,550),
--(12,'C7','P1',2,5,100),
--(12,'C7','P2',2,3,150),
--(12,'C7','P3',2,1,300),
--(13,'C2','P3',2,2,300),
--(13,'C2','P1',2,4,100),
--(14,'C6','P2',2,6,150),
--(15,'C4','P6',2,1,150),
--(16,'C1','P4',3,6,550),
--(17,'C2','P5',3,3,400),
--(18,'C8','P1',3,6,100),
--(18,'C8','P3',3,3,300),
--(18,'C8','P5',3,5,400),
--(19,'C9','P2',3,2,150),
--(20,'C2','P3',3,3,300),
--(20,'C2','P1',3,4,100),
--(20,'C2','P2',3,1,150)

--Insert Into T_SaleProfit([Product],[ProfitRatio])
--Values
--('P1',5),
--('P2',25),
--('P3',10),
--('P4',20),
--('P5',10),
--('P6',10)

-- مسئله شماره ۱
Select SUM(Quantity * UnitPrice) as N'کل فروش شرکت' From T_Sales

-- مسئله شماره۲
Select COUNT(Distinct Customer) as N'تعداد مشتریان متمایز' From T_Sales


--مسئله شماره۳
Select Product as N'محصول',SUM(Quantity) as N'تعداد محصول فروخته شده' From T_Sales
Group By Product




-- مسئله شماره۴
Select Customer As N'مشتری',SUM(Quantity) As N'تعدا آیتم خریداری شده' ,COUNT(OrderId) as N'تعداد فاکتور', 
SUM(UnitPrice * Quantity) As N'مجموع خرید' From(
	Select OrderId,Customer,UnitPrice , Quantity
	From T_Sales
	Group By Customer, OrderId,UnitPrice,Quantity
	Having SUM(UnitPrice * Quantity)>1500

)T_Sales
Group By Customer



-- مسئله۵
Select T_Sales.Product,
SUM(T_Sales.UnitPrice)*T_SaleProfit.ProfitRatio As N'سود هر محصول'
From T_Sales,T_SaleProfit
Where T_Sales.Product=T_SaleProfit.Product
Group By T_Sales.Product,T_Sales.UnitPrice,T_SaleProfit.ProfitRatio



-- مسئله شماره۶
Select Count(Customer) As N'کل مشتریان خریدار' From 
(
	Select Distinct Customer,Date From T_Sales
	Group By Date,Customer
)
T_Sales









Create Table T_ChartSazman(
	Id TinyInt Primary Key Identity(1,1),
	Name varchar(20) NOT NULL,
	Manager varchar(20) NULL,
	ManagerId TinyInt NULL
)

--Insert Into T_ChartSazman([Name],[Manager],[ManagerId])
--Values
--('Ken',NULL,NULL),
--('Hugo',NULL,NULL),
--('James','Carol',5),
--('Mark','Morgan',13),
--('Carol','Alex',12),
--('David','Rose',21),
--('Michael','Markos',11),
--('Brad','Alex',12),
--('Rob','Matt',15),
--('Dylan','Alex',12),
--('Markos','Carol',5),
--('Alex','Ken',1),
--('Morgan','Matt',15),
--('Jennifer','Morgan',13),
--('Matt','Hugo',2),
--('Tom','Brad',8),
--('Oliver','Dylan',10),
--('Daniel','Rob',9),
--('Amanda','Markos',11),
--('Ana','Dylan',10),
--('Rose','Rob',9),
--('Robert','Rob',9),
--('Fill','Morgan',9),
--('Antoan','David',6),
--('Eddie','Mark',4)

-- مسئله شماره ۷
Select Name,ManagerId,Manager From T_ChartSazman
Group By ManagerId,Name,Manager