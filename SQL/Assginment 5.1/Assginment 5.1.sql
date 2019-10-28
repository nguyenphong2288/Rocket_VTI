USE adventureworks;


-- Question 1 :Question 1: Viết 1 query lấy thông tin "Name" từ bảng Production.Product có name của ProductSubcategory là 'Saddles'. 

   USE 			adventureworks;
   SELECT 		p.Name
   FROM 		product AS p
   WHERE		p.ProductSubcategoryID IN(
   SELECT 		psc.ProductSubcategoryID
   FROM 		productsubcategory AS psc
   WHERE		psc.Name = 'Saddles');

-- Question 2 : Thay đổi câu Query 1 để lấy được kết quả sau. 

   USE 			adventureworks;

   SELECT 		p.Name
   FROM 		product AS p
   WHERE		p.ProductSubcategoryID IN(
   SELECT 		psc.ProductSubcategoryID
   FROM 		productsubcategory AS psc
   WHERE		psc.Name LIKE 'Bo%');

-- Question 3 : Viết câu query trả về tất cả các sản phẩm có giá rẻ nhất (lowest ListPrice) và Touring Bike 
-- (nghĩa là ProductSubcategoryID = 3) 

   USE 			adventureworks;
   
   SELECT 		ProductID, Name, ListPrice, ProductSubcategoryID
   FROM 		adventureworks.product 
   WHERE		ProductSubcategoryID = 3
   AND  		ListPrice
   IN           (SELECT MIN(ListPrice) FROM adventureworks.product  WHERE ProductSubcategoryID = 3);

   

-- JOIN Nhiều Bảng
-- Question 1 :  Viết query lấy danh sách tên country và province được lưu  trong AdventureWorks2008sample database. 

   USE 			adventureworks;

   SELECT 		c.Name, s.Name 
   FROM 		CountryRegion c
   JOIN 		StateProvince s
   ON 			c.CountryRegionCode = s.CountryRegionCode;

 

-- Question 2 :  Tiếp tục với câu query trước và thêm điều kiện là chỉ lấy country Germany và Canada 

   USE 			adventureworks;
   
   SELECT 		c.Name as Country, s.Name as Province 
   FROM 		CountryRegion c
   JOIN 		StateProvince s
   ON 			c.CountryRegionCode = s.CountryRegionCode
   WHERE 		c.Name = 'Germany' OR c.Name = 'Canada'
   ORDER BY 	c.CountryRegionCode;

 

-- Question 3 : SalesOrderID, OrderDate and SalesPersonID. Từ bảng SalesPerson, chúng ta lấy cột BusinessEntityID (là định danh của người sales), 
-- Bonus and the SalesYTD (là đã sale được bao nhiêu người trong năm nay

   USE 				adventureworks;
    
   SELECT 			soh.SalesOrderID, soh.OrderDate, soh.SalesPersonID, sp.Bonus, sp.SalesYTD AS BusinessEntityID, sp.Bonus, sp.SalesYTD
   FROM 			SalesPerson sp
   INNER JOIN	 	SalesOrderHeader soh
   ON 				sp.SalesPersonID = soh.SalesPersonID;

-- Question 4 : Sử dụng câu query, thêm cột JobTitle and xóa cột SalesPersonID và BusinessEntityID

   USE 				adventureworks;
   
   SELECT 			soh.SalesOrderID, soh.OrderDate, e.Title AS Jobtitle, sp.Bonus, sp.SalesYTD
   FROM 			salesorderheader AS soh
   LEFT JOIN		salesperson AS sp 
   ON 				sp.SalesPersonID = soh.SalesPersonID
   INNER JOIN		employee AS e 
   ON 				e.EmployeeID = soh.SalesPersonID
   WHERE			soh.SalesPersonID = NULL AND soh.OnlineOrderFlag = 1
   UNION ALL
   SELECT 			soh.SalesOrderID, soh.OrderDate, e.Title AS Jobtitle, sp.Bonus, sp.SalesYTD
   FROM 			salesorderheader AS soh 
   RIGHT JOIN		salesperson AS sp 
   ON 				sp.SalesPersonID = soh.SalesPersonID
   INNER JOIN		employee AS e 
   ON 				e.EmployeeID = soh.SalesPersonID;
