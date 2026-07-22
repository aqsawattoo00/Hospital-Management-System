-- MySQL dump 10.13  Distrib 8.0.46, for Win64 (x86_64)
--
-- Host: localhost    Database: hospital_management_system
-- ------------------------------------------------------
-- Server version	8.0.46

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `admissions`
--
CREATE DATABASE IF NOT EXISTS hospital_management_system;
-- 
USE hospital_management_system;
--
DROP TABLE IF EXISTS `admissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admissions` (
  `Admission_ID` int NOT NULL AUTO_INCREMENT,
  `Patient_ID` int NOT NULL,
  `Room_No` int NOT NULL,
  `Admit_Date` date NOT NULL,
  `Discharge_Date` date NOT NULL,
  PRIMARY KEY (`Admission_ID`),
  KEY `FK_Admissions_Patients` (`Patient_ID`),
  KEY `FK_Admissions_Rooms` (`Room_No`),
  CONSTRAINT `FK_Admissions_Patients` FOREIGN KEY (`Patient_ID`) REFERENCES `patients` (`Patient_ID`),
  CONSTRAINT `FK_Admissions_Rooms` FOREIGN KEY (`Room_No`) REFERENCES `rooms` (`Room_No`)
) ENGINE=InnoDB AUTO_INCREMENT=311 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admissions`
--

LOCK TABLES `admissions` WRITE;
/*!40000 ALTER TABLE `admissions` DISABLE KEYS */;
INSERT INTO `admissions` VALUES (301,201,101,'2026-07-18','2026-07-22'),(302,202,102,'2026-07-19','2026-07-24'),(303,203,103,'2026-07-20','2026-07-25'),(304,204,104,'2026-07-21','2026-07-23'),(305,205,105,'2026-07-22','2026-07-26'),(306,206,106,'2026-07-10','2026-07-13'),(307,207,105,'2026-07-11','2026-07-15'),(308,208,108,'2026-07-12','2026-07-16'),(309,209,101,'2026-07-13','2026-07-18'),(310,210,110,'2026-07-14','2026-07-17');
/*!40000 ALTER TABLE `admissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `appointments`
--

DROP TABLE IF EXISTS `appointments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `appointments` (
  `Appointment_ID` int NOT NULL AUTO_INCREMENT,
  `Patient_ID` int NOT NULL,
  `Doctor_ID` int NOT NULL,
  `Appointment_Date` date NOT NULL,
  `Appointment_Time` time NOT NULL,
  `Status` varchar(20) DEFAULT 'Scheduled',
  PRIMARY KEY (`Appointment_ID`),
  KEY `FK_Appointments_Patients` (`Patient_ID`),
  KEY `FK_Appointments_Doctors` (`Doctor_ID`),
  CONSTRAINT `FK_Appointments_Doctors` FOREIGN KEY (`Doctor_ID`) REFERENCES `doctors` (`Doctor_ID`),
  CONSTRAINT `FK_Appointments_Patients` FOREIGN KEY (`Patient_ID`) REFERENCES `patients` (`Patient_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=416 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointments`
--

LOCK TABLES `appointments` WRITE;
/*!40000 ALTER TABLE `appointments` DISABLE KEYS */;
INSERT INTO `appointments` VALUES (401,201,101,'2026-07-20','10:00:00','Completed'),(402,202,102,'2026-07-21','11:30:00','Pending'),(403,203,103,'2026-07-22','09:00:00','Completed'),(404,204,104,'2026-07-23','02:00:00','Cancelled'),(405,205,105,'2026-07-24','12:30:00','Pending'),(411,206,106,'2026-07-10','09:00:00','Scheduled'),(412,207,107,'2026-07-10','10:00:00','Completed'),(413,208,108,'2026-07-11','11:00:00','Scheduled'),(414,209,109,'2026-07-11','02:00:00','Cancelled'),(415,210,110,'2026-07-12','03:30:00','Scheduled');
/*!40000 ALTER TABLE `appointments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `billing`
--

