create database hospital_management;
USE hospital_management;

-- Patient Table
Create table Patient (
    PatientID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    DateOfBirth DATE,
    Gender VARCHAR(10),
    ContactInfo VARCHAR(100)
);

select * from Patient;

-- Insert data into Patient table
INSERT INTO Patient (FirstName, LastName, DateOfBirth, Gender, ContactInfo) VALUES
('Rahul', 'Mahaseth', '2003-05-10', 'Male', '9800000001'),
('Sita', 'Sharma', '1998-08-15', 'Female', '9800000002'),
('Ram', 'Thapa', '2001-01-20', 'Male', '9800000003'),
('Gita', 'Karki', '1999-11-25', 'Female', '9800000004'),
('Hari', 'Adhikari', '2002-03-18', 'Male', '9800000005'),
('Anita', 'Rai', '1997-07-12', 'Female', '9800000006'),
('Kiran', 'Joshi', '2000-12-30', 'Male', '9800000007'),
('Nabin', 'Bhandari', '1996-04-05', 'Male', '9800000008'),
('Pooja', 'KC', '2004-09-14', 'Female', '9800000009'),
('Sunil', 'Yadav', '1995-06-22', 'Male', '9800000010');

-- Doctor Table
CREATE TABLE Doctor (
    DoctorID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Specialty VARCHAR(100),
    Phone VARCHAR(20),
    Email VARCHAR(100)
);

select * from Doctor;

-- Insert data into Doctor table
INSERT INTO Doctor (FirstName, LastName, Specialty, Phone, Email) VALUES
('Amit', 'Shrestha', 'Cardiologist', '9811111111', 'amit@gmail.com'),
('Nisha', 'Khadka', 'Dermatologist', '9811111112', 'nisha@gmail.com'),
('Rabin', 'Basnet', 'Neurologist', '9811111113', 'rabin@gmail.com'),
('Sneha', 'Gurung', 'Pediatrician', '9811111114', 'sneha@gmail.com'),
('Bikash', 'Tamang', 'Orthopedic', '9811111115', 'bikash@gmail.com'),
('Alina', 'Shah', 'Gynecologist', '9811111116', 'alina@gmail.com'),
('Suman', 'Rana', 'ENT Specialist', '9811111117', 'suman@gmail.com'),
('Roshan', 'Lama', 'Psychiatrist', '9811111118', 'roshan@gmail.com'),
('Kabita', 'Poudel', 'Dentist', '9811111119', 'kabita@gmail.com'),
('Dipesh', 'Koirala', 'General Physician', '9811111120', 'dipesh@gmail.com');


-- Appointment Table
CREATE TABLE Appointment (
    AppointmentID INT AUTO_INCREMENT PRIMARY KEY,
    PatientID INT,
    DoctorID INT,
    AppointmentDate DATE,
    Reason VARCHAR(255),
    Status VARCHAR(50),

    FOREIGN KEY (PatientID) REFERENCES Patient(PatientID),
    FOREIGN KEY (DoctorID) REFERENCES Doctor(DoctorID)
);

select * from Appointment;


-- Insert data into Appointment table
INSERT INTO Appointment (PatientID, DoctorID, AppointmentDate, Reason, Status) VALUES
(1, 1, '2026-05-01', 'Heart Checkup', 'Completed'),
(2, 2, '2026-05-02', 'Skin Allergy', 'Pending'),
(3, 3, '2026-05-03', 'Headache', 'Completed'),
(4, 4, '2026-05-04', 'Child Fever', 'Completed'),
(5, 5, '2026-05-05', 'Bone Pain', 'Pending'),
(6, 6, '2026-05-06', 'Pregnancy Check', 'Completed'),
(7, 7, '2026-05-07', 'Ear Pain', 'Cancelled'),
(8, 8, '2026-05-08', 'Mental Stress', 'Completed'),
(9, 9, '2026-05-09', 'Tooth Pain', 'Pending'),
(10, 10, '2026-05-10', 'General Checkup', 'Completed');


