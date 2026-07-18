Create database Hospital;
USE Hospital;
CREATE TABLE Patients(
    PatientID VARCHAR(10) PRIMARY KEY,
    FirstName VARCHAR(100) NOT NULL,
    LastName VARCHAR(100) NOT NULL,
    Gender VARCHAR(2) NOT NULL,
    DateOfBirth DATE NOT NULL,
    Phone TEXT NOT NULL,
    Address TEXT
);

create table Doctors(
DoctorID VARCHAR(10) primary key ,
 FirstName varchar(100) not null,
LastName varchar(100) not null,
Specialty varchar(100) not null,
Phone text ,
Email text);

create table Departments(
DepartmentID VARCHAR(10) primary key,
DepartmentName varchar(100) not null,
Location int);

create table Appointments(
AppointmentID VARCHAR(10) primary key,
PatientID VARCHAR(10) not null,
DoctorID VARCHAR(10) not null ,
AppointmentDate Date not null,
AppointmentTime TIME not null,
status varchar(15),
FOREIGN KEY (PatientID) REFERENCES Patients(PatientID)
on delete restrict,
FOREIGN KEY (DoctorID) REFERENCES Doctors(DoctorID));

create table Treatments(
TreatmentID VARCHAR(10) primary key,
AppointmentID VARCHAR(10),
Diagnosis varchar(100),
TreatmentDescription text,
cost int,
foreign key (AppointmentID) references Appointments(AppointmentID)
);

create table Medications(
MedicationID VARCHAR(10) primary key,
MedicationName text,
Manufacturer text,
Price int);

create table Prescriptions(
PrescriptionID VARCHAR(10) primary key,
TreatmentID VARCHAR(10),
MedicationID VARCHAR(10),
Dosage text,
Duration int,
foreign key (TreatmentID) references Treatments (TreatmentID),
foreign key (MedicationID) references Medications(MedicationID));

create table Billing(
BillID VARCHAR(10) primary key,
PatientID VARCHAR(10),
TreatmentID VARCHAR(10),
Amount int,
PaymentStatus text,
foreign key (PatientID) references Patients(PatientID),
foreign key (TreatmentID) references Treatments(TreatmentID)
);
INSERT INTO Patients
(PatientID, FirstName, LastName, Gender, DateOfBirth, Phone, Address)
VALUES
('P001','John','Smith','M','2000-05-15','0911000001','Addis Ababa'),
('P002','Sara','Ahmed','F','1998-09-21','0911000002','Bole'),
('P003','David','Brown','M','2002-03-10','0911000003','Lideta'),
('P004','Mekdes','Tadesse','F','1999-12-08','0911000004','Kazanchis');
INSERT INTO Doctors
(DoctorID, FirstName, LastName, Specialty, Phone, Email)
VALUES
('D001','Abebe','Bekele','Cardiology','0922000001','abebe@hospital.com'),
('D002','Helen','Tesfaye','Neurology','0922000002','helen@hospital.com'),
('D003','Samuel','Dawit','Pediatrics','0922000003','samuel@hospital.com'),
('D004','Liya','Kebede','Orthopedics','0922000004','liya@hospital.com');

INSERT INTO Departments
(DepartmentID, DepartmentName, Location)
VALUES
('DEP001','Cardiology',1),
('DEP002','Neurology',2),
('DEP003','Pediatrics',3),
('DEP004','Orthopedics',4);

INSERT INTO Appointments
(AppointmentID, PatientID, DoctorID, AppointmentDate, AppointmentTime, Status)
VALUES
('A001','P001','D001','2026-07-20','09:00:00','Completed'),
('A002','P002','D002','2026-07-21','10:30:00','Scheduled'),
('A003','P003','D003','2026-07-22','11:15:00','Completed'),
('A004','P004','D004','2026-07-23','02:00:00','Cancelled');

INSERT INTO Treatments
(TreatmentID, AppointmentID, Diagnosis, TreatmentDescription, Cost)
VALUES
('T001','A001','High Blood Pressure','Prescribed blood pressure medication',200),
('T002','A002','Migraine','Recommended MRI and medication',350),
('T003','A003','Flu','Rest and antibiotics',120);

INSERT INTO Medications
(MedicationID, MedicationName, Manufacturer, Price)
VALUES
('M001','Paracetamol','ABC Pharma',25),
('M002','Amoxicillin','HealthMed',80),
('M003','Ibuprofen','MediCare',40),
('M004','Aspirin','PharmaPlus',30);


INSERT INTO Prescriptions
(PrescriptionID, TreatmentID, MedicationID, Dosage, Duration)
VALUES
('PR001','T001','M004','1 tablet twice daily',30),
('PR002','T002','M003','1 tablet after meals',14),
('PR003','T003','M002','500mg three times daily',7);

INSERT INTO Billing
(BillID, PatientID, TreatmentID, Amount, PaymentStatus)
VALUES
('B001','P001','T001',200,'Paid'),
('B002','P002','T002',350,'Pending'),
('B003','P003','T003',120,'Paid');
SELECT * FROM Patients;
SELECT * FROM Doctors;
SELECT * FROM Appointments;
SELECT
    P.FirstName,
    P.LastName,
    D.FirstName,
    D.LastName,
    A.AppointmentDate,
    A.AppointmentTime,
    A.Status
FROM Appointments A
JOIN Patients P
ON A.PatientID = P.PatientID
JOIN Doctors D
ON A.DoctorID = D.DoctorID;
SELECT
    P.FirstName,
    P.LastName,
    T.Diagnosis,
    T.TreatmentDescription
FROM Treatments T
JOIN Appointments A
ON T.AppointmentID = A.AppointmentID
JOIN Patients P
ON A.PatientID = P.PatientID;
SELECT
    P.FirstName,
    P.LastName,
    M.MedicationName,
    PR.Dosage,
    PR.Duration
FROM Prescriptions PR
JOIN Treatments T
ON PR.TreatmentID = T.TreatmentID
JOIN Appointments A
ON T.AppointmentID = A.AppointmentID
JOIN Patients P
ON A.PatientID = P.PatientID
JOIN Medications M
ON PR.MedicationID = M.MedicationID;

SELECT *
FROM Billing
WHERE PaymentStatus='Pending';
SELECT SUM(Amount) AS TotalRevenue
FROM Billing
WHERE PaymentStatus='Paid';

SELECT
    D.FirstName,
    D.LastName,
    COUNT(*) AS TotalAppointments
FROM Appointments A
JOIN Doctors D
ON A.DoctorID = D.DoctorID
GROUP BY D.DoctorID;

SELECT
    P.FirstName,
    P.LastName,
    A.AppointmentDate
FROM Patients P
JOIN Appointments A
ON P.PatientID = A.PatientID
WHERE A.Status='Completed';
SELECT
    Diagnosis,
    TreatmentDescription,
    Cost
FROM Treatments;
SELECT
    P.FirstName,
    P.LastName,
    B.Amount,
    B.PaymentStatus
FROM Billing B
JOIN Patients P
ON B.PatientID = P.PatientID;