DROP TABLE IF EXISTS `billing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `billing` (
  `Bill_ID` int NOT NULL AUTO_INCREMENT,
  `Patient_ID` int NOT NULL,
  `Total_Amount` decimal(10,2) NOT NULL,
  `Payment_Method` varchar(20) NOT NULL,
  `Payment_Status` varchar(20) DEFAULT 'Pending',
  `Bill_Date` date DEFAULT NULL,
  PRIMARY KEY (`Bill_ID`),
  KEY `FK_Billing_Patients` (`Patient_ID`),
  CONSTRAINT `FK_Billing_Patients` FOREIGN KEY (`Patient_ID`) REFERENCES `patients` (`Patient_ID`),
  CONSTRAINT `CHK_Bill_Amount` CHECK ((`Total_Amount` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=811 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `billing`
--

LOCK TABLES `billing` WRITE;
/*!40000 ALTER TABLE `billing` DISABLE KEYS */;
INSERT INTO `billing` VALUES (801,201,2500.00,'Cash','Paid','2026-07-01'),(802,202,4000.00,'Card','Pending','2026-07-02'),(803,203,3500.00,'Cash','Paid','2026-07-03'),(804,204,5000.00,'Online','Pending','2026-07-04'),(805,205,2800.00,'Cash','Paid','2026-07-05'),(806,206,2500.00,'Cash','Paid','2026-07-10'),(807,207,4500.00,'Card','Paid','2026-07-10'),(808,208,3200.00,'Online','Pending','2026-07-11'),(809,209,15000.00,'Card','Paid','2026-07-11'),(810,210,2800.00,'Cash','Pending','2026-07-12');
/*!40000 ALTER TABLE `billing` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departments`
--

DROP TABLE IF EXISTS `departments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `departments` (
  `Department_ID` int NOT NULL AUTO_INCREMENT,
  `Department_Name` varchar(50) NOT NULL,
  `Floor` varchar(20) DEFAULT NULL,
  `Description` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Department_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departments`
--

