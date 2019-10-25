-- Question 1: Tạo table với các ràng buộc và kiểu dữ liệu

-- Create Database

 DROP DATABASE IF EXISTS 		Restaurant;
 
 CREATE DATABASE IF NOT EXISTS	Restaurant ;
 
 -- use Restaurant;
 USE 				            Restaurant ;
 -- -- Drop table if exists
 
 DROP TABLE IF EXISTS Employee_Table;
 DROP TABLE IF EXISTS Department;
 DROP TABLE IF EXISTS Employee_Skill_Table;
 
 -- create table

 USE 			    Restaurant ;
 
 CREATE TABLE 		Department (
					Department_Number   INT AUTO_INCREMENT PRIMARY KEY,
					Department_Name     VARCHAR(50) NOT NULL
 );
 
 USE 			    Restaurant ;
 
 CREATE TABLE		Employee_Table (
					Employee_Number   	INT AUTO_INCREMENT PRIMARY KEY,
					Employee_Name 		VARCHAR(50) NOT NULL,
                    Department_Number 	TINYINT NOT NULL,
					FOREIGN KEY (Department_Number) REFERENCES Department(Department_Number)
);

 USE 			    Restaurant ;
 
 CREATE TABLE 		Employee_Skill_Table (
					Skill_Code   		VARCHAR(50),
					Date_Registered   	DATE NOT NULL,
                    Employee_Number 	INT NOT NULL,
					FOREIGN KEY (Employee_Number) REFERENCES Employee_Table(Employee_Number)
 );
 
 -- Question 2: Thêm ít nhất 10 bản ghi vào table
 
 USE  Restaurant;  
 
 INSERT INTO Department (Department_Name)
 VALUE	('NH1'),
		('NH2'),
        ('NH3'),
        ('NH4'),
        ('NH5'),
        ('NH6'),
        ('NH7'),
        ('NH8'),
        ('NH9'),
        ('NH10');

        
INSERT INTO Employee_Table(Employee_Name,Department_Number)
VALUE 	('A',1),
		('B',2),
        ('B',3),
        ('D',4),
        ('E',5),
        ('F',6),
        ('G',7),
        ('H',8),
        ('I',9),
        ('K',10);

INSERT INTO Employee_Skill_Table(Skill_Code, Date_Registered,Employee_Number)
VALUE 	('C',			'2000-03-05',1),
		('JAVA'	,		'2000-03-05',2),
        ('PYTHON',		'2000-05-05',3),
        ('C#',			'2000-03-05',4),
        ('JAVA',		'2000-03-05',5),
        ('HTML',		'2000-03-05',6),
        ('PYTHON',		'2000-05-05',7),
        ('C#',			'2000-03-05',8),
        ('JAVA',		'2000-03-05',9),
        ('HTML',		'2000-03-05',10);
        
 -- Question 3: Viết lệnh để lấy ra danh sách nhân viên (name) có skill Java
 
 USE 		Restaurant;
 
SELECT 		ETB.Employee_Name , EmS.Skill_Code
FROM 		Employee_Table AS ETB
INNER JOIN 	Employee_Skill_Table AS EmS
ON		ETB.Employee_Number = EmS.Employee_Number WHERE EmS.Skill_Code = 'JAVA';
 
 -- Question 4: Viết lệnh để lấy ra danh sách các phòng ban có > 3 nhân viên
 
 USE             Restaurant;
 
 SELECT          DT.Department_Number, DT.Department_Name, COUNT( DT.Department_Number ) AS Amount
 FROM            Department AS DT
 INNER JOIN      Employee_Table AS ETB
 ON              DT.Department_Number = ETB.Department_Number
 GROUP BY        DT.Department_Number
 Having          COUNT( DT.Department_Number  > 3 );
 
 -- Question 5: Viết lệnh để lấy ra danh sách nhân viên của mỗi văn phòng ban.  
 USE            Restaurant;
 
SELECT 			DT.Department_Number, DT.Department_Name, ETB.Employee_Name
FROM   			Department AS DT
INNER JOIN 		Employee_Table AS ETB
ON 				DT.Department_Number = ETB.Department_Number
GROUP BY 		ETB.Employee_Name , Department_Name;

 
 -- Question 6: Viết lệnh để lấy ra danh sách nhân viên có > 1 skills
 
USE 				Restaurant;
  
SELECT 				ETB.Employee_Name , EmS.Skill_Code
FROM 				Employee_Table AS ETB
INNER JOIN 			Employee_Skill_Table AS EmS
ON		     		ETB.Employee_Number = EmS.Employee_Number
GROUP BY			Skill_Code
HAVING 				COUNT(Skill_Code = 'JAVA') > 1;
