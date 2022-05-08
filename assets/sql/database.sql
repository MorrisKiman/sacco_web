CREATE DATABASE sacco DEFAULT CHARSET latin1;

USE sacco;

CREATE TABLE accname (
   AccName varchar(100),
   Name_ID int(2) not null auto_increment,
   PRIMARY KEY (Name_ID)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=4;

INSERT INTO accname (AccName, Name_ID) VALUES 
('Deposit Account', '1'),
('Shares Account', '2'),
('Withdrawable Deposit', '3');

CREATE TABLE attendant (
   AttendantID int(40) not null auto_increment,
   AttendantFname varchar(100),
   AttendantLname varchar(100),
   AttendantPass varchar(100),
   Contacts varchar(50),
   PRIMARY KEY (AttendantID)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1112;

INSERT INTO attendant (AttendantID, AttendantFname, AttendantLname, AttendantPass, Contacts) VALUES 
('1109', 'Ismael', 'Bukina', 'ismael', '087987978798'),
('1110', 'Anne', 'Songari', 'annsonga', '09089498878'),
('1111', 'Andrew', 'Odera', 'admin', '0789654332');

CREATE TABLE boss (
   UserName varchar(20) not null,
   Fname varchar(40),
   Password varchar(100),
   PRIMARY KEY (UserName)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

INSERT INTO boss (UserName, Fname, Password) VALUES 
('Admin', 'admin', '12345'),
('Morris', 'Morris', 'Kimani');

CREATE TABLE loans (
   LoanID int(40) not null auto_increment,
   Loan_Type varchar(40),
   LoanReason varchar(200),
   LoanAmount double(10,2),
   Load_StartD date not null,
   Load_EndD date not null,
   MemberID int(40) not null,
   TellerID int(40) not null,
   payable decimal(10,2) not null,
   paid decimal(10,2),
   status varchar(40) not null,
   PRIMARY KEY (LoanID)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=14;

INSERT INTO loans (LoanID, Loan_Type, LoanReason, LoanAmount, Load_StartD, Load_EndD, MemberID, TellerID, payable, paid, status) VALUES 
('1', 'Emmergency', 'Fire brokeout.', '10000.00', '0000-00-00', '0000-00-00', '22', '10023', '0.00', '0.00', ''),
('2', 'Emmergency', 'fireee', '7800.00', '2018-04-01', '2018-04-01', '22', '10024', '0.00', '0.00', ' unpaid '),
('3', 'School Fees', 'dfdfvsdvsd', '1000.00', '2018-04-01', '2018-04-01', '22', '10024', '0.00', '0.00', ' unpaid '),
('4', 'Business', 'cvdfvd', '112.00', '2018-04-01', '2018-04-01', '22', '10024', '119.00', '101.00', ' unpaid '),
('5', 'Business', 'tgrtg', '10.00', '2018-04-01', '2018-04-01', '22', '10024', '11.00', '0.00', 'Complete'),
('6', 'Emmergency', 'Stock was stolen', '10000.00', '2018-04-03', '2018-04-03', '27', '10025', '10591.34', '0.00', ' unpaid '),
('7', 'School Fees', 'Fees for my children', '2000.00', '2018-04-03', '2018-04-03', '22', '10025', '2118.27', '0.00', 'Complete'),
('8', 'Emmergency', 'Buy new phone', '10000.00', '2018-04-03', '2018-04-03', '28', '10025', '10591.34', '0.00', ' unpaid '),
('9', 'School Fees', 'fees', '12000.00', '2018-04-04', '2018-04-04', '24', '10025', '12709.61', '0.00', ' unpaid '),
('10', 'Emmergency', 'reason', '1000.00', '2018-04-04', '2018-04-04', '25', '10024', '1059.13', '0.00', ' unpaid '),
('11', 'Business', 'Add stock', '10000.00', '2018-04-05', '2018-04-05', '30', '10025', '10591.34', '2000.00', ' unpaid '),
('12', 'Emmergency', 'restore damaged wall', '10000.00', '2018-04-15', '2018-04-15', '23', '10025', '10591.34', '0.00', ' unpaid '),
('13', 'Business', 'Add stock', '5000.00', '2019-01-22', '2019-01-22', '31', '10024', '5295.67', '3000.00', ' unpaid ');

CREATE TABLE loantype (
   typeID int(2) not null auto_increment,
   typeName varchar(100) not null,
   PRIMARY KEY (typeID)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=4;

INSERT INTO loantype (typeID, typeName) VALUES 
('1', 'Emmergency'),
('2', 'Business'),
('3', 'School Fees');

CREATE TABLE members (
   MemberID int(40) not null auto_increment,
   Fname varchar(40),
   Lname varchar(40),
   IDno varchar(40),
   Contacts varchar(40),
   DOB date not null,
   DOE datetime not null,
   Occupation varchar(40),
   Residence varchar(40),
   BeneficiaryName varchar(40),
   BeneficiarySname varchar(40),
   BeneficiaryID varchar(40),
   BeneficiaryContacts varchar(40),
   PRIMARY KEY (MemberID)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=32;

INSERT INTO members (MemberID, Fname, Lname, IDno, Contacts, DOB, DOE, Occupation, Residence, BeneficiaryName, BeneficiarySname, BeneficiaryID, BeneficiaryContacts) VALUES 
('28', 'Madonna', 'Benson', '986859', '07234567', '1996-05-20', '2018-04-03 11:29:06', 'IT Consultant', 'Kileleshwa', 'Morris', 'Kimani', '8976778', '7897656778'),
('26', 'Denlitah', 'Achieng', '234540', '078900876', '1980-10-21', '2018-04-03 10:27:59', 'Teacher', 'Embakasi', 'Edna', 'Otunga', '8787899', '0766865420'),
('27', 'Boniface', 'Kyalo', '89009876', '0721678907', '1988-08-08', '2018-04-03 10:29:42', 'Teacher', 'Thika', 'Wambui', 'Kyalo', '900023', '075645567'),
('25', 'Dennis', 'Rikobe', '389288', '0723456787', '1969-01-05', '2018-04-03 10:26:15', 'Taxi Driver', 'Ruai', 'Anne', 'Kiguta', '8987687', '076657534'),
('24', 'Danson', 'Mungatana', '234345345', '5-064059649', '0000-00-00', '2018-03-30 02:51:13', 'Farmer', 'Nanyuki', 'Alsis', 'Kubasu', '958649', '05967850698705'),
('22', 'Morris', 'Kiamni', '12423423423', '076566778', '0000-00-00', '2018-03-28 22:03:45', 'Database Admin', 'Ruiru', 'Alex', 'Muasa', '897654', '457457'),
('23', 'Doreen', 'Mbula', '4563647', '23465', '1989-04-17', '2018-03-28 22:05:20', 'Journalist', 'Kakamega', 'Anne', 'Fusa', '890987', '2189768899'),
('29', 'Felix', 'Muchiri', '987656', '078890876', '1990-04-16', '2018-04-03 12:25:04', 'BusinessMan', 'Muthurwa', 'Danson', 'Muchiri', '8907654', '89768868'),
('30', 'Jacob', 'Njoroge', '890756', '0723465', '1968-08-10', '2018-04-05 15:35:38', 'Taxi Driver', 'Thika', 'Mathew', 'Njoroge', '78648967', '072646536'),
('31', 'Emma', 'Njoki', '8976554', '0722345678', '1987-02-12', '2019-01-22 10:51:31', 'Teacher', 'Kiambu', 'Martin', 'Nzoka', '8976554', '0768977');

CREATE TABLE savings (
   AccountID int(40) not null auto_increment,
   AccountName varchar(40),
   Account_Value decimal(10,0),
   MemberID int(40) not null,
   Date_created date not null,
   Date_Deposited date not null,
   PRIMARY KEY (AccountID)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=26;

INSERT INTO savings (AccountID, AccountName, Account_Value, MemberID, Date_created, Date_Deposited) VALUES 
('11', 'Deposit Account', '212000', '22', '2018-03-29', '2018-04-02'),
('12', 'Deposit Account', '5000', '27', '2018-04-03', '2018-04-03'),
('13', 'Deposit Account', '5000', '26', '2018-04-03', '2018-04-03'),
('14', 'Shares Account', '12000', '23', '2018-04-03', '2018-08-03'),
('15', 'Withdrawable Deposit', '19000', '22', '2018-04-03', '2018-04-04'),
('16', 'Withdrawable Deposit', '4000', '27', '2018-04-03', '2018-04-03'),
('17', 'Withdrawable Deposit', '20000', '24', '2018-04-03', '2018-04-03'),
('18', 'Shares Account', '34790', '24', '2018-04-03', '2019-01-22'),
('19', 'Shares Account', '120500', '24', '2018-04-03', '2018-08-03'),
('20', 'Deposit Account', '50020', '28', '2018-04-03', '2018-04-07'),
('21', 'Deposit Account', '5000', '29', '2018-04-03', '2018-04-03'),
('22', 'Withdrawable Deposit', '38000', '25', '2018-04-03', '2018-04-03'),
('23', 'Shares Account', '11000', '30', '2018-04-05', '2018-04-05'),
('24', 'Withdrawable Deposit', '234560', '23', '2019-01-21', '2019-01-21'),
('25', 'Deposit Account', '10000', '31', '2019-01-22', '2019-01-22');

CREATE TABLE teller (
   TellerID int(40) not null auto_increment,
   Teller_Fname varchar(100),
   Teller_Sname varchar(100),
   TellerPass varchar(100),
   Contacts varchar(100),
   PRIMARY KEY (TellerID)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=11112;

INSERT INTO teller (TellerID, Teller_Fname, Teller_Sname, TellerPass, Contacts) VALUES 
('10023', 'Nimaki', 'Nagasaki', 'Nagasaki', '08797665'),
('10024', 'Andrew', 'Fartward', 'sidcom', '273568347'),
('10025', 'Andrea', 'Nelson', 'Nellidrea', '1382938729'),
('10026', 'Recheal', 'Wangari', '7438478', '799765878'),
('11111', 'Adrew', 'Odera', 'admin', '0987654323');

CREATE DATABASE test DEFAULT CHARSET latin1;

--table for inhouse messaging
create table messages(
	msg_id int not null auto_increment primary key,
	msg_title varchar(100),
	msg_content varchar(2000) not null,
	msg_status varchar(1) default "0",
	msa_response varchar(2000),
	mag_sender varchar(11),
	msg_recepient varchar(11)
);