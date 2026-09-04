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

CREATE TABLE dbo.Category (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    Event_Id INT NOT NULL,
    Title NVARCHAR(100) NOT NULL,
    CONSTRAINT FK_Category_Event FOREIGN KEY (Event_Id) REFERENCES dbo.Event(Id) ON DELETE CASCADE
);

CREATE TABLE dbo.Route (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    Category_Id INT NOT NULL UNIQUE, -- 1:1 Relationship with Category
    Title NVARCHAR(100) NOT NULL,
    Location NVARCHAR(150) NOT NULL,
    Distance_km DECIMAL(5,2) NOT NULL CONSTRAINT CK_Route_Distance CHECK (Distance_km > 0),
    CONSTRAINT FK_Route_Category FOREIGN KEY (Category_Id) REFERENCES dbo.Category(Id) ON DELETE CASCADE
);