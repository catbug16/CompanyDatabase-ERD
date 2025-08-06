USE CompanyDB;
GO
CREATE TABLE Department (
    DNUM INT PRIMARY KEY,
    DName VARCHAR(100),
    Locations VARCHAR(100),
    HireDate DATE,
    ManagerSSN INT
);
CREATE TABLE Employee (
    SSN INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    BirthDate DATE,
    Gender BIT,
    DNUM INT,
    SupervisorSSN INT,
    FOREIGN KEY (DNUM) REFERENCES Department(DNUM),
    FOREIGN KEY (SupervisorSSN) REFERENCES Employee(SSN)
);

ALTER TABLE Department
ADD CONSTRAINT FK_Department_Manager
FOREIGN KEY (ManagerSSN) REFERENCES Employee(SSN);

CREATE TABLE DepartmentLocation (
    DNUM INT,
    DName VARCHAR(100),
    DLocation VARCHAR(100),
    PRIMARY KEY (DNUM, DLocation),
    FOREIGN KEY (DNUM) REFERENCES Department(DNUM)
);

CREATE TABLE Project (
    PNUM INT PRIMARY KEY,
    PName VARCHAR(100),
    PLocation VARCHAR (100),
    City VARCHAR(50),
    DNUM INT,
    FOREIGN KEY (DNUM) REFERENCES Department(DNUM)
);

CREATE TABLE EmployeeProject (
SSN INT,
PNUM INT,
WorkingHours INT,
PRIMARY KEY (SSN,PNUM),
FOREIGN KEY (SSN) REFERENCES Employee(SSN),
FOREIGN KEY (PNUM) REFERENCES Project(PNUM)
);

CREATE TABLE Dependant (
DName VARCHAR(100),
BirthDate DATE,
Gender CHAR(1),
Employee INT,
PRIMARY KEY (DName,Employee),
FOREIGN KEY (Employee) REFERENCES Employee(SSN),
);




