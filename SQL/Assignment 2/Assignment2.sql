
-- LECTURE: Creating a Database fresher

CREATE DATABASE IF NOT EXISTS fresher;

USE fresher;

CREATE TABLE Trainee
(
    Trainee_ID 				INT AUTO_INCREMENT PRIMARY KEY,
    Full_Name 				VARCHAR(50) NOT NULL,
    Birth_Date 				DATE NOT NULL,
    Gender 					ENUM('male' , 'female', 'unknown'),
    ET_IQ                   TINYINT(30),
    ET_Gmath                TINYINT(30),
    ET_English              TINYINT(30),
    Training_Class          CHAR(15) NOT NULL,
    Evaluation_Notes        NVARCHAR(500) 
    
);

-- LECTURE: add VTI_Account

ALTER TABLE Trainee
ADD VTI_Account VARCHAR(200) UNIQUE NOT NULL;


--LECTURE : add table food

CREATE TABLE food
(
    ID               INT AUTO_INCREMENT PRIMARY KEY ,
    Name             VARCHAR(200) NOT NULL ,
    Code             CHAR(5) NOT NULL,
    ModifiedDate     DATETIME
);

-- LECTURE : add table hanam

CREATE TABLE hanam
(
          ID                INT  AUTO_INCREMENT PRIMARY KEY ,
          Name              VARCHAR(100) NOT NULL,
          BirtDate          DATE NOT NULL,
          Gender            ENUM(0, 1,'NULL'),
          IsDeletedFlag     BIT NOT NULL, -- 0 means active, 1 means deleted
);