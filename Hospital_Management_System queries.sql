-- database creation
CREATE DATABASE Hospital_Management_System;

-- select database
use Hospital_Management_System;

-- create table
CREATE TABLE Departments (
    Department_ID INT,
    Department_Name VARCHAR(100),
    Floor VARCHAR(50),
    Description VARCHAR(255)
);

-- if add new column in existing table
ALTER TABLE Doctors
ADD COLUMN Email VARCHAR(100),
ADD COLUMN Experience INT;

-- data insertion
INSERT INTO Departments
(Department_ID, Department_Name, Floor, Description)
VALUES
(1, 'Cardiology', 'First Floor', 'Heart Department'),
(2, 'Neurology', 'Ground Floor', 'Brain Department'),
(3, 'Pediatrics', 'First Floor', 'Children Department');

-- add primary key in existing table
ALTER TABLE Patients
ADD PRIMARY KEY (Patient_ID);

-- add foreign key in existing table
ALTER TABLE Doctors
ADD CONSTRAINT FK_Doctors_Departments
FOREIGN KEY (Department_ID)
REFERENCES Departments(Department_ID);

-- with constraint
CREATE TABLE Patients (
    Patient_ID INT AUTO_INCREMENT,
    Patient_Name VARCHAR(100) NOT NULL,
    Age INT NOT NULL,
    Gender VARCHAR(20) NOT NULL,
    Phone VARCHAR(20) NOT NULL,
    Address VARCHAR(255)
    );

-- add unique
ALTER TABLE Doctors
ADD CONSTRAINT UQ_Doctor_Phone
UNIQUE (Phone);

-- add not null
ALTER TABLE Patients
MODIFY Patient_Name VARCHAR(100) NOT NULL;

-- add auto increment
ALTER TABLE Patients
MODIFY Patient_ID INT AUTO_INCREMENT;

-- add default
ALTER TABLE Billing
ALTER Payment_Status SET DEFAULT 'Pending';

-- add check 
ALTER TABLE Patients
ADD CONSTRAINT CHK_Patient_Age
CHECK (Age > 0);

-- add multiple constraint on one table(existing)
ALTER TABLE Patients
ADD PRIMARY KEY (Patient_ID),
MODIFY Patient_Name VARCHAR(100) NOT NULL,
ADD CONSTRAINT UQ_Patient_Phone UNIQUE (Phone),
ADD CONSTRAINT CHK_Patient_Age CHECK (Age > 0);

-- Database delete
DROP DATABASE Hospital_Management_System;

-- Delete Table
DROP TABLE Staff;

-- Delete column
ALTER TABLE Patients
DROP COLUMN Address;

-- Delete a specific patient/row
DELETE FROM Patients
WHERE Patient_ID = 210;

-- Delete all data from table
DELETE FROM Patients;

--  primary key delete
ALTER TABLE Doctors
DROP PRIMARY KEY;

-- foreign key delete
ALTER TABLE Appointments
DROP FOREIGN KEY FK_Appointments_Patients;

-- unique key delete
ALTER TABLE Doctors
DROP INDEX UQ_Doctor_Phone;

-- auto increment dlt
ALTER TABLE Doctors
MODIFY Doctor_ID INT NOT NULL;

-- dlt default
ALTER TABLE Billing
ALTER COLUMN Payment_Status DROP DEFAULT;

-- dlt check 
ALTER TABLE Patients
DROP CHECK chk_patient_age;

-- dlt not null
ALTER TABLE Patients
MODIFY Phone VARCHAR(20) NULL;

-- check all constraints
SHOW CREATE TABLE Doctors;

-- check primary key
SELECT *
FROM information_schema.TABLE_CONSTRAINTS
WHERE TABLE_SCHEMA = 'Hospital_Management_System'
AND CONSTRAINT_TYPE = 'PRIMARY KEY';

