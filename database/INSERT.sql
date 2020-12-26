use Learning_Teaching1;
INSERT INTO MemberOfEducationUnit(ID, Gender, Fname, Lname, DOB, Email)
VALUE ('000000001','M','Le','Vu','2000-11-20','letuanvu@gmail.com');
INSERT INTO MemberOfEducationUnit(ID, Gender, Fname, Lname, DOB, Email)
VALUE ('000000002','M','LE','Lam','2000-01-01','lethanhlam@gmail.com');
INSERT INTO MemberOfEducationUnit(ID, Gender, Fname, Lname, DOB, Email)
VALUE ('000000003','M','Nguyen','Duy','2000-02-02','nguyenhoangduy@gmail.com');
INSERT INTO MemberOfEducationUnit(ID, Gender, Fname, Lname, DOB, Email)
VALUE ('000000004','M','Nguyen','Nhan','2000-03-03','nguyentrinhan@gmail.com');
INSERT INTO MemberOfEducationUnit(ID, Gender, Fname, Lname, DOB, Email)
VALUE ('000000005','F','Nguyen','Vien','2000-11-01','nguyenthevien@gmail.com');
INSERT INTO MemberOfEducationUnit(ID, Gender, Fname, Lname, DOB, Email)
VALUE ('000000006','F','Dao','Tu','2000-09-20','daothanhtu@gmail.com');
INSERT INTO MemberOfEducationUnit(ID, Gender, Fname, Lname, DOB, Email)
VALUE ('000000007','M','Huynh','Long','2000-07-15','huynhlong@gmail.com');
INSERT INTO MemberOfEducationUnit(ID, Gender, Fname, Lname, DOB, Email)
VALUE ('000000008','M','Bui','Giang','1990-11-29','buixuangiang@gmail.com');
INSERT INTO MemberOfEducationUnit(ID, Gender, Fname, Lname, DOB, Email)
VALUE ('000000009','F','Vo Thi Ngoc','Chau','1990-01-01','chauvtn@hcmut.edu.vn');
INSERT INTO MemberOfEducationUnit(ID, Gender, Fname, Lname, DOB, Email)
VALUE ('000000010','F','Nguyen Thi Ai','Thao','1990-09-20','nguyenaithao@gmail.com');
INSERT INTO MemberOfEducationUnit(ID, Gender, Fname, Lname, DOB, Email)
VALUE ('000000011','M','Tran','duy','2000-07-17','duybt@hcmut.com');
INSERT INTO MemberOfEducationUnit(ID, Gender, Fname, Lname, DOB, Email)
VALUE ('000000012','M','Truong','Loc','2000-07-17','loc@hcmut.com');
INSERT INTO Faculty(FacultyName) VALUE ('Khoa khoa hoc va ki thuat may tinh');
INSERT INTO Faculty(FacultyName) VALUE ('Khoa hoa');
INSERT INTO Faculty(FacultyName) VALUE ('Khoa co khi');
INSERT INTO MemberOfEducationUnit(ID, Gender, Fname, Lname, DOB, Email)
VALUE ('000000013','M','Nguyen Van','A','2000-07-17','A@hcmut.com');
INSERT INTO Employee(EmployeeID, PersonalEID,FEName)
VALUE ('000006','000000013','Khoa khoa hoc va ki thuat may tinh');
INSERT INTO AAOEmployee(AEID)
VALUE ('000006');

INSERT INTO MemberOfEducationUnit(ID, Gender, Fname, Lname, DOB, Email)
VALUE ('000000014','M','Nguyen Van','B','2000-07-17','B@hcmut.com');
INSERT INTO Employee(EmployeeID, PersonalEID,FEName)
VALUE ('000007','000000014','Khoa khoa hoc va ki thuat may tinh');
insert into SeniorLecturer values ('000007');


