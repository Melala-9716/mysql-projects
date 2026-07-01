-- =============================================
           -- BIRUK ACADEMY SCHOOL MANAGEMENT DATABASE — Database Implementation

-- Project    : Database Design Implementation for Biruk_Academy

-- Institution: Addis Ababa University, College of Technology and Built
--              Environment (CTBE), Department of Software Engineering
-- 1.Liza Usman - UGR/5968/17
-- 2.Melala Muleta - UGR/9716/17
-- 3.Mintesnot Kebede - UGR/8313/17
-- 4.Muaz Siraj  - UGR/4766/17
-- 5.Nardos Solomon - UGR/8725/17

CREATE DATABASE IF NOT EXISTS BirukAcademy;
USE BirukAcademy;

CREATE TABLE Branch (
    Branch_ID VARCHAR(10) PRIMARY KEY,
    Branch_Name VARCHAR(100) NOT NULL,
    School_Type VARCHAR(50) NOT NULL,
    Location VARCHAR(150) NOT NULL,
    Total_Capacity INT NOT NULL
);

CREATE TABLE Student (
    Student_ID VARCHAR(15) PRIMARY KEY,
    First_Name VARCHAR(50) NOT NULL,
    Last_Name VARCHAR(50) NOT NULL,
    Date_of_Birth DATE NOT NULL,
    Gender CHAR(1) NOT NULL,
    Registration_Date DATE NOT NULL,
    Current_Grade VARCHAR(20) NOT NULL,
    Branch_ID VARCHAR(10) NOT NULL,
    FOREIGN KEY (Branch_ID) REFERENCES Branch(Branch_ID)
);

CREATE TABLE Teacher (
    Teacher_ID VARCHAR(10) PRIMARY KEY,
    First_Name VARCHAR(50) NOT NULL,
    Last_Name VARCHAR(50) NOT NULL,
    Education_Level VARCHAR(50) NOT NULL,
    Subject_Taught VARCHAR(50) NOT NULL,
    Years_of_Experience INT NOT NULL,
    Monthly_Salary DECIMAL(10,2) NOT NULL,
    Contact_Number VARCHAR(15),
    Branch_ID VARCHAR(10) NOT NULL,
    FOREIGN KEY (Branch_ID) REFERENCES Branch(Branch_ID)
);

CREATE TABLE Payment (
    Receipt_No VARCHAR(15) NOT NULL,
    Student_ID VARCHAR(15) NOT NULL,
    Payment_Date DATE NOT NULL,
    Amount_Paid DECIMAL(10,2) NOT NULL,
    Payment_Status VARCHAR(20) NOT NULL,
    Month_Covered VARCHAR(20) NOT NULL,
    Branch_ID VARCHAR(10) NOT NULL,
    PRIMARY KEY (Receipt_No, Student_ID),
    FOREIGN KEY (Student_ID) REFERENCES Student(Student_ID),
    FOREIGN KEY (Branch_ID) REFERENCES Branch(Branch_ID)
);

CREATE TABLE Grade_Report (
    Report_ID VARCHAR(15) PRIMARY KEY,
    Assessment_Type VARCHAR(30) NOT NULL,
    Score DECIMAL(5,2) NOT NULL,
    Academic_Year VARCHAR(10) NOT NULL,
    Subject VARCHAR(50) NOT NULL,
    Student_ID VARCHAR(15) NOT NULL,
    Teacher_ID VARCHAR(10) NOT NULL,
    FOREIGN KEY (Student_ID) REFERENCES Student(Student_ID),
    FOREIGN KEY (Teacher_ID) REFERENCES Teacher(Teacher_ID)
);