-- check foreign key
SELECT *
FROM information_schema.KEY_COLUMN_USAGE
WHERE TABLE_SCHEMA = 'Hospital_Management_System'
AND REFERENCED_TABLE_NAME IS NOT NULL;

-- Query 1: Display All Patients
select * from Patients;

-- Query 2: display male patients older than 30
SELECT *
FROM Patients
WHERE Gender = 'Male'
AND Age > 30;

-- Query 3: Display All Patients older than 30
SELECT *
FROM Patients
WHERE Age > 30;

-- Query 4: Display Female Patients
SELECT *
FROM Patients
WHERE Gender = 'Female';

-- Query 5: Display patients with either B+ or O+ blood group
SELECT *
FROM Patients
WHERE Blood_Group = 'B+'
OR Blood_Group = 'O+';

-- Query 6: Display patients between age 20 and 40
SELECT *
FROM Patients
WHERE Age BETWEEN 20 AND 40;

-- Query 7: Display patient from selected blood group
SELECT *
FROM Patients
WHERE Blood_Group IN ('B+', 'O+');

-- Query 8: Search patient whose name starts with A
SELECT *
FROM Patients
WHERE Patient_Name LIKE 'A%';

-- Query 9: Display patients in ascending order of age
SELECT *
FROM Patients
ORDER BY Age ASC;

-- Query 10: Display unique blood groups of patients
SELECT DISTINCT Blood_Group
FROM Patients;

-- Query 11: Find the average salary of hospital staff
SELECT AVG(Salary) AS Average_Salary
FROM Staff;

-- Query 12: Find the highest bill amount
SELECT MAX(Total_Amount) AS Highest_Bill
FROM Billing;

-- Query 13: Display doctors by specialization
SELECT Doctor_Name, Specialization
FROM Doctors
ORDER BY Specialization;

-- Query 14: Find the minimum quantity of medicine available
SELECT MIN(Quantity) AS Minimum_Medicine_Quantity
FROM Pharmacy;

-- Query 15: Count doctors in each department
SELECT Department_ID, COUNT(*) AS Total_Doctors
FROM Doctors
GROUP BY Department_ID;

-- Query 16: Display payment method with total bill above 5000
SELECT Payment_Method, SUM(Total_Amount) AS Total_Amount
FROM Billing
GROUP BY Payment_Method
HAVING SUM(Total_Amount) > 5000;

-- Query 17: Display patient details with their appointments
SELECT
    Patients.Patient_ID,
    Patients.Patient_Name,
    Appointments.Appointment_Date,
    Appointments.Status
FROM Patients
INNER JOIN Appointments
ON Patients.Patient_ID = Appointments.Patient_ID;

-- Query 18: Count total appointments
SELECT COUNT(*) AS Total_Appointments
FROM Appointments;

-- Query 19: Display all doctors and their appointments
SELECT
    Doctors.Doctor_ID,
    Doctors.Doctor_Name,
    Appointments.Appointment_Date,
    Appointments.Status
FROM Doctors
LEFT JOIN Appointments
ON Doctors.Doctor_ID = Appointments.Doctor_ID;

-- Query 20: Calculate total hospital billing amount
SELECT SUM(Total_Amount) AS Total_Billing
FROM Billing;

-- Query 21: Display all bills with matching patient details
SELECT
    Patients.Patient_Name,
    Billing.Bill_ID,
    Billing.Bill_Date,
    Billing.Total_Amount,
    Billing.Payment_Status
FROM Patients
RIGHT JOIN Billing
ON Patients.Patient_ID = Billing.Patient_ID;

-- Query 22: Display most expensive medicine
SELECT Medicine_Name, Price
FROM Pharmacy
WHERE Price = (
    SELECT MAX(Price)
    FROM Pharmacy
);

-- Query 23: Update multiple patient details
UPDATE Patients
SET
    Phone = '03009876543',
    Address = 'Lahore'
WHERE Patient_ID = 202;

