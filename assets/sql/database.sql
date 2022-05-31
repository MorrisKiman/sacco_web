create database sacco;

use sacco;

DROP TABLE IF EXISTS accname;
CREATE TABLE IF NOT EXISTS accname (
  AccName varchar(100) DEFAULT NULL,
  Name_ID int(2) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (Name_ID)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS boss;
CREATE TABLE IF NOT EXISTS boss (
  UserName varchar(20) NOT NULL,
  Fname varchar(40) DEFAULT NULL,
  Password varchar(100) DEFAULT NULL,
  PRIMARY KEY (UserName)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

INSERT INTO boss (UserName, Fname, Password) VALUES
('root', 'root', 'WaterSprayer');


DROP TABLE IF EXISTS attendant;
CREATE TABLE IF NOT EXISTS attendant (
  AttendantID int NOT NULL AUTO_INCREMENT,
  AttendantIDNo varchar(50) NOT NULL,
  AttendantFname varchar(100) DEFAULT NULL,
  AttendantLname varchar(100) DEFAULT NULL,
  AttendantPass varchar(100) NOT NULL DEFAULT '1234567',
  Contacts varchar(50) DEFAULT NULL,
  PRIMARY KEY (AttendantID),
  UNIQUE KEY AttendantIDNo (AttendantIDNo)
) ENGINE=MyISAM AUTO_INCREMENT=130134 DEFAULT CHARSET=latin1;


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


DROP TABLE IF EXISTS loantype;
CREATE TABLE IF NOT EXISTS loantype (
  typeID int(2) NOT NULL AUTO_INCREMENT,
  typeName varchar(100) NOT NULL,
  PRIMARY KEY (typeID)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;



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


DROP TABLE IF EXISTS savings;
CREATE TABLE IF NOT EXISTS savings (
  AccountID int(40) NOT NULL AUTO_INCREMENT,
  AccountName varchar(40) DEFAULT NULL,
  Account_Value decimal(10,0) DEFAULT NULL,
  MemberID int(40) NOT NULL,
  Date_created date NOT NULL,
  Date_Deposited date NOT NULL,
  PRIMARY KEY (AccountID),
  FOREIGN KEY (MemberID) REFERENCES members(MemberID)
) ENGINE=MyISAM AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS teller;
CREATE TABLE IF NOT EXISTS teller (
  TellerID int NOT NULL AUTO_INCREMENT,
  TellerIDNo varchar(50) NOT NULL,
  Teller_Fname varchar(100) DEFAULT NULL,
  Teller_Sname varchar(100) DEFAULT NULL,
  TellerPass varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '1234567',
  Contacts varchar(100) DEFAULT NULL,
  PRIMARY KEY (TellerID),
  UNIQUE KEY TellerIDNo (TellerIDNo)
) ENGINE=MyISAM AUTO_INCREMENT=330135 DEFAULT CHARSET=latin1;


create table ledger(
	LedgerID int(40) NOT NULL AUTO_INCREMENT PRIMARY KEY,
	EntryType varchar(1) NOT NULL, 
	MemberID int(40) NOT NULL,
	AccountRef varchar(100) not null,
	EntryDate varchar(10) not null,
	FOREIGN KEY (MemberID) REFERENCES members(MemberID)
);

--test data section

--1. tellers
INSERT INTO teller (TellerID, TellerIDNo, Teller_Fname, Teller_Sname, TellerPass, Contacts) VALUES
(330126, 'AAK7895456', 'Bernard', 'Ndong Bunei', '1234567', '+254788945621'),
(330127, '5879654554', 'root', 'root', '1234567', '+256829456323'),
(330128, 'BK45654446', 'Stevens', 'Elliott Baker', '1234567', '+258622993178'),
(330129, '3269871123', 'Isabelle', 'Leah Wilkinson', '1234567', '+254931589741'),
(330130, '5111477895', 'Freddie', 'Evans Owen', '1234567', '+125010025488'),
(330131, 'BK74101002', 'Elsie', 'Mitchell Reece', '1234567', '+446654130714'),
(330132, 'AF74101002', 'Arlene', 'Phoebe Collins', '1234567', '+550093473754'),
(330133, 'BD07130789', 'Erin', 'Hughes Reids', '1234567', '+405436546513'),
(330135, 'AK86299633', 'Adele', 'Ellis White', '1234567', '+232881989249'),
(330136, '4308961099', 'Carlie', 'Isaac Watson', '1234567', '+219610421029'),
(330137, 'BH09388655', 'Michael', 'Jacob Khan', '1234567', '+254887561093'),
(330138, 'AK61874409', 'Thompson', 'Kirsten Thompson', '1234567', '+448875616161'),
(330139, 'BB81861578', 'Elizabeth', 'Kirsten Smith', '1234567', '+660991243624');

--2. Attendants
INSERT INTO attendant (AttendantID, AttendantIDNo, AttendantFname, AttendantLname, AttendantPass, Contacts) VALUES
(130126, 'K139146818', 'Karl', 'Clark Cooper', '1234567', '+840465337456'),
(130127, '8140465337', 'Sabrina', 'Isabel James', '1234567', '+440190764334'),
(130128, '8754410111', 'Steve', 'Edwards Phillips', '1234567', '+470447044704'),
(130129, '3424900000', 'root', 'root', '1234567', '+987991242378'),
(130130, 'KL0914244Y', 'Emily', 'Bruce Owen', '1234567', '+376376376376'),
(130131, '5111114347', 'Graham', 'Nick Harrison', '1234567', '+254434709887'),
(130132, 'BB00009873', 'Campbell', 'Alice Jackson', '1234567', '+253998346672'),
(130133, '9799182712', 'Max', 'Adrian Shaw', '1234567', '+446799182712'),
(130134, '1198418036', 'Adam', 'Fred Stewart', '1234567', '+880180366744'),
(130135, 'AC59718622', 'Eliza', 'Tina Moore', '1234567', '+354408629963');

--ALTER TABLE teller ADD TellerIDNo VARCHAR(50) NOT NULL AFTER TellerID;
--ALTER TABLE teller ADD UNIQUE(TellerIDNo);

--ALTER TABLE attendant ADD AttendantIDNo VARCHAR(50) NOT NULL AFTER AttendantID;
--ALTER TABLE attendant ADD UNIQUE(AttendantIDNo);