CREATE TABLE Schedule (
    Schedule_ID VARCHAR(10) PRIMARY KEY,
    Day_of_Week VARCHAR(20) NOT NULL,
    Start_Time TIME NOT NULL,
    End_Time TIME NOT NULL,
    Subject VARCHAR(50) NOT NULL,
    Teacher_ID VARCHAR(10) NOT NULL,
    Branch_ID VARCHAR(10) NOT NULL,
    FOREIGN KEY (Teacher_ID) REFERENCES Teacher(Teacher_ID),
    FOREIGN KEY (Branch_ID) REFERENCES Branch(Branch_ID)
);
-- Branch
INSERT INTO Branch VALUES
('B001', 'Bole Branch', 'Kindergarten', 'Bole Addis Ababa', 500),
('B002', 'Saris Branch', 'Elementary', 'Saris Addis Ababa', 400),
('B003', 'Megenagna Branch', 'High School', 'Megenagna Addis Ababa', 450),
('B004', 'CMC Branch', 'Kindergarten', 'CMC Addis Ababa', 300),
('B005', 'Lideta Branch', 'Elementary', 'Lideta Addis Ababa', 420),
('B006', 'Kazanchis Branch', 'High School', 'Kazanchis Addis Ababa', 300),
('B007', 'Ayat Branch', 'Kindergarten', 'Ayat Addis Ababa', 350),
('B008', 'Piassa Branch', 'Elementary', 'Piassa Addis Ababa', 500),
('B009', 'Gulele Branch', 'High School', 'Gulele Addis Ababa', 320),
('B010', 'Kotebe Branch', 'Elementary', 'Kotebe Addis Ababa', 600);

-- Student
INSERT INTO Student VALUES
('S001', 'Abel', 'Kassa', '2009-05-12', 'M', '2025-09-01', 'KG', 'B001'),
('S002', 'Sara', 'Teshome', '2014-03-21', 'F', '2025-09-01', 'Grade 2', 'B002'),
('S003', 'Yonas', 'Hailu', '2008-11-09', 'M', '2025-09-01', 'Grade 8', 'B003'),
('S004', 'Marta', 'Gebre', '2010-07-18', 'F', '2025-09-01', 'KG', 'B004'),
('S005', 'Nahom', 'Bekele', '2009-12-30', 'M', '2025-09-01', 'Grade 5', 'B005'),
('S006', 'Hana', 'Solomon', '2007-01-15', 'F', '2025-09-01', 'Grade 9', 'B006'),
('S007', 'Dawit', 'Fikru', '2013-09-05', 'M', '2025-09-01', 'Grade 1', 'B007'),
('S008', 'Ruth', 'Alem', '2008-08-22', 'F', '2025-09-01', 'Grade 6', 'B008'),
('S009', 'Kalkidan', 'Mengistu', '2006-04-18', 'F', '2025-09-01', 'Grade 10', 'B009'),
('S010', 'Samuel', 'Tesfaye', '2014-02-27', 'M', '2025-09-01', 'Grade 2', 'B010');

-- Teacher
INSERT INTO Teacher VALUES
('T001', 'Mekdes', 'Tadesse', 'B.Ed', 'Mathematics', 6, 12000.00, '0911000001', 'B001'),
('T002', 'Daniel', 'Kebede', 'M.Ed', 'Science', 8, 15000.00, '0911000002', 'B002'),
('T003', 'Selam', 'Haile', 'B.Ed', 'English', 5, 11000.00, '0911000003', 'B003'),
('T004', 'Abebe', 'Girma', 'B.Sc', 'Mathematics', 7, 13000.00, '0911000004', 'B004'),
('T005', 'Hanna', 'Solomon', 'M.Ed', 'Science', 9, 16000.00, '0911000005', 'B005'),
('T006', 'Meseret', 'Bekele', 'B.Ed', 'English', 4, 10000.00, '0911000006', 'B006'),
('T007', 'Fitsum', 'Alemu', 'B.Sc', 'Mathematics', 6, 12500.00, '0911000007', 'B007'),
('T008', 'Lidia', 'Tesfaye', 'M.Ed', 'Science', 10, 17000.00, '0911000008', 'B008'),
('T009', 'Yonatan', 'Fikru', 'B.Ed', 'English', 5, 11500.00, '0911000009', 'B009'),
('T010', 'Rahel', 'Gebre', 'M.Ed', 'Mathematics', 8, 15500.00, '0911000010', 'B010');

