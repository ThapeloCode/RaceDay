--CREATE DATABASE RaceDayDb;
CREATE TABLE dbo.[User] (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    First_Name NVARCHAR(50) NOT NULL,
    Last_Name NVARCHAR(50) NOT NULL,
    Role NVARCHAR(20) NOT NULL CONSTRAINT CK_User_Role CHECK (Role IN ('Admin', 'Participant')),
    email NVARCHAR(100) NOT NULL UNIQUE,
    Password_Hash NVARCHAR(255) NOT NULL
);

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

CREATE TABLE dbo.Registration (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    User_Id INT NOT NULL,
    Category_Id INT NOT NULL,
    Bib_Number INT NOT NULL,
    Date DATETIME2 NOT NULL DEFAULT GETDATE(),
    CONSTRAINT FK_Registration_User FOREIGN KEY (User_Id) REFERENCES dbo.[User](Id),
    CONSTRAINT FK_Registration_Category FOREIGN KEY (Category_Id) REFERENCES dbo.Category(Id),
    CONSTRAINT UQ_User_Category UNIQUE (User_Id, Category_Id), -- Prevents duplicate registrations
    CONSTRAINT UQ_Category_Bib UNIQUE (Category_Id, Bib_Number) -- Unique Bib Number per Category
);

CREATE TABLE dbo.Results (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    Registration_Id INT NOT NULL UNIQUE, -- 1:1 Relationship with Registration
    Finish_Time_Seconds INT NOT NULL CONSTRAINT CK_Results_Time CHECK (Finish_Time_Seconds > 0),
    CONSTRAINT FK_Results_Registration FOREIGN KEY (Registration_Id) REFERENCES dbo.Registration(Id) ON DELETE CASCADE
);