-- Prescription Table
CREATE TABLE Prescription (
    PrescriptionID INT AUTO_INCREMENT PRIMARY KEY,
    PatientID INT,
    DoctorID INT,
    Medication VARCHAR(100),
    Dosage VARCHAR(50),
    StartDate DATE,
    EndDate DATE,

    FOREIGN KEY (PatientID) REFERENCES Patient(PatientID),
    FOREIGN KEY (DoctorID) REFERENCES Doctor(DoctorID)
);

select * from Prescription;

-- Insert data into Prescription table
INSERT INTO Prescription (PatientID, DoctorID, Medication, Dosage, StartDate, EndDate) VALUES
(1, 1, 'Aspirin', '1 tablet daily', '2026-05-01', '2026-05-10'),
(2, 2, 'Cetirizine', '2 times daily', '2026-05-02', '2026-05-07'),
(3, 3, 'Paracetamol', '3 times daily', '2026-05-03', '2026-05-08'),
(4, 4, 'Ibuprofen', '1 tablet daily', '2026-05-04', '2026-05-09'),
(5, 5, 'Calcium', '2 tablets daily', '2026-05-05', '2026-05-15'),
(6, 6, 'Iron Supplement', '1 tablet daily', '2026-05-06', '2026-05-20'),
(7, 7, 'Ear Drops', '2 drops daily', '2026-05-07', '2026-05-12'),
(8, 8, 'Vitamin B', '1 tablet daily', '2026-05-08', '2026-05-18'),
(9, 9, 'Painkiller', '2 tablets daily', '2026-05-09', '2026-05-14'),
(10, 10, 'Multivitamin', '1 tablet daily', '2026-05-10', '2026-05-20');


-- MedicalRecord Table
CREATE TABLE MedicalRecord (
    RecordID INT AUTO_INCREMENT PRIMARY KEY,
    PatientID INT,
    Diagnosis VARCHAR(255),
    Treatment VARCHAR(255),
    RecordDate DATE,
    Notes TEXT,

    FOREIGN KEY (PatientID) REFERENCES Patient(PatientID)
);

select * from MedicalRecord;

-- Insert data into MedicalRecord table
INSERT INTO MedicalRecord (PatientID, Diagnosis, Treatment, RecordDate, Notes) VALUES
(1, 'High Blood Pressure', 'Medication', '2026-05-01', 'Regular monitoring needed'),
(2, 'Skin Infection', 'Cream Applied', '2026-05-02', 'Avoid dust'),
(3, 'Migraine', 'Pain Relief', '2026-05-03', 'Reduce screen time'),
(4, 'Viral Fever', 'Rest and Medicine', '2026-05-04', 'Drink more water'),
(5, 'Fracture', 'Bandage', '2026-05-05', 'Follow-up after 2 weeks'),
(6, 'Pregnancy', 'Routine Checkup', '2026-05-06', 'Healthy condition'),
(7, 'Ear Infection', 'Antibiotics', '2026-05-07', 'Avoid loud noise'),
(8, 'Depression', 'Counseling', '2026-05-08', 'Weekly therapy advised'),
(9, 'Cavity', 'Dental Filling', '2026-05-09', 'Avoid sweets'),
(10, 'Weakness', 'Vitamin Supplements', '2026-05-10', 'Balanced diet advised');


-- Billing Table
CREATE TABLE Billing (
    BillingID INT AUTO_INCREMENT PRIMARY KEY,
    PatientID INT,
    Amount DECIMAL(10,2),
    BillingDate DATE,
    Status VARCHAR(50),

    FOREIGN KEY (PatientID) REFERENCES Patient(PatientID)
);

select * from Billing;