-- Payment
INSERT INTO Payment VALUES
('R001', 'S001', '2025-10-01', 1500.00, 'Paid', 'October', 'B001'),
('R002', 'S002', '2025-10-02', 1200.00, 'Paid', 'October', 'B002'),
('R003', 'S003', '2025-10-03', 1800.00, 'Partial', 'October', 'B003'),
('R004', 'S004', '2025-10-04', 1000.00, 'Paid', 'October', 'B004'),
('R005', 'S005', '2025-10-05', 2000.00, 'Paid', 'October', 'B005'),
('R006', 'S006', '2025-10-06', 1700.00, 'Overdue', 'October', 'B006'),
('R007', 'S007', '2025-10-07', 900.00, 'Paid', 'October', 'B007'),
('R008', 'S008', '2025-10-08', 1600.00, 'Paid', 'October', 'B008'),
('R009', 'S009', '2025-10-09', 2200.00, 'Partial', 'October', 'B009'),
('R010', 'S010', '2025-10-10', 1100.00, 'Paid', 'October', 'B010');

-- Grade_Report
INSERT INTO Grade_Report VALUES
('GR001', 'Mid-term', 85.00, '2025/26', 'Mathematics', 'S001', 'T001'),
('GR002', 'Final Exam', 90.00, '2025/26', 'Science', 'S002', 'T002'),
('GR003', 'Quiz', 78.00, '2025/26', 'English', 'S003', 'T003'),
('GR004', 'Mid-term', 88.00, '2025/26', 'Mathematics', 'S004', 'T004'),
('GR005', 'Final Exam', 92.00, '2025/26', 'Science', 'S005', 'T005'),
('GR006', 'Quiz', 75.00, '2025/26', 'English', 'S006', 'T006'),
('GR007', 'Mid-term', 80.00, '2025/26', 'Mathematics', 'S007', 'T007'),
('GR008', 'Final Exam', 95.00, '2025/26', 'Science', 'S008', 'T008'),
('GR009', 'Quiz', 89.00, '2025/26', 'English', 'S009', 'T009'),
('GR010', 'Mid-term', 84.00, '2025/26', 'Mathematics', 'S010', 'T010');

-- Schedule
INSERT INTO Schedule VALUES
('SC001', 'Monday', '08:00:00', '09:30:00', 'Mathematics', 'T001', 'B001'),
('SC002', 'Monday', '09:30:00', '11:00:00', 'Science', 'T002', 'B002'),
('SC003', 'Tuesday', '08:00:00', '09:30:00', 'English', 'T003', 'B003'),
('SC004', 'Tuesday', '09:30:00', '11:00:00', 'Mathematics', 'T004', 'B004'),
('SC005', 'Wednesday', '08:00:00', '09:30:00', 'Science', 'T005', 'B005'),
('SC006', 'Wednesday', '09:30:00', '11:00:00', 'English', 'T006', 'B006'),
('SC007', 'Thursday', '08:00:00', '09:30:00', 'Mathematics', 'T007', 'B007'),
('SC008', 'Thursday', '09:30:00', '11:00:00', 'Science', 'T008', 'B008'),
('SC009', 'Friday', '08:00:00', '09:30:00', 'English', 'T009', 'B009'),
('SC010', 'Friday', '09:30:00', '11:00:00', 'Mathematics', 'T010', 'B010');

-- View all students with branch
SELECT s.Student_ID, CONCAT(s.First_Name, ' ', s.Last_Name) AS Full_Name,
       s.Current_Grade, b.Branch_Name
FROM Student s JOIN Branch b ON s.Branch_ID = b.Branch_ID;

-- Teacher timetable
SELECT t.Teacher_ID, CONCAT(t.First_Name, ' ', t.Last_Name) AS Teacher,
       sc.Day_of_Week, sc.Start_Time, sc.End_Time, sc.Subject
FROM Schedule sc JOIN Teacher t ON sc.Teacher_ID = t.Teacher_ID;

-- Student performance
SELECT CONCAT(s.First_Name, ' ', s.Last_Name) AS Student,
       g.Subject, g.Score, g.Assessment_Type,
       CONCAT(t.First_Name, ' ', t.Last_Name) AS Teacher
FROM Grade_Report g
JOIN Student s ON g.Student_ID = s.Student_ID
JOIN Teacher t ON g.Teacher_ID = t.Teacher_ID
ORDER BY g.Score DESC;


