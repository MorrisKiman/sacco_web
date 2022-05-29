-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: May 17, 2022 at 09:15 PM
-- Server version: 5.7.24
-- PHP Version: 7.2.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: sacco
--

create database sacco;

use sacco;

-- --------------------------------------------------------

--
-- Table structure for table accname
--

DROP TABLE IF EXISTS accname;
CREATE TABLE IF NOT EXISTS accname (
  AccName varchar(100) DEFAULT NULL,
  Name_ID int(2) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (Name_ID)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------
--
-- Table structure for table boss: Boss is details of the branch Manager
--
DROP TABLE IF EXISTS boss;
CREATE TABLE IF NOT EXISTS boss (
  UserName varchar(20) NOT NULL,
  Fname varchar(40) DEFAULT NULL,
  Password varchar(100) DEFAULT NULL,
  PRIMARY KEY (UserName)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

INSERT INTO boss (UserName, Fname, Password) VALUES
('root', 'root', 'WaterSprayer');
 
--
-- Table structure for table attendant
--

DROP TABLE IF EXISTS attendant;
CREATE TABLE IF NOT EXISTS attendant (
  AttendantID int(40) NOT NULL AUTO_INCREMENT,
  AttendantFname varchar(100) DEFAULT NULL,
  AttendantLname varchar(100) DEFAULT NULL,
  AttendantPass varchar(100) DEFAULT NULL,
  Contacts varchar(50) DEFAULT NULL,
  PRIMARY KEY (AttendantID)
) ENGINE=MyISAM AUTO_INCREMENT=100117 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table loans
--

DROP TABLE IF EXISTS loans;
CREATE TABLE IF NOT EXISTS loans (
  LoanID int(40) NOT NULL AUTO_INCREMENT,
  Loan_Type varchar(40) DEFAULT NULL,
  LoanReason varchar(200) DEFAULT NULL,
  LoanAmount double(10,2) DEFAULT NULL,
  Load_StartD date NOT NULL,
  Load_EndD date NOT NULL,
  MemberID int(40) NOT NULL,
  TellerID int(40) NOT NULL,
  payable decimal(10,2) NOT NULL,
  paid decimal(10,2) DEFAULT NULL,
  status varchar(40) NOT NULL,
  PRIMARY KEY (LoanID),
  FOREIGN KEY (MemberID) REFERENCES members(MemberID),
  FOREIGN KEY (TellerID) REFERENCES teller(TellerID)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table loantype
--

DROP TABLE IF EXISTS loantype;
CREATE TABLE IF NOT EXISTS loantype (
  typeID int(2) NOT NULL AUTO_INCREMENT,
  typeName varchar(100) NOT NULL,
  PRIMARY KEY (typeID)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table members
--

DROP TABLE IF EXISTS members;
CREATE TABLE IF NOT EXISTS members (
  MemberID int(40) NOT NULL AUTO_INCREMENT,
  Fname varchar(40) DEFAULT NULL,
  Lname varchar(40) DEFAULT NULL,
  IDno varchar(40) DEFAULT NULL,
  Contacts varchar(40) DEFAULT NULL,
  DOB date NOT NULL,
  DOE datetime NOT NULL,
  Occupation varchar(40) DEFAULT NULL,
  Residence varchar(40) DEFAULT NULL,
  BeneficiaryName varchar(40) DEFAULT NULL,
  BeneficiarySname varchar(40) DEFAULT NULL,
  BeneficiaryID varchar(40) DEFAULT NULL,
  BeneficiaryContacts varchar(40) DEFAULT NULL,
  PRIMARY KEY (MemberID)
) ENGINE=MyISAM AUTO_INCREMENT=32 DEFAULT CHARSET=latin1;

--
-- Table structure for table messages
--

DROP TABLE IF EXISTS messages;
CREATE TABLE IF NOT EXISTS messages (
  msg_id int(11) NOT NULL AUTO_INCREMENT,
  msg_title varchar(100) DEFAULT NULL,
  msg_content varchar(2000) NOT NULL,
  msg_status varchar(1) DEFAULT '0',
  msa_response varchar(2000) DEFAULT NULL,
  mag_sender varchar(11) DEFAULT NULL,
  msg_recepient varchar(11) DEFAULT NULL,
  PRIMARY KEY (msg_id)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table savings
--

DROP TABLE IF EXISTS savings;
CREATE TABLE IF NOT EXISTS savings (
  AccountID int(40) NOT NULL AUTO_INCREMENT,
  AccountName varchar(40) DEFAULT NULL,
  Account_Value decimal(10,0) DEFAULT NULL,
  MemberID int(40) NOT NULL,
  Date_created date NOT NULL,
  Date_Deposited date NOT NULL, --most recent date of deposit
  PRIMARY KEY (AccountID),
  FOREIGN KEY (MemberID) REFERENCES members(MemberID)
) ENGINE=MyISAM AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;

--
-- Dumping data for table savings

-- --------------------------------------------------------

--
-- Table structure for table teller
--

DROP TABLE IF EXISTS teller;
CREATE TABLE IF NOT EXISTS teller (
  TellerID int(40) NOT NULL AUTO_INCREMENT,
  TellerIDNo varchar(50) NOT NULL,
  Teller_Fname varchar(100) DEFAULT NULL,
  Teller_Sname varchar(100) DEFAULT NULL,
  TellerPass varchar(100) NOT NULL DEFAULT '1234567';,
  Contacts varchar(100) DEFAULT NULL,
  PRIMARY KEY (TellerID)
) ENGINE=MyISAM AUTO_INCREMENT=100117 DEFAULT CHARSET=latin1;

--
--Table Structure for table Ledger_tbl
--
create table ledger(
	LedgerID int(40) NOT NULL AUTO_INCREMENT PRIMARY KEY,
	EntryType varchar(1) NOT NULL, --1 is a deposit, 2 is withdrawal, 3 is a loan repayment
	MemberID int(40) NOT NULL,
	AccountRef varchar(100) not null, --ID of the loan being repayed or account being withdrawn form/deposited into
	EntryDate varchar(10) not null,--Date the entry into the ledger was made
	FOREIGN KEY (MemberID) REFERENCES members(MemberID)
);

ALTER TABLE teller ADD TellerIDNo VARCHAR(50) NOT NULL AFTER TellerID;
ALTER TABLE teller ADD UNIQUE(TellerIDNo);

ALTER TABLE attendant ADD AttendantIDNo VARCHAR(50) NOT NULL AFTER AttendantID;
ALTER TABLE attendant ADD UNIQUE(AttendantIDNo);

COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
