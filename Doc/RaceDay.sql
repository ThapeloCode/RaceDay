--CREATE DATABASE RaceDayDb;
/*CREATE TABLE dbo.[User] (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    First_Name NVARCHAR(50) NOT NULL,
    Last_Name NVARCHAR(50) NOT NULL,
    Role NVARCHAR(20) NOT NULL CONSTRAINT CK_User_Role CHECK (Role IN ('Admin', 'Participant')),
    email NVARCHAR(100) NOT NULL UNIQUE,
    Password_Hash NVARCHAR(255) NOT NULL
);*/
CREATE TABLE dbo.Event (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    Title NVARCHAR(100) NOT NULL,
    Description NVARCHAR(MAX) NULL,
    Start_Date DATETIME2 NOT NULL,
    End_Date DATETIME2 NOT NULL,
    Location NVARCHAR(150) NOT NULL,
    CONSTRAINT CK_Event_Dates CHECK (End_Date >= Start_Date)
);