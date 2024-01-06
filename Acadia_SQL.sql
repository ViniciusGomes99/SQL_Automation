CREATE DATABASE acadiatest2;
USE acadiatest2;

#DATA ENGINEERING
CREATE TABLE cSegments (
    SegmentID INT PRIMARY KEY,
    Segment_Description VARCHAR(40)
);

CREATE TABLE cProfiles (
    ProfileID varchar(10) PRIMARY KEY,
    Profile_Description VARCHAR(40)
);

CREATE TABLE cDepartments (
    DepartmentID CHAR(1) PRIMARY KEY,
    Department_Description VARCHAR(40)
);

CREATE TABLE fHistory (
    DepartmentID CHAR(1),
    Year INT,
    SegmentID INT,
    ProfileID varchar(10),
    Sales DECIMAL(10, 2),
    Customers INT
);
ALTER TABLE fHistory
ADD CONSTRAINT fk_Segment FOREIGN KEY (SegmentID) REFERENCES cSegments(SegmentID);

ALTER TABLE fHistory
ADD CONSTRAINT fk_Profile FOREIGN KEY (ProfileID) REFERENCES cProfiles(ProfileID);
USE acadiatest;
SELECT f.*,
       p.Profile_Description,
       d.Department_Description,
       s.Segment_Description
FROM fHistory f
LEFT JOIN cProfiles p ON f.ProfileID = p.ProfileID
LEFT JOIN cDepartments d ON f.DepartmentID = d.DepartmentID
LEFT JOIN cSegments s ON f.SegmentID = s.SegmentID;

#DATA ANALYSIS

SELECT 'fHistory' AS Table_Name, COUNT(*) AS Record_Count FROM fHistory
UNION
SELECT 'cProfiles' AS Table_Name, COUNT(*) AS Record_Count FROM cProfiles
UNION
SELECT 'cDepartments' AS Table_Name, COUNT(*) AS Record_Count FROM cDepartments
UNION
SELECT 'cSegments' AS Table_Name, COUNT(*) AS Record_Count FROM cSegments;

SELECT d.Department_Description, p.Profile_Description, s.Segment_Description, MAX(f.Sales) AS Max_Sales
FROM fHistory f
LEFT JOIN cDepartments d ON f.DepartmentID = d.DepartmentID
LEFT JOIN cProfiles p ON f.ProfileID = p.ProfileID
LEFT JOIN cSegments s ON f.SegmentID = s.SegmentID
GROUP BY d.Department_Description, p.Profile_Description, s.Segment_Description
ORDER BY Max_Sales DESC
LIMIT 10;

SELECT s.Segment_Description, AVG(f.Sales) AS Avg_Sales
FROM fHistory f
LEFT JOIN cSegments s ON f.SegmentID = s.SegmentID
GROUP BY s.Segment_Description
ORDER BY Avg_Sales DESC;

SELECT d.Department_Description, SUM(f.Customers) AS Total_Customers
FROM fHistory f
LEFT JOIN cDepartments d ON f.DepartmentID = d.DepartmentID
GROUP BY d.Department_Description
ORDER BY Total_Customers DESC;

SELECT f.Year, d.Department_Description, SUM(f.Sales) AS Total_Sales
FROM fHistory f
LEFT JOIN cDepartments d ON f.DepartmentID = d.DepartmentID
GROUP BY f.Year, d.Department_Description
ORDER BY f.Year, d.Department_Description;