-- Insert data into Billing table
INSERT INTO Billing (PatientID, Amount, BillingDate, Status) VALUES
(1, 5000.00, '2026-05-01', 'Paid'),
(2, 3000.00, '2026-05-02', 'Unpaid'),
(3, 2500.00, '2026-05-03', 'Paid'),
(4, 4000.00, '2026-05-04', 'Paid'),
(5, 7000.00, '2026-05-05', 'Pending'),
(6, 6000.00, '2026-05-06', 'Paid'),
(7, 3500.00, '2026-05-07', 'Cancelled'),
(8, 4500.00, '2026-05-08', 'Paid'),
(9, 2000.00, '2026-05-09', 'Pending'),
(10, 1500.00, '2026-05-10', 'Paid');


Select PatientID, SUM(Amount) as TotalAmount
from Billing
where Status = 'Paid'
group by PatientID;



SELECT d.FirstName, d.LastName,
    COUNT(a.AppointmentID) AS AppointmentCount
FROM Doctor d
JOIN Appointment a
ON d.DoctorID = a.DoctorID
GROUP BY d.DoctorID, d.FirstName, d.LastName;






SELECT AVG(Amount) AS AverageBillingAmount
FROM Billing;



Select max(Amount) AS MaximumBillingAmount,min(Amount) AS MinimumBillingAmount
FROM Billing;


Select d.FirstName,d.LastName,
    COUNT(p.PrescriptionID) AS PrescriptionCount
FROM Doctor d
JOIN Prescription p
ON d.DoctorID = p.DoctorID
GROUP BY d.DoctorID, d.FirstName, d.LastName
HAVING COUNT(p.PrescriptionID) > 2;


Select Diagnosis,
    count(*) as RecordCount
from MedicalRecord
group by Diagnosis;


SELECT CONCAT(p.FirstName, ' ', p.LastName) AS FullName,m.Diagnosis
FROM Patient p
JOIN MedicalRecord m
ON p.PatientID = m.PatientID;


select a.AppointmentID,
    p.FirstName AS PatientFirstName,
    p.LastName AS PatientLastName,
    d.FirstName AS DoctorFirstName,
    d.LastName AS DoctorLastName,
    a.AppointmentDate,
    a.Reason,
    a.Status
FROM Appointment a
JOIN Patient p ON a.PatientID = p.PatientID
JOIN Doctor d ON a.DoctorID = d.DoctorID;


SELECT pr.PrescriptionID,
    pr.Medication,
    CONCAT(p.FirstName, ' ', p.LastName) AS PatientName,
    CONCAT(d.FirstName, ' ', d.LastName) AS DoctorName
FROM Prescription pr
JOIN Patient p ON pr.PatientID = p.PatientID
JOIN Doctor d ON pr.DoctorID = d.DoctorID;


SELECT p.PatientID,p.FirstName,p.LastName,b.BillingID,b.Amount,b.BillingDate,b.Status
FROM Patient p
LEFT JOIN Billing b
ON p.PatientID = b.PatientID;


select d.DoctorID,d.FirstName,d.LastName,a.AppointmentID,a.AppointmentDate,a.Reason,a.Status
from Doctor d
LEFT JOIN Appointment a
ON d.DoctorID = a.DoctorID;


select concat(p.FirstName, ' ', p.LastName) AS FullName,sum(b.Amount) AS TotalBilledAmount
FROM Patient p
JOIN Billing b
ON p.PatientID = b.PatientID
GROUP BY p.PatientID, p.FirstName, p.LastName;


select a.AppointmentDate,a.Reason,a.Status,p.Gender,p.ContactInfo
FROM Appointment a
JOIN Patient p
ON a.PatientID = p.PatientID;


select * from Appointment
where Status = 'Scheduled'
and AppointmentDate > '2026-01-01';


select * from Patient
where FirstName like 'A%';



select * from Billing
where Amount between 500 AND 2000;


select * from Prescription
where Medication IN ('Paracetamol', 'Ibuprofen', 'Amoxicillin');


select * from MedicalRecord
where Treatment LIKE '%Surgery%'
or Notes IS NOT NULL;


alter table Patient
add BloodGroup VARCHAR(5);


alter table Doctor
modify Phone VARCHAR(20);