INSERT INTO Employee(EmployeeID, PersonalEID,FEName)
VALUE ('000001','000000008','Khoa khoa hoc va ki thuat may tinh');
INSERT INTO Employee(EmployeeID, PersonalEID, FEName)
VALUE ('000002','000000009','Khoa khoa hoc va ki thuat may tinh');
INSERT INTO Employee(EmployeeID, PersonalEID, FEName)
VALUE ('000003','000000010','Khoa khoa hoc va ki thuat may tinh');
INSERT INTO Employee(EmployeeID, PersonalEID, FEName)
VALUE ('000004','000000011','Khoa khoa hoc va ki thuat may tinh');
INSERT INTO Employee(EmployeeID, PersonalEID,FEName)
VALUE ('000005','000000012','Khoa khoa hoc va ki thuat may tinh');
INSERT INTO AAOEmployee(AEID)
VALUE ('000001');
INSERT INTO SeniorLecturer(SLID)
VALUE ('000005');
INSERT INTO Lecturer(LID)
VALUE ('000002');
INSERT INTO Lecturer(LID)
VALUE ('000003');
INSERT INTO Lecturer(LID)
VALUE ('000004');

INSERT INTO Student(StudentID,PersonalSID,YearofAdmission, FSName)
VALUES ('1814812','000000001','2018','Khoa khoa hoc va ki thuat may tinh');
INSERT INTO Student(StudentID, PersonalSID,YearofAdmission, FSName)
VALUES ('1810730','000000002','2018','Khoa khoa hoc va ki thuat may tinh');
INSERT INTO Student(StudentID, PersonalSID,YearofAdmission, FSName)
VALUES ('1810078','000000003','2018','Khoa khoa hoc va ki thuat may tinh');
INSERT INTO Student(StudentID, PersonalSID,YearofAdmission, FSName)
VALUES ('1810390','000000004','2018','Khoa khoa hoc va ki thuat may tinh');
INSERT INTO Student(StudentID, PersonalSID,YearofAdmission, FSName)
VALUES ('1812482','000000005','2018','Khoa khoa hoc va ki thuat may tinh');
INSERT INTO Student(StudentID, PersonalSID,YearofAdmission, FSName)
VALUES ('1812890','000000006','2019','Khoa co khi');
INSERT INTO Student(StudentID, PersonalSID,YearofAdmission, FSName)
VALUES ('1813904','000000007','2019','Khoa hoa');

INSERT INTO Subject(CID, CName, Status, NoCredits, FCName,SLID)
VALUES ('CO2014','He co so du lieu',True,4,'Khoa khoa hoc va ki thuat may tinh','000002');
INSERT INTO Subject(CID, CName, Status, NoCredits, FCName,SLID)
VALUES ('CO3005','Nguyen ly ngon ngu lap trinh',True,4,'Khoa khoa hoc va ki thuat may tinh','000002');
INSERT INTO Subject(CID, CName, Status, NoCredits, FCName,SLID)
VALUES ('CO2015','Cong nghe phan mem',True,3,'Khoa khoa hoc va ki thuat may tinh','000002');
INSERT INTO Subject(CID, CName, Status, NoCredits, FCName,SLID)
VALUES ('CO2008','Kien truc may tinh',False,4,'Khoa khoa hoc va ki thuat may tinh','000002');

INSERT INTO Publisher(pname, location)
VALUES ('Addison-Wesley','AMERICAN');
INSERT INTO Publisher(pname, location)
VALUES ('Prentice Hall','AMERICAN');
INSERT INTO Textbook(ISBN, TName, TPName)
VALUES ('1234567','Fundamentals of Database Systems','Addison-Wesley');
INSERT INTO Textbook(ISBN, TName, TPName)
VALUES ('1234568',' Database Systems – A Practical Approach to Design','Addison-Wesley');
INSERT INTO Textbook(ISBN, TName, TPName)
VALUES ('1234569','Database Systems Using Oracle','Prentice Hall');
INSERT INTO  Author(AID, AName)
VALUES ('1234561','Elmasri');
INSERT INTO  Author(AID, AName)
VALUES ('1234562','S.B. Navathe');
INSERT INTO  Author(AID, AName)
VALUES ('1234563','N. Shah');
INSERT INTO Class(Year, Semester, CCID)
VALUES (2020,201,'CO2014');
INSERT INTO Class(Year, Semester, CCID)
VALUES (2019,191,'CO2015');
INSERT INTO Class(Year, Semester, CCID)
VALUES (2020,192,'CO2008');
INSERT INTO Class(Year, Semester, CCID)
VALUES (2020,201,'CO3005');