LOCK TABLES `departments` WRITE;
/*!40000 ALTER TABLE `departments` DISABLE KEYS */;
INSERT INTO `departments` VALUES (1,'Cardiology','First Floor','Heart Department'),(2,'Neurology','Second Floor','Brain Department'),(3,'Orthopedics','Third Floor','Bone Department'),(4,'Pediatrics','Second Floor','Children Department'),(5,'Emergency','Ground Floor','Emergency Cases'),(6,'Dermatology','Second Floor','Skin Care Department'),(7,'ENT','First Floor','Ear, Nose and Throat Department'),(8,'Gynecology','Fourth Floor','Women Health and Maternity Department'),(9,'Oncology','Third Floor','Cancer Treatment Department'),(10,'Radiology','Basement','X-Ray, MRI and CT Scan Department');
/*!40000 ALTER TABLE `departments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctors`
--

DROP TABLE IF EXISTS `doctors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doctors` (
  `Doctor_ID` int NOT NULL AUTO_INCREMENT,
  `Doctor_Name` varchar(50) NOT NULL,
  `Gender` varchar(10) NOT NULL,
  `Qualification` varchar(50) NOT NULL,
  `Specialization` varchar(50) NOT NULL,
  `Phone` varchar(15) NOT NULL,
  `Department_ID` int NOT NULL,
  PRIMARY KEY (`Doctor_ID`),
  UNIQUE KEY `UQ_Doctor_Phone` (`Phone`),
  KEY `FK_Doctors_Departments` (`Department_ID`),
  CONSTRAINT `FK_Doctors_Departments` FOREIGN KEY (`Department_ID`) REFERENCES `departments` (`Department_ID`),
  CONSTRAINT `CHK_Doctor_Gender` CHECK ((`Gender` in (_utf8mb4'Male',_utf8mb4'Female')))
) ENGINE=InnoDB AUTO_INCREMENT=111 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctors`
--

LOCK TABLES `doctors` WRITE;
/*!40000 ALTER TABLE `doctors` DISABLE KEYS */;
INSERT INTO `doctors` VALUES (101,'Ahmed Khan','Male','MBBS','Cardiologist','03001234567',1),(102,'Sara Ali','Female','MBBS','Neurologist','03111234567',2),(103,'Usman Tariq','Male','MBBS','Orthopedic Surgeon','03221234567',3),(104,'Ayesha Noor','Female','MBBS','Pediatrician','03331234567',4),(105,'Ali Raza','Male','MBBS','General Physician','03441234567',5),(106,'Hina Ahmed','Female','MBBS','Dermatologist','03061112222',6),(107,'Umar Farooq','Male','MBBS','ENT Specialist','03072223333',7),(108,'Ayesha Noor','Female','MBBS','Gynecologist','03083334444',8),(109,'Hassan Raza','Male','MBBS','Oncologist','03094445555',9),(110,'Sana Iqbal','Female','MBBS','Radiologist','03105556666',10);
/*!40000 ALTER TABLE `doctors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `laboratory`
--

DROP TABLE IF EXISTS `laboratory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `laboratory` (
  `Test_ID` int NOT NULL AUTO_INCREMENT,
  `Patient_ID` int NOT NULL,
  `Test_Name` varchar(50) NOT NULL,
  `Test_Date` date NOT NULL,
  `Result` varchar(100) NOT NULL,
  PRIMARY KEY (`Test_ID`),
  KEY `FK_Laboratory_Patients` (`Patient_ID`),
  CONSTRAINT `FK_Laboratory_Patients` FOREIGN KEY (`Patient_ID`) REFERENCES `patients` (`Patient_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=711 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `laboratory`
--

LOCK TABLES `laboratory` WRITE;
/*!40000 ALTER TABLE `laboratory` DISABLE KEYS */;
INSERT INTO `laboratory` VALUES (701,201,'Blood Test','2026-07-20','Normal'),(702,202,'MRI Scan','2026-07-21','Migraine Detected'),(703,203,'X-Ray','2026-07-22','Fracture Confirmed'),(704,204,'Sugar Test','2026-07-23','High Sugar Level'),(705,205,'Chest X-Ray','2026-07-24','Normal'),(706,206,'Skin Allergy Test','2026-07-10','Positive'),(707,207,'CT Scan','2026-07-10','Normal'),(708,204,'Ultrasound','2026-07-11','Normal Pregnancy'),(709,209,'Biopsy','2026-07-11','Cancer Cells Detected'),(710,201,'X-Ray','2026-07-12','Minor Disc Problem');
/*!40000 ALTER TABLE `laboratory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patients`
--

DROP TABLE IF EXISTS `patients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patients` (
  `Patient_ID` int NOT NULL AUTO_INCREMENT,
  `Patient_Name` varchar(50) DEFAULT NULL,
  `Gender` varchar(10) DEFAULT NULL,
  `Age` int DEFAULT NULL,
  `Blood_Group` varchar(5) DEFAULT NULL,
  `Phone` varchar(15) DEFAULT NULL,
  `Address` varchar(100) DEFAULT NULL,
  `Disease` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Patient_ID`),
  UNIQUE KEY `UQ_Patient_Phone` (`Phone`),
  CONSTRAINT `CHK_Patient_Age` CHECK ((`Age` > 0)),
  CONSTRAINT `CHK_Patient_Gender` CHECK ((`Gender` in (_utf8mb4'Male',_utf8mb4'Female')))
) ENGINE=InnoDB AUTO_INCREMENT=211 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patients`
--

LOCK TABLES `patients` WRITE;
/*!40000 ALTER TABLE `patients` DISABLE KEYS */;
INSERT INTO `patients` VALUES (201,'Hassan Ali','Male',22,'A+','03001234567','Lahore','Fever'),(202,'Fatima Noor','Female',25,'B+','03111234567','Karachi','Migraine'),(203,'Bilal Ahmed','Male',30,'O+','03221234567','Islamabad','Fracture'),(204,'Ayesha Khan','Female',28,'AB+','03331234567','Multan','Diabetes'),(205,'Hamza Malik','Male',35,'A-','03441234567','Faisalabad','Asthma'),(206,'Areeba Khan','Female',22,'B+','03011112222','Lahore','Skin Allergy'),(207,'Hamza Ali','Male',31,'O+','03022223333','Islamabad','Sinus Infection'),(208,'Zainab Fatima','Female',27,'A-','03033334444','Faisalabad','Pregnancy Checkup'),(209,'Bilal Hussain','Male',45,'AB+','03044445555','Multan','Lung Cancer'),(210,'Noor Ul Ain','Female',29,'O-','03055556666','Rawalpindi','Back Pain');
/*!40000 ALTER TABLE `patients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pharmacy`
--

DROP TABLE IF EXISTS `pharmacy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pharmacy` (
  `Medicine_ID` int NOT NULL AUTO_INCREMENT,
  `Medicine_Name` varchar(50) NOT NULL,
  `Company` varchar(50) DEFAULT NULL,
  `Quantity` int NOT NULL,
  `Price` decimal(10,2) NOT NULL,
  `Expiry_Date` date DEFAULT NULL,
  PRIMARY KEY (`Medicine_ID`),
  CONSTRAINT `CHK_Medicine_Price` CHECK ((`Price` >= 0)),
  CONSTRAINT `CHK_Medicine_Stock` CHECK ((`Quantity` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=511 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pharmacy`
--

LOCK TABLES `pharmacy` WRITE;
/*!40000 ALTER TABLE `pharmacy` DISABLE KEYS */;
INSERT INTO `pharmacy` VALUES (501,'Panadol','GSK',100,120.00,'2027-05-15'),(502,'Augmentin','GSK',50,450.00,'2027-08-20'),(503,'Brufen','Abbott',80,180.00,'2028-01-10'),(504,'Disprin','Bayer',120,90.00,'2027-11-30'),(505,'Flagyl','Sanofi',60,250.00,'2028-03-18'),(506,'Paracetamol','GSK Pakistan',200,50.00,'2028-06-30'),(507,'Amoxicillin','Getz Pharma',120,180.00,'2027-12-31'),(508,'Ibuprofen','Highnoon Laboratories',150,80.00,'2028-03-31'),(509,'Omeprazole','Sami Pharmaceuticals',90,250.00,'2027-10-31'),(510,'Cetirizine','Hilton Pharma',300,40.00,'2028-08-31');
/*!40000 ALTER TABLE `pharmacy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prescriptions`
--

DROP TABLE IF EXISTS `prescriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prescriptions` (
  `Prescription_ID` int NOT NULL AUTO_INCREMENT,
  `Patient_ID` int NOT NULL,
  `Doctor_ID` int NOT NULL,
  `Medicine_Name` varchar(50) NOT NULL,
  `Dosage` varchar(50) NOT NULL,
  `Duration` varchar(30) NOT NULL,
  PRIMARY KEY (`Prescription_ID`),
  KEY `FK_Prescriptions_Patients` (`Patient_ID`),
  KEY `FK_Prescriptions_Doctors` (`Doctor_ID`),
  CONSTRAINT `FK_Prescriptions_Doctors` FOREIGN KEY (`Doctor_ID`) REFERENCES `doctors` (`Doctor_ID`),
  CONSTRAINT `FK_Prescriptions_Patients` FOREIGN KEY (`Patient_ID`) REFERENCES `patients` (`Patient_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=611 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prescriptions`
--

LOCK TABLES `prescriptions` WRITE;
/*!40000 ALTER TABLE `prescriptions` DISABLE KEYS */;
INSERT INTO `prescriptions` VALUES (601,201,101,'Panadol','1 Tablet Twice Daily','5 Days'),(602,202,102,'Augmentin','1 Capsule Daily','7 Days'),(603,203,103,'Brufen','1 Tablet After Meal','3 Days'),(604,204,104,'Disprin','1 Tablet Daily','5 Days'),(605,205,105,'Flagyl','2 Tablets Daily','7 Days'),(606,206,106,'Cetirizine','1 Tablet Twice Daily','7 Days'),(607,207,107,'Amoxicillin','1 Capsule Three Times Daily','5 Days'),(608,208,108,'Paracetamol','1 Tablet Twice Daily','3 Days'),(609,209,109,'Ibuprofen','1 Tablet After Meal','10 Days'),(610,210,110,'Omeprazole','1 Capsule Before Breakfast','14 Days');
/*!40000 ALTER TABLE `prescriptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rooms`
--

DROP TABLE IF EXISTS `rooms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rooms` (
  `Room_No` int NOT NULL AUTO_INCREMENT,
  `Room_Type` varchar(30) NOT NULL,
  `Charges` decimal(10,2) DEFAULT NULL,
  `Availability` varchar(20) DEFAULT 'Available',
  PRIMARY KEY (`Room_No`)
) ENGINE=InnoDB AUTO_INCREMENT=111 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rooms`
--

LOCK TABLES `rooms` WRITE;
/*!40000 ALTER TABLE `rooms` DISABLE KEYS */;
INSERT INTO `rooms` VALUES (101,'General',2000.00,'Available'),(102,'Private',5000.00,'Occupied'),(103,'ICU',10000.00,'Available'),(104,'General',2000.00,'Occupied'),(105,'Private',5000.00,'Available'),(106,'General Ward',1500.00,'Available'),(107,'Private',4000.00,'Occupied'),(108,'ICU',8000.00,'Available'),(109,'Semi-Private',3000.00,'Occupied'),(110,'VIP',10000.00,'Available');
/*!40000 ALTER TABLE `rooms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff`
--

DROP TABLE IF EXISTS `staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `staff` (
  `Staff_ID` int NOT NULL AUTO_INCREMENT,
  `Staff_Name` varchar(50) NOT NULL,
  `Gender` varchar(10) NOT NULL,
  `Designation` varchar(50) NOT NULL,
  `Phone` varchar(15) NOT NULL,
  `Salary` decimal(10,2) NOT NULL,
  PRIMARY KEY (`Staff_ID`),
  UNIQUE KEY `UQ_Staff_Phone` (`Phone`),
  CONSTRAINT `CHK_Staff_Salary` CHECK ((`Salary` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=911 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff`
--

LOCK TABLES `staff` WRITE;
/*!40000 ALTER TABLE `staff` DISABLE KEYS */;
INSERT INTO `staff` VALUES (901,'Maria Khan','Female','Nurse','03001112222',40000.00),(902,'Ahmed Raza','Male','Receptionist','03112223333',35000.00),(903,'Sana Ali','Female','Lab Technician','03223334444',45000.00),(904,'Usman Tariq','Male','Pharmacist','03334445555',50000.00),(905,'Hina Noor','Female','Ward Assistant','03445556666',30000.00),(906,'Ali Raza','Male','Receptionist','03011110001',45000.00),(907,'Fatima Noor','Female','Nurse','03011110002',60000.00),(908,'Ahmed Khan','Male','Lab Technician','03011110003',55000.00),(909,'Ayesha Malik','Female','Pharmacist','03011110004',70000.00),(910,'Usman Tariq','Male','Accountant','03011110005',65000.00);
/*!40000 ALTER TABLE `staff` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-07-20 16:38:41