--  Students with Full Branch Details
SELECT s.Student_ID, CONCAT(s.First_Name, ' ', s.Last_Name) AS Full_Name,
       s.Current_Grade, s.Gender, b.Branch_Name, b.Location, b.Total_Capacity
FROM Student s JOIN Branch b ON s.Branch_ID = b.Branch_ID
ORDER BY b.Branch_Name;

--  Teachers Full Information
SELECT t.Teacher_ID, CONCAT(t.First_Name, ' ', t.Last_Name) AS Teacher_Name,
       t.Subject_Taught, t.Education_Level, t.Years_of_Experience, 
       t.Monthly_Salary, b.Branch_Name
FROM Teacher t JOIN Branch b ON t.Branch_ID = b.Branch_ID
ORDER BY t.Monthly_Salary DESC;

--  Payment History with Student & Branch
SELECT p.Receipt_No, CONCAT(s.First_Name, ' ', s.Last_Name) AS Student_Name,
       p.Payment_Date, p.Amount_Paid, p.Payment_Status, p.Month_Covered, b.Branch_Name
FROM Payment p
JOIN Student s ON p.Student_ID = s.Student_ID
JOIN Branch b ON p.Branch_ID = b.Branch_ID
ORDER BY p.Payment_Date DESC;

-- Overdue Payments
SELECT CONCAT(s.First_Name, ' ', s.Last_Name) AS Student_Name, s.Current_Grade,
       p.Amount_Paid, p.Payment_Date, b.Branch_Name
FROM Payment p
JOIN Student s ON p.Student_ID = s.Student_ID
JOIN Branch b ON p.Branch_ID = b.Branch_ID
WHERE p.Payment_Status = 'Overdue';

-- Student Overall Performance
SELECT CONCAT(s.First_Name, ' ', s.Last_Name) AS Student_Name,
       COUNT(g.Report_ID) AS Total_Exams,
       ROUND(AVG(g.Score), 2) AS Average_Score
FROM Student s
JOIN Grade_Report g ON s.Student_ID = g.Student_ID
GROUP BY s.Student_ID, s.First_Name, s.Last_Name
ORDER BY Average_Score DESC;

-- Revenue per Branch
SELECT b.Branch_Name, COUNT(p.Receipt_No) AS Transactions,
       SUM(p.Amount_Paid) AS Total_Revenue
FROM Payment p JOIN Branch b ON p.Branch_ID = b.Branch_ID
GROUP BY b.Branch_Name
ORDER BY Total_Revenue DESC;

-- Subject-wise Performance
SELECT Subject, COUNT(*) AS Assessments, ROUND(AVG(Score), 2) AS Avg_Score
FROM Grade_Report
GROUP BY Subject
ORDER BY Avg_Score DESC;

-- Teacher Workload
SELECT CONCAT(t.First_Name, ' ', t.Last_Name) AS Teacher,
       COUNT(DISTINCT sc.Schedule_ID) AS Classes,
       COUNT(DISTINCT g.Student_ID) AS Students_Taught
FROM Teacher t
LEFT JOIN Schedule sc ON t.Teacher_ID = sc.Teacher_ID
LEFT JOIN Grade_Report g ON t.Teacher_ID = g.Teacher_ID
GROUP BY t.Teacher_ID, t.First_Name, t.Last_Name;

--  Branch Enrollment Summary
SELECT b.Branch_Name, COUNT(s.Student_ID) AS Enrolled,
       b.Total_Capacity,
       ROUND(COUNT(s.Student_ID)*100.0/b.Total_Capacity, 2) AS Occupancy_Rate
FROM Branch b LEFT JOIN Student s ON b.Branch_ID = s.Branch_ID
GROUP BY b.Branch_ID, b.Branch_Name, b.Total_Capacity;

--  Complete Grade Report
SELECT g.Report_ID, CONCAT(s.First_Name, ' ', s.Last_Name) AS Student,
       g.Assessment_Type, g.Subject, g.Score,
       CONCAT(t.First_Name, ' ', t.Last_Name) AS Teacher
FROM Grade_Report g
JOIN Student s ON g.Student_ID = s.Student_ID
JOIN Teacher t ON g.Teacher_ID = t.Teacher_ID
ORDER BY g.Score DESC;