INSERT INTO SubClass(CYear, CSemester, SCID, SID, SCLID)
VALUES (2020,201,'CO2014','L14','000002');
INSERT INTO SubClass(CYear, CSemester, SCID, SID, SCLID)
VALUES (2020,201,'CO2014','L13','000002');
INSERT INTO SubClass(CYear, CSemester, SCID, SID, SCLID)
VALUES (2020,201,'CO2014','L04','000002');
INSERT INTO SubClass(CYear, CSemester, SCID, SID, SCLID)
VALUES (2019,191,'CO2015','L05','000003');
INSERT INTO SubClass(CYear, CSemester, SCID, SID, SCLID)
VALUES (2020,192,'CO2008','L06','000004');

INSERT INTO `Use` (UCID, UISBN)
VALUES ('CO2014','1234567');
INSERT INTO `Use`(UCID, UISBN)
VALUES ('CO2014','1234568');
INSERT INTO `Use`(UCID, UISBN)
VALUES ('CO2014','1234569');
insert into MainlyUse(MCID, MISBD)
VALUES ('CO2014','1234567');
insert into MainlyUse(MCID, MISBD)
VALUES ('CO2014','1234568');
INSERT INTO Prerequisite(Csuper, Csub)
values ('CO2014','CO2008');
INSERT INTO Prerequisite(Csuper, Csub)
values ('CO2015','CO2008');
INSERT INTO Parallel(Psuper, Psub)
VALUES ('CO2014','CO3005');
INSERT INTO Attend(AYear, ASemester, ACID, ASID, AStudentID)
VALUES (2020,201,'CO2014','L14','1814812');
INSERT INTO Attend(AYear, ASemester, ACID, ASID, AStudentID)
VALUES (2020,201,'CO2014','L14','1810730');
INSERT INTO Attend(AYear, ASemester, ACID, ASID, AStudentID)
VALUES (2020,201,'CO2014','L14','1810390');
INSERT INTO Attend(AYear, ASemester, ACID, ASID, AStudentID)
VALUES (2020,201,'CO2014','L14','1810078');
INSERT INTO Attend(AYear, ASemester, ACID, ASID, AStudentID)
VALUES (2020,201,'CO2014','L14','1812482');
INSERT INTO Attend(AYear, ASemester, ACID, ASID, AStudentID)
VALUES (2020,201,'CO2014','L14','1813904');

INSERT INTO Written_by(WISBN, WAID)
VALUES ('1234567','1234561');
INSERT INTO Written_by(WISBN, WAID)
VALUES ('1234567','1234562');
INSERT INTO Written_by(WISBN, WAID)
VALUES ('1234568','1234563');
INSERT INTO Written_by(WISBN, WAID)
VALUES ('1234568','1234562');
INSERT INTO Phone(MOEID, PhoneNumber)
VALUES ('000000001','0919523753');
INSERT INTO Phone(MOEID, PhoneNumber)
VALUES ('000000002','0914523753');
INSERT INTO Phone(MOEID, PhoneNumber)
VALUES ('000000001','0919523752');
INSERT INTO Phone(MOEID, PhoneNumber)
VALUES ('000000003','0819523753');
INSERT INTO Status(SSID, SemesterStatus, LearningStatus)
VALUES ('1814812',1,1);
INSERT INTO Status(SSID, SemesterStatus, LearningStatus)
VALUES ('1810730',0,0);
INSERT INTO Status(SSID, SemesterStatus, LearningStatus)
VALUES ('1810078',2,2);
INSERT INTO Status(SSID, SemesterStatus, LearningStatus)
VALUES ('1810390',3,3);
INSERT INTO Category(CISBN, CategoryName)
values ('1234567','database');
INSERT INTO Category(CISBN, CategoryName)
values ('1234568','database');
INSERT INTO Category(CISBN, CategoryName)
values ('1234569','database');
INSERT INTO PublishingYear(PYISBN, PYear)
VALUES ('1234567',2005);
INSERT INTO PublishingYear(PYISBN, PYear)
VALUES ('1234568',2006);
INSERT INTO PublishingYear(PYISBN, PYear)
VALUES ('1234569',2007);


use LEARNING_TEACHING_ACCOUNT;
insert into Account(USERID, USERNAME, PASSWORD) values ('000000014','faculty','12345');
insert into Account(USERID, USERNAME, PASSWORD) values ('000000013','aaoemployee','12345');
insert into Account values ('000000001','student','12345');
insert into Account values ('000000009','lecturer','12345');