-- creata database

DROP DATABASE IF EXISTS fresher;

CREATE DATABASE IF NOT EXISTS fresher;

-- use fresher
USE fresher;


-- create table
USE fresher;
DROP TABLE IF EXISTS Trainee;

CREATE TABLE Trainee

(
    Trainee_ID 				INT AUTO_INCREMENT PRIMARY KEY,
    Full_Name 				NVARCHAR(50) NOT NULL,
    Birth_Date 				DATE NOT NULL,
    Gender 					ENUM('male' , 'female', 'unknown') NOT NULL,
    ET_IQ                   TINYINT(30),
    ET_Gmath                TINYINT(30),
    ET_English              TINYINT(50),
    Training_Class          CHAR(15) NOT NULL,
    Evaluation_Notes        NVARCHAR(500) 
    
);


-- LECTURE: add VTI_Account

 ALTER TABLE Trainee
ADD VTI_Account VARCHAR(200) NOT NULL UNIQUE;


-- LECTURE : add table food

CREATE TABLE Food
(
    ID               INT AUTO_INCREMENT PRIMARY KEY ,
    Name             VARCHAR(200) NOT NULL ,
    Code             CHAR(5) NOT NULL,
    ModifiedDate     DATETIME
);

-- LECTURE : add table hanam

CREATE TABLE Hanam
(
          ID                INT  AUTO_INCREMENT PRIMARY KEY ,
          Name              VARCHAR(100) NOT NULL,
          BirtDate          DATE NOT NULL,
          Gender            ENUM('0', '1','NULL') NOT NULL,
          IsDeletedFlag     BIT NOT NULL, -- 0 means active, 1 means deleted
);


-- LECTURE 1 : Thêm 10 bản ghi vào Table
USE fresher;

INSERT INTO Trainee
   (Full_Name,           Birth_Date,    Gender,  	ET_IQ, 		ET_Gmath,	Training_Class, ET_English,  Evaluation_Notes,  VTI_Account)

VALUES
   ('tran van ty',       '1998-1-1',    'male',     10,  		9,  		'VTI',  		5,  		'duoc',         	'a12'),
   ('nguyen van a',      '1999-4-14',   'male',     10, 		9,  		'VTI',  		7,  		'duoc',         	'b22'),
   ('nguyen van b',      '1998-6-20',   'female',   5,   		5,  		'VTI',  		7,  		'khong duoc',   	'c23'),
   ('nguyen van c',      '1997-9-21',   'male',     7,   		6,  		'VTI',  		7,  		'gioi',         	'd24'),
   ('nguyen van d',      '1996-10-5',   'female',   6,   		9,  		'VTI',  		7,  		'duoc',         	'e25'),
   ('nguyen van e',      '1993-1-4',    'male',     18,  		5,  		'VTI',  		6,  		'khong duoc',   	'h26'),
   ('nguyen van m',      '1992-12-25',  'female',   10,  		9,  		'VTI',  		7, 			 'duoc',         	'm27'),
   ('nguyen van f',      '1996-7-8',    'female',   10,  		9,  		'VTI',  		9,  		'khong duoc',   	'n33'),
   ('nguyen van h',      '1999-8-20',   'female',   9,   		9,  		'VTI',  		10, 		'duoc',         	'p28'),
   ('nguyen van phong',  '1997-4-4',    'male',     10,   		9, 			'VTI',  		7,  		'khong duoc',   	'y79');
   
-- LECTURE 2 :  Viết lệnh để lấy ra tất cả các thực tập sinh đã vượt qua bài test đầu vào,nhóm
   
USE 		fresher;
  
SELECT  	Month(Birth_date), COUNT(Trainee_ID)
FROM 		trainee
GROUP BY 	Month(Birth_date);
  
  
-- LECTURE 3 : Viết lệnh để lấy ra thực tập sinh có tên dài nhất, lấy ra các thông tin sau:
  
USE 		fresher;

SELECT    	Trainee_ID ,Full_Name,Birth_Date,Gender,ET_IQ,ET_Gmath,ET_English,Training_Class,Evaluation_Notes,VTI_Account

FROM    	Trainee

GROUP BY 	Full_Name

ORDER BY 	LENGTH(Full_Name)DESC

LIMIT 1;


-- LECTURE 4: Viết lệnh để lấy ra tất cả các thực tập sinh là ET, 1 ET thực tập sinh là những người đã vượt qua bài test đầu vào và thỏa mãn số điểm như sau: 
USE 		fresher;

SELECT 		*
FROM 		Trainee
WHERE	 	ET_IQ + ET_Gmath >= 20 AND ET_IQ >= 8 AND ET_Gmath >= 8 AND ET_English >= 18;


-- LECTURE 5 : xóa thực tập sinh có TraineeID = 3 

USE 		fresher;

DELETE
FROM		Trainee 
WHERE		Trainee_ID = '3';

-- LECTURE 6 : Thực tập sinh có TraineeID = 5 được chuyển sang lớp "2". Hãy cập nhật thông tin vào database 
USE    		fresher;

UPDATE 		Trainee 
SET 		Training_Class = '02'
WHERE 		Trainee_ID = '5';

