USE Learning_Teaching1;

DROP VIEW IF EXISTS LECTURER_INFO;
CREATE VIEW LECTURER_INFO AS 
SELECT LID, LNAME, FNAME, GENDER, DOB, EMAIL,FEName
FROM MemberOfEducationUnit, Employee, Lecturer
WHERE ID = PERSONALEID AND EMPLOYEEID = LID;

DROP VIEW IF EXISTS Student_INFO;
CREATE VIEW Student_INFO AS
SELECT StudentID, LNAME, FNAME, GENDER, DOB, EMAIL,FSName
FROM MemberOfEducationUnit, Student
WHERE ID = PERSONALSID;

DROP VIEW IF EXISTS SUBCLASS_INFO;
CREATE VIEW SUBCLASS_INFO AS
SELECT CID, CYEAR, CSEMESTER, SID, CNAME,SCLID,FCName,NoCredits
FROM SubClass, Subject
WHERE SCID = CID;
DROP VIEW IF EXISTS LECTURERS_SUBJECT;
CREATE VIEW LECTURERS_SUBJECT AS
SELECT DISTINCT LID, FEName, CNAME, CID, CSemester,CYEAR,SID,LNAME,FNAME
FROM LECTURER_INFO, SUBCLASS_INFO
WHERE SCLID = LID;





-- ####################################################################
-- Cập nhật đăng ký môn học của các lớp.
DROP PROCEDURE IF EXISTS them_lop;
DELIMITER //
CREATE PROCEDURE them_lop(MaSoMH CHAR(6),
							Namhoc YEAR,
							Hocky CHAR(3),
							MaSoNhomLop	CHAR(3))

	Begin
        IF EXISTS (SELECT * FROM Class WHERE Namhoc=Class.Year AND Hocky=Class.Semester
					AND MaSoMH=Class.CCID)
			THEN
				INSERT INTO SubClass(CYear, CSemester, SCID, SID)
					VALUES (Namhoc, Hocky, MaSoMH, MaSoNhomLop);
		ELSE
		    if EXISTS (select Subject.STATUS from Subject where CID=MaSoMH  and STATUS=1)then
				START TRANSACTION;
				INSERT INTO Class(Year, Semester, CCID)
					VALUES (Namhoc, Hocky, MaSoMH);
				INSERT INTO SubClass(CYear, CSemester, SCID, SID)
					VALUES (Namhoc, Hocky, MaSoMH, MaSoNhomLop);
				COMMIT;
				else
		        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT ='Môn học chưa được mở';
		        end if;

		END IF;
	end //
DELIMITER ;


DROP PROCEDURE IF EXISTS xoa_lop;
DELIMITER //
CREATE PROCEDURE xoa_lop(MaSoMH CHAR(6),
							Namhoc YEAR,
							Hocky CHAR(3),
							MaSoNhomLop	CHAR(3))
	Begin
        IF EXISTS (SELECT * FROM SubClass WHERE Namhoc=SubClass.CYear AND Hocky=SubClass.CSemester 
					AND MaSoMH=SubClass.SCID AND MaSoNhomLop=SubClass.SID)
			THEN 
				DELETE FROM SubClass WHERE (CYear = Namhoc) 
                and (CSemester = Hocky) and (SCID = MaSoMH) AND (SID=MaSoNhomLop);
		END IF;
	end //
DELIMITER ;

DROP PROCEDURE IF EXISTS cap_nhat_lop;
DELIMITER //
CREATE PROCEDURE cap_nhat_lop(old_MaSoMH CHAR(6),
							old_Namhoc YEAR,
							old_Hocky CHAR(3),
							old_MaSoNhomLop	CHAR(3),
                            new_MaSoMH CHAR(6),
							new_Namhoc YEAR,
							new_Hocky CHAR(3),
							new_MaSoNhomLop	CHAR(3)
                            )
	Begin
        IF EXISTS (SELECT * FROM SubClass WHERE old_Namhoc=SubClass.CYear AND old_Hocky=SubClass.CSemester 
					AND new_MaSoMH=SubClass.SCID AND old_MaSoNhomLop=SubClass.SID)
			THEN 
				UPDATE SubClass SET CYear=new_Namhoc, CSemester=new_Hocky, SCID=new_MaSoMH,
								SID=new_MaSoNhomLop
								WHERE (CYear = old_Namhoc) 
								and (CSemester = old_Hocky) 
								and (SCID = old_MaSoMH) 
								and (SID = old_MaSoNhomLop);
		END IF;
	end //
DELIMITER ;

-- Xem danh sách lớp đã được đăng ký bởi một sinh viên ở một học kỳ.    
DROP PROCEDURE IF EXISTS xem_ds_lop_cua_1_sv;
DELIMITER //
Create PROCEDURE xem_ds_lop_cua_1_sv(MSSV CHAR(7), 
									Namhoc YEAR,
                                    Hocky CHAR(3)) 
BEGIN  
  SELECT CName,SID,SCID,Fname,Lname FROM SubClass JOIN Subject ON SubClass.SCID=Subject.CID left outer join LECTURER_INFO on LID=SCLID,
                                   Student JOIN Attend A on Student.StudentID = A.AStudentID
                                WHERE AStudentID=MSSV and AYear=Namhoc AND ASemester=Hocky AND ACID=CID
        group by CName,SID,SCID,Fname,Lname;
END 
//
DELIMITER ;
call xem_ds_lop_cua_1_sv('1814812',2020,'201');
-- Xem danh sách lớp được phụ trách bởi một giảng viên ở một học kỳ.
DROP PROCEDURE IF EXISTS xem_ds_lop_cua_1_gv;
DELIMITER \\
CREATE PROCEDURE xem_ds_lop_cua_1_gv(LID CHAR(6), SEMESTER CHAR(3))
BEGIN
	SELECT DISTINCT SID, SCID, CNAME
	FROM  SubClass, `Week`, Subject
	WHERE (WYEAR, WSEMESTER, WCID, WSID) = (CYEAR, CSEMESTER, SCID, SID) AND SCID = CID AND WLID = LID AND CSEMESTER = SEMESTER;
END\\
DELIMITER ;
call xem_ds_lop_cua_1_gv('000002',201);
-- Xem danh sách môn học được đăng ký ở mỗi học kỳ ở mỗi khoa.
DROP PROCEDURE IF EXISTS xem_ds_mon_hoc_dk;
DELIMITER //
Create PROCEDURE xem_ds_mon_hoc_dk() 
BEGIN  
   SELECT ACID, CNAME, AYear, ASemester, FCNAME
	FROM Attend JOIN Subject ON CID=ACID
	GROUP BY ACID,AYear, ASemester, FCNAME;
END 
//
DELIMITER ;

-- Xem danh sách sinh viên đăng ký ở mỗi lớp ở mỗi học kỳ ở mỗi khoa.
# DROP PROCEDURE IF EXISTS xem_ds_sv_dk_1_lopp;
# DELIMITER //
# Create PROCEDURE xem_ds_sv_dk_1_lopp()
# BEGIN
#    SELECT AStudentID,LName,FName, AYear, ASemester, ASID, FCNAME
# 	FROM Attend, Subject, Student_INFO
# 	WHERE CID=ACID AND StudentID=AStudentID;
# END
# //
# DELIMITER ;

-- Xem danh sách sinh viên đăng ký cho mỗi lớp ở một học kỳ.
DROP PROCEDURE IF EXISTS xem_ds_sv_dk_1_lop;
DELIMITER \\
CREATE PROCEDURE xem_ds_sv_dk_1_lop(_CYEAR YEAR, _CSEMESTER CHAR(3), _SCID CHAR(6), _SID CHAR(3))
BEGIN
        SELECT CYEAR, CSEMESTER, SCID, SID, StudentID, FNAME, LNAME,EMAIL,FSName
	FROM Student_INFO, SubClass, Attend
	WHERE (AYEAR, ASEMESTER, ACID, ASID) = (CYEAR, CSEMESTER, SCID, SID) AND AStudentID = StudentID 
		AND (CYEAR, CSEMESTER, SCID, SID) = (_CYEAR, _CSEMESTER, _SCID, _SID);
END\\
DELIMITER ;

call xem_ds_sv_dk_1_lop(2020,'201','CO2015','L05');


DROP PROCEDURE IF EXISTS xem_ds_gv_cua_1_lop;
-- Xem danh sách giảng viên phụ trách ở mỗi lớp ở một học kỳ.
DELIMITER \\
CREATE PROCEDURE xem_ds_gv_cua_1_lop(_CYEAR YEAR,_CSEMESTER INT,_SCID CHAR(6), _SID CHAR(3))
BEGIN
	SELECT DISTINCT SID, SCID,LID,LNAME,FName
	FROM  SubClass join LECTURER_INFO on SubClass.SCLID=LID
	WHERE SubClass.SCID=_SCID AND SID=_SID AND SubClass.CSemester=_CSEMESTER;
END\\
DELIMITER ;

DROP PROCEDURE IF EXISTS xem_giao_trinh_mon_hoc_khoa;
-- Xem các giáo trình được chỉ định cho mỗi môn học ở một học kỳ.
DELIMITER \\
CREATE PROCEDURE xem_giao_trinh_mon_hoc_khoa(facultyName VARCHAR(70))
BEGIN
	SELECT CID, CNAME, ISBN, TNAME, TPNAME,Subject.NoCredits
	FROM Subject left outer join (MainlyUse join Textbook T on MainlyUse.MISBD = T.ISBN) on MainlyUse.MCID=Subject.CID
	WHERE  Subject.FCName=facultyName;
END\\
DELIMITER ;
call xem_giao_trinh_mon_hoc_khoa('Khoa khoa hoc va ki thuat may tinh');

-- Xem tổng số môn học được đăng ký ở mỗi học kỳ ở mỗi khoa.
DROP PROCEDURE IF EXISTS xem_tong_mon_hoc;
DELIMITER //
Create PROCEDURE xem_tong_mon_hoc(semester int)
BEGIN  
	SELECT FCName as FName,AYear,ASemester,COUNT(DISTINCT(CID)) as sum
	FROM Attend, Subject
	WHERE CID=ACID and ASemester=semester
	GROUP BY FCName,AYear,ASemester;
END 
//
DELIMITER ;
-- Xem tổng số lớp được mở ở một học kỳ.
DROP PROCEDURE IF EXISTS xem_tong_lop;
DELIMITER \\
CREATE PROCEDURE xem_tong_lop(_CSEMESTER CHAR(3))
BEGIN
	SELECT COUNT(*) as sum,FacultyName as FName
	FROM SubClass join Subject on SCID=CID join Faculty F on F.FacultyName = Subject.FCName
	WHERE CSEMESTER = _CSEMESTER
    group by FacultyName;
END\\
DELIMITER ;
call xem_tong_lop(201);
-- Xem tổng số sinh viên đăng ký ở mỗi lớp của một môn học ở một học kỳ.
DROP PROCEDURE IF EXISTS xem_tong_sv_dk_1_lop;
DELIMITER //
Create PROCEDURE xem_tong_sv_dk_1_lop(MaSoMH CHAR(6),
							Namhoc YEAR,
							Hocky CHAR(3)) 
BEGIN  
	SELECT AYear,ASemester,ACID,CNAME,ASID,COUNT(AStudentID)
	FROM Attend, Subject 
	WHERE CID=ACID
	GROUP BY AYear,ASemester,ACID,ASID
    HAVING AYear=Namhoc AND ASemester=Hocky AND ACID=MaSoMH;
END 
//
DELIMITER ;

-- Xem tổng số sinh viên đăng ký ở mỗi môn học ở một học kỳ.
DROP PROCEDURE IF EXISTS xem_tong_sv_dk_1_mon_hoc;
DELIMITER //
Create PROCEDURE xem_tong_sv_dk_1_mon_hoc(
							Namhoc YEAR,
							Hocky CHAR(3)) 
BEGIN  
	SELECT AYear,ASemester,ACID,CNAME,COUNT(distinct(AStudentID))
	FROM Attend, Subject 
	WHERE CID=ACID
	GROUP BY AYear,ASemester,ACID
	HAVING AYear=Namhoc AND ASemester=Hocky;
END 
//
DELIMITER ;




-- Xem tổng số sinh viên đăng ký ở một học kỳ.
DROP PROCEDURE IF EXISTS xem_tong_sv_dk;
DELIMITER \\
CREATE PROCEDURE xem_tong_sv_dk(_ASEMESTER CHAR(3))
BEGIN
	SELECT COUNT(DISTINCT StudentID) AS NO_StudentS,Student.FSName as FName
	FROM Attend, Student
	WHERE AStudentID = StudentID AND ASEMESTER = _ASEMESTER
    group by FSName;
END\\
DELIMITER ;

-- Cập nhật danh sách môn học được mở trước đầu mỗi học kỳ.
drop procedure  if exists them_mon_hoc;
DELIMITER \\
CREATE PROCEDURE them_mon_hoc(_CID CHAR(6), _CNAME VARCHAR(50), _STATUS tinyint(1), _NOCREDITS INT, _FCNAME VARCHAR(70),lecturerID char(6))
BEGIN
	INSERT INTO Subject(CID, CName, STATUS, NoCredits, FCName, SLID)
    VALUES (_CID, _CNAME, _STATUS, _NOCREDITS, _FCNAME,lecturerID);
END\\
DELIMITER ;

DELIMITER \\
drop procedure if exists xoa_mon_hoc;
CREATE PROCEDURE xoa_mon_hoc(CID CHAR(6))
BEGIN
	DELETE FROM Subject
    WHERE Subject.CID = CID;
END\\
DELIMITER ;

DELIMITER \\
drop procedure if exists cap_nhat_mon_hoc;
CREATE PROCEDURE cap_nhat_mon_hoc(CID CHAR(6), CNAME VARCHAR(50), `STATUS` BOOL, NOCREDITS INT, FCNAME VARCHAR(70))
BEGIN
	UPDATE Subject
    SET Subject.CNAME = CNAME, Subject.`STATUS` = `STATUS`, Subject.NOCREDITS = NOCREDITS, Subject.FCNAME = FCNAME
    WHERE Subject.CID = CID;
END;
DELIMITER ;

-- Cập nhật danh sách giảng viên phụ trách mỗi lớp học được mở trước đầu mỗi học kỳ.
drop procedure if exists them_gv_phu_trach;
DELIMITER \\

CREATE PROCEDURE them_gv_phu_trach(WCID CHAR(6),WSID CHAR(3),WYEAR YEAR, WSEMESTER CHAR(3),`NUMBER` INT, WLID CHAR(6))
BEGIN
	INSERT INTO Week 
    VALUES (WYEAR, WSEMESTER, WCID, WSID, `NUMBER`, WLID);
END;
DELIMITER ;


drop procedure if exists xoa_gv_phu_trach;
DELIMITER \\
CREATE PROCEDURE xoa_gv_phu_trach(WYEAR YEAR, WSEMESTER CHAR(3), WCID CHAR(6), WSID CHAR(3), `NUMBER` INT)
BEGIN
	DELETE FROM Week 
    WHERE Week.WYEAR = WYEAR AND Week.WSEMESTER = WSEMESTER AND Week.WCID = WCID AND Week.WSID = WSID AND Week.`NUMBER` = `NUMBER`;
END\\
DELIMITER ;
drop procedure if exists cap_nhat_gv_phu_trach;
DELIMITER \\
CREATE PROCEDURE cap_nhat_gv_phu_trach(WYEAR YEAR, WSEMESTER CHAR(3), WCID CHAR(6), WSID CHAR(3), `NUMBER` INT, WLID CHAR(6))
BEGIN
	UPDATE Week 
    SET Week.WLID = WLID 
    WHERE Week.WYEAR = WYEAR AND Week.WSEMESTER = WSEMESTER AND Week.WCID = WCID AND Week.WSID = WSID AND Week.`NUMBER` = `NUMBER`;
END\\
DELIMITER ;
drop procedure if exists xem_ds_mon_hoc;
-- Xem danh sách môn học ở một học kỳ.
DELIMITER \\
CREATE PROCEDURE xem_ds_mon_hoc(FCNAME VARCHAR(70))
BEGIN
	SELECT * 
    FROM Subject 
    WHERE Subject.FCNAME = FCNAME;
END\\
DELIMITER ;
drop procedure if exists xem_ds_giang_vien_phu_trach;
CREATE PROCEDURE xem_ds_giang_vien_phu_trach(_year year,semester char(3),subjectID char(6),subclassID char(3))
BEGIN
	SELECT LID,FNAME,LNAME
    FROM Week join SubClass SC on SC.CYear = Week.WYear and SC.CSemester = Week.WSemester and SC.SCID = Week.WCID and SC.SID = Week.WSID join LECTURER_INFO on WLID=LID
    WHERE SC.CYear=_year and SC.CSemester=semester and SCID=subjectID and SC.SID=subclassID;
END;
DELIMITER ;

-- Xem danh sách giảng viên ở một học kỳ.
drop procedure if exists xem_ds_giang_vien;
DELIMITER \\
CREATE PROCEDURE xem_ds_giang_vien(facultyName varchar(70))
BEGIN
	SELECT DISTINCT * 
	FROM LECTURER_INFO 
	WHERE LECTURER_INFO.FEName=facultyName;
END\\
DELIMITER ;

-- Xem những môn có nhiều giảng viên cùng phụ trách nhất ở một học kỳ.
drop procedure if exists xem_top_mon_hoc_nhieu_gv_phu_trach
DELIMITER \\
CREATE PROCEDURE xem_top_mon_hoc_nhieu_gv_phu_trach(_CSEMESTER CHAR(3))
BEGIN
	SELECT CID, CNAME, COUNT(DISTINCT LID) AS NO_LECTURERS
	FROM `Week`, LECTURER_INFO, SUBCLASS_INFO
	WHERE (WYEAR, WSEMESTER, WCID, WSID) = (CYEAR, CSEMESTER, CID, SID) AND WLID = LID AND CSEMESTER = '201'
	GROUP BY CYEAR, CSEMESTER, CID, SID
	ORDER BY COUNT(DISTINCT LID) DESC;

END;
DELIMITER ;
drop procedure if exists xem_tb_sv_dk_mon_hoc;
-- Xem số sinh viên đăng ký trung bình trong 3 năm gần nhất cho một môn học ở một học kỳ.
DELIMITER \\
CREATE PROCEDURE xem_tb_sv_dk_mon_hoc(_CYEAR YEAR, _CSEMESTER CHAR(3), _CID CHAR(6))
BEGIN
	SELECT SUM(NO_StudentS)/3 AS AVG_StudentS 
	FROM (SELECT COUNT(*) AS NO_StudentS
		FROM Student, Attend, SUBCLASS_INFO
		WHERE StudentID = AStudentID AND (AYEAR, ASEMESTER, ACID, ASID) = (CYEAR, CSEMESTER, CID, SID) 
				AND ( (_CYEAR - 2) <= CYEAR  <=_CYEAR) AND CSEMESTER = _CSEMESTER AND CID = _CID
		GROUP BY CID, CYEAR, CSEMESTER) T;
END;
DELIMITER ;
drop procedure if exists them_textbook_chinh;
-- Cập nhật giáo trình chính cho môn học do mình phụ trách.
DELIMITER $$
CREATE PROCEDURE them_textbook_chinh(MCID_IN CHAR(6), MISBD_IN CHAR(7))
BEGIN
   IF (SELECT COUNT(*) FROM MainlyUse WHERE MCID=MCID_IN) = 3 THEN
      SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT ='There are already 3 main textbook for this Subject!';
   ELSE
      INSERT INTO MainlyUse(MCID, MISBD)
      VALUES (MCID_IN, MISBD_IN);
   END IF;
END $$
DELIMITER ;
drop procedure if exists xem_textbook_mon_hoc_pt;
DELIMITER $$
CREATE PROCEDURE xem_textbook_mon_hoc_pt(EmployeeID_IN CHAR(6))
BEGIN
   SELECT *
   FROM MainlyUse
   WHERE MCID IN
      (SELECT CID
      FROM Subject,
            Faculty
      WHERE FCName = FacultyName
         AND FacultyName IN
            (SELECT FEName
            FROM LECTURER_INFO
            WHERE LID =EmployeeID_IN));
END $$
DELIMITER ;
DROP PROCEDURE IF EXISTS xoa_textbook_then_ma_mh;
DELIMITER $$
CREATE PROCEDURE xoa_textbook_then_ma_mh(MCID_IN CHAR(6))
BEGIN
  DELETE
   FROM MainlyUse
   WHERE MCID = MCID_IN; 
END $$
DELIMITER ;
DROP PROCEDURE IF EXISTS xoa_textbook_theo_ten;

DELIMITER $$
CREATE PROCEDURE xoa_textbook_theo_ten(MISBD_IN CHAR(7))
BEGIN
   DELETE
   FROM MainlyUse
   WHERE MISBD = MISBD_IN;
END $$
DELIMITER ;
-- Xem danh sách lớp học của mỗi môn học do mình phụ trách ở một học kỳ.
DROP PROCEDURE IF EXISTS xem_ds_lop_pt;
DELIMITER $$
CREATE PROCEDURE xem_ds_lop_pt(LID_IN CHAR(6), CSemester_IN CHAR(3))
BEGIN
   SELECT CID
   FROM SUBCLASS_INFO;
END $$
DELIMITER ;
drop procedure if exists xem_ds_sv_pt;
-- Xem danh sách sinh viên của mỗi lớp học do mình phụ trách ở một học kỳ.
DELIMITER $$
CREATE PROCEDURE xem_ds_sv_pt(LID_IN CHAR(6), CSemester_IN CHAR(3))
BEGIN
   SELECT ASID AS SID, StudentID, LName, FName 
   FROM Student_INFO, Attend
   WHERE AStudentID = StudentID
      AND ASID IN (SELECT SID
                  FROM SUBCLASS_INFO
                  WHERE CID IN (SELECT CCID
                                 FROM Class, LECTURERS_SUBJECT
                                 WHERE LID = LID_IN AND CSemester = CSemester_IN  AND CCID = CID)
                  )
   ORDER BY ASID;
END $$
DELIMITER ;

-- Xem danh sách môn học và giáo trình chính cho mỗi môn học do mình phụ trách ở một học kỳ.
drop procedure if exists xem_ds_mon_hoc_textbook_pt;
DELIMITER $$
CREATE PROCEDURE xem_ds_mon_hoc_textbook_pt(LID_IN CHAR(6), CSemester_IN CHAR(3))
BEGIN
   SELECT CID, CName, TName, ISBN
   FROM LECTURERS_SUBJECT, Textbook, MainlyUse
   WHERE LID = LID_IN
      AND CSemester = CSemester_IN
      AND ISBN = MISBD
      AND MCID = CID
   ORDER BY CID;
END $$
DELIMITER ;

-- Xem tổng số sinh viên của mỗi lớp học do mình phụ trách ở một học kỳ.
drop procedure if exists xem_tong_sv_moi_lop_pt;
DELIMITER $$
CREATE PROCEDURE xem_tong_sv_moi_lop_pt(LID_IN CHAR(6), CSemester_IN CHAR(3))
BEGIN
   SELECT ASID AS SID,COUNT(AStudentID) AS Student_NUM
   FROM Attend
   WHERE ASID IN (SELECT SID
                  FROM SUBCLASS_INFO
                  WHERE CID IN (SELECT CCID
                                 FROM Class, LECTURERS_SUBJECT
                                 WHERE LID = LID_IN AND CSemester = CSemester_IN AND CCID = CID))
   GROUP BY ASID;
END $$
DELIMITER ;

-- Xem số lớp học do mình phụ trách ở mỗi học kỳ trong 3 năm liên tiếp gần đây nhất
drop procedure if exists xem_so_lop_pt_gan_day;
DELIMITER $$
CREATE PROCEDURE xem_so_lop_pt_gan_day(LID_IN CHAR(6))
BEGIN
   SELECT CSemester, COUNT(SID) AS CLASS_NUM
   FROM SUBCLASS_INFO
   WHERE CYear BETWEEN (YEAR(CURDATE()) - 3) AND (YEAR(CURDATE()))
         AND SCLID = LID_IN
   GROUP BY CSemester;
END $$
DELIMITER ;

-- Xem 5 lớp học có số sinh viên cao nhất mà giảng viên từng phụ trách.
# DELIMITER $$
# CREATE PROCEDURE xem_top_5_lop_sv_cao_nhat_pt(LID_IN CHAR(6), CSemester_IN CHAR(3))
# BEGIN
#    WITH CLASS_Student_NUM AS (
#       SELECT ASID AS SID,COUNT(AStudentID) AS Student_NUM
#       FROM Attend
#       WHERE ASID IN (SELECT SID
#                      FROM SUBCLASS_INFO
#                      WHERE CID IN (SELECT CCID
#                                     FROM Class, LECTURERS_SUBJECT
#                                     WHERE LID = LID_IN AND CSemester = CSemester_IN AND CCID = CID))
#       GROUP BY ASID
#    )
#    SELECT CID, Student_NUM
#    FROM SUBCLASS_Student_NUM
#    LIMIT 5;
# END $$
# DELIMITER ;

-- Xem 5 học kỳ có số lớp nhiều nhất mà giảng viên từng phụ trách.
# DELIMITER $$
# CREATE PROCEDURE xem_top_5_hk_lop_nhieu_nhat_pt(LID_IN CHAR(6))
# BEGIN
#    WITH SUBCLASS_NUM_BY_SEMESTER AS (
#       SELECT CSemester, COUNT(SID) AS CLASS_NUM
#       FROM SUBCLASS_INFO
#       WHERE SCLID = LID_IN
#       GROUP BY CSemester
#    )
#    SELECT * FROM SUBCLASS_NUM_BY_SEMESTER
#    ORDER BY CLASS_NUM
#    LIMIT 5;
# END $$
# DELIMITER ;

-- Đăng ký môn học ở học kỳ được đăng ký.
DROP PROCEDURE IF EXISTS dang_ky;
DELIMITER |
CREATE PROCEDURE dang_ky(
                DKYEAR YEAR,
                DKSEMESTER CHAR(3),
                DKCID CHAR(6),
                 DKSID CHAR(3),
                 DKStudentID CHAR(7))
BEGIN
    IF EXISTS(SELECT * FROM Student JOIN Status S on Student.StudentID = S.SSID
        WHERE DKStudentID = StudentID AND SemesterStatus=DKSEMESTER AND LearningStatus=0)
        THEN
        IF EXISTS(SELECT * FROM SubClass SC
            WHERE CSemester=DKSEMESTER AND DKCID=SC.SCID AND DKSID = SC.SID)
            THEN
            INSERT INTO Attend(ayear, asemester, acid, asid, aStudentid)
            VALUES (DKYEAR,DKSEMESTER,DKCID,DKSID,DKStudentID);
        ELSE
            SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT ='SUBCLASS UNAVAILABLE';
        end if;
    ELSE
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT ='Student IS NOT PERMIT Attend SUBCLASS' ;

    end if;

end|
DELIMITER ;

-- XEM DANH SACH MON HOC ĐÃ DK
DROP PROCEDURE IF EXISTS xem_mon_hoc_dk;
DELIMITER |
CREATE PROCEDURE xem_mon_hoc_dk(viewSEMESTER CHAR(3))
BEGIN

        select CNAME,SID,SCID,MOEU.Lname  FROM SubClass SC,Lecturer L,Employee E,MemberOfEducationUnit MOEU ,Subject SJ
        WHERE  SC.CSemester=viewSEMESTER
         AND SC.SCLID=L.LID AND SJ.CID=SC.SCID AND  E.EmployeeID=L.LID AND MOEU.ID=E.PersonalEID;

end|
DELIMITER ;

-- Xem danh sách môn học và giáo trình chính cho mỗi môn học mà mình đăng ký ở một học kỳ.
DROP PROCEDURE IF EXISTS xem_textbook_dk;
DELIMITER |
CREATE PROCEDURE xem_textbook_dk( VIEWStudentID CHAR(7),
                                    VIEWSEMESTER CHAR(3))
BEGIN

        SELECT CName,TName  from Subject JOIN MainlyUse MU on Subject.CID = MU.MCID JOIN Textbook T on MU.MISBD = T.ISBN,
                                 (Student JOIN Attend A on Student.StudentID = A.AStudentID)
        WHERE AStudentID=VIEWStudentID AND ASemester=VIEWSEMESTER AND ACID=CID;
end|
DELIMITER ;

-- Xem danh sách lớp học của mỗi môn học mà mình đăng ký ở một học kỳ.
DROP PROCEDURE IF EXISTS xem_ds_lop_dk;
DELIMITER |
CREATE PROCEDURE xem_ds_lop_dk( VIEWStudentID CHAR(7),
                                    VIEWSEMESTER CHAR(3))
BEGIN

        SELECT CName,SID,SCID FROM SubClass JOIN Subject ON SubClass.SCID=Subject.CID,
                                   Student JOIN Attend A on Student.StudentID = A.AStudentID
                                WHERE AStudentID=VIEWStudentID AND ASemester=VIEWSEMESTER AND ACID=CID;
end|
DELIMITER ;

-- Xem danh sách lớp học của mỗi môn học mà mình đăng ký có nhiều hơn 1 giảng viên phụ trách ở một học kỳ.
DROP PROCEDURE IF EXISTS xem_ds_lop_dk_hon_1_gv;
DELIMITER |
CREATE PROCEDURE xem_ds_lop_dk_hon_1_gv( VIEWStudentID CHAR(7),
                                    VIEWSEMESTER CHAR(3))
BEGIN

        select CName,SID,SCID,Lname
        FROM SubClass JOIN Subject ON (SubClass.SCID=Subject.CID )join Lecturer L on (SubClass.SCLID = L.LID) join Employee E
            on (L.LID = E.EmployeeID) JOIN MemberOfEducationUnit MOEU on (E.PersonalEID = MOEU.ID),
             Student JOIN Attend A on Student.StudentID = A.AStudentID
        WHERE AStudentID=VIEWStudentID AND ASemester=VIEWSEMESTER
                AND ACID=CID AND exists(select count(*)
                                    from Lecturer LL,SubClass sc
                                    where sc.SCID=CID AND sc.SCLID= LID
                                    group by sc.SCID having count(*)>1);
end|
DELIMITER ;

-- Xem tổng số tín chỉ đã đăng ký được ở một học kỳ.
DROP PROCEDURE IF EXISTS xem_tong_tin_chi_dk;
DELIMITER |
CREATE PROCEDURE xem_tong_tin_chi_dk( VIEWStudentID CHAR(7),
                                    VIEWSEMESTER CHAR(3))
BEGIN

        SELECT sum(NoCredits)
        from SubClass JOIN Subject ON (SubClass.SCID=Subject.CID ),
            Student JOIN Attend A on Student.StudentID = A.AStudentID
        WHERE AStudentID=VIEWStudentID AND ASemester=VIEWSEMESTER
            AND ACID=CID AND ASID=SID AND ASemester=CSemester;
end|
DELIMITER ;

-- Xem tổng số môn học đã đăng ký được ở một học kỳ.
DROP PROCEDURE IF EXISTS xem_tong_mon_hoc_dk;
DELIMITER |
CREATE PROCEDURE xem_tong_mon_hoc_dk( VIEWStudentID CHAR(7),
                                    VIEWSEMESTER CHAR(3))
BEGIN

        SELECT COUNT(*) from SubClass,Student JOIN Attend A on Student.StudentID = A.AStudentID
        WHERE AStudentID=VIEWStudentID AND ASemester=VIEWSEMESTER AND ACID=SCID AND ASID=SID AND ASemester=CSemester;
end|
DELIMITER ;

-- Xem 3 học kỳ có số tổng số tín chỉ cao nhất mà mình đã từng đăng ký.
DROP VIEW  IF EXISTS Nocreadit_semeter;
create view Nocreadit_semeter as
SELECT sum(NoCredits) sum,ASemester
        from SubClass JOIN Subject ON (SubClass.SCID=Subject.CID ),
            Student JOIN Attend A on Student.StudentID = A.AStudentID
        WHERE AStudentID='1814812' AND ACID=CID AND ASID=SID AND ASemester=CSemester group by ASemester;
DROP PROCEDURE IF EXISTS xem_top_3_hk_tong_tin_chi_cao_nhat;
DELIMITER |
CREATE PROCEDURE xem_top_3_hk_tong_tin_chi_cao_nhat( VIEWStudentID CHAR(7),
                                    VIEWSEMESTER CHAR(3))
BEGIN

        select ASemester,sum
                from Nocreadit_semeter
                order by sum desc limit 3;
end|
DELIMITER ;




DROP PROCEDURE IF EXISTS DANGKY;
DELIMITER |
CREATE PROCEDURE DANGKY(
                DKYEAR YEAR,
                DKSEMESTER CHAR(3),
                DKCID CHAR(6),
                 DKSID CHAR(3),
                 DKSTUDENTID CHAR(7))
BEGIN
    IF EXISTS(SELECT * FROM Student JOIN Status S on Student.StudentID = S.SSID
        WHERE DKSTUDENTID = StudentID AND SemesterStatus=DKSEMESTER AND LearningStatus=0)
        THEN
        IF EXISTS(SELECT * FROM SubClass SC
            WHERE CSemester=DKSEMESTER AND DKCID=SC.SCID AND DKSID = SC.SID)
        then
            IF not EXISTS(SELECT * from Class join Attend on ACID=Class.CCID  where CCID=DKCID and Year=DKYEAR and ASemester=DKSEMESTER)
            THEN
            INSERT INTO Attend(ayear, asemester, acid, asid, astudentid)
            VALUES (DKYEAR,DKSEMESTER,DKCID,DKSID,DKStudentID);
            else
                SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT ='Môn học này đã được bàn đăng ký';
                end if;
        ELSE
            SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT ='SUBCLASS UNAVAILABLE';
        end if;
    ELSE
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT ='STUDENT IS NOT PERMIT ATTEND SUBCLASS' ;

    end if;

end|
DELIMITER ;

### XEM DANH SACH MON HOC ĐÃ DK
DROP PROCEDURE IF EXISTS LIST_SUBJECT_SEMESTER;
DELIMITER |
CREATE PROCEDURE LIST_SUBJECT_SEMESTER(viewSEMESTER CHAR(3))
BEGIN

        select CNAME,CYear,CSemester,SID,SCID, NoCredits  FROM SubClass SC,Subject SJ
        WHERE  SC.CSemester=viewSEMESTER
         AND SJ.CID=SC.SCID  ;

end;
DELIMITER ;

#######Xem danh sách môn học và giáo trình chính cho mỗi môn học mà mình đăng ký ở một học kỳ.
DROP PROCEDURE IF EXISTS LIST_SUBJECT_ATTEND;
DELIMITER |
CREATE PROCEDURE LIST_SUBJECT_ATTEND( VIEWSTUDENTID CHAR(7),
                                    VIEWSEMESTER CHAR(3))
BEGIN

        SELECT CID,CName,NoCredits,TName  from Subject left outer JOIN (MainlyUse MU JOIN Textbook T on MU.MISBD = T.ISBN)on Subject.CID = MU.MCID ,
                                 (Student JOIN Attend A on Student.StudentID = A.AStudentID)
        WHERE AStudentID=VIEWSTUDENTID AND ASemester=VIEWSEMESTER AND ACID=CID
        group by CID,CName,NoCredits,TName;
end;
DELIMITER ;

###Xem danh sách lớp học của mỗi môn học mà mình đăng ký ở một học kỳ.
DROP PROCEDURE IF EXISTS LIST_SUBCLASS_ATTEND;
DELIMITER |
CREATE PROCEDURE LIST_SUBCLASS_ATTEND( VIEWSTUDENTID CHAR(7),
                                    VIEWSEMESTER CHAR(3))
BEGIN

        SELECT CName,SID,SCID,NoCredits,ASemester SEMESTER,SubClass.CYear,LNAME,FNAME FROM SubClass JOIN Subject ON SubClass.SCID=Subject.CID left outer join LECTURER_INFO on SCLID=LID,
                                   Student JOIN Attend A on Student.StudentID = A.AStudentID
                                WHERE AStudentID=VIEWSTUDENTID AND ASemester=VIEWSEMESTER AND ACID=CID and ASID=SID and AYear=SubClass.CYear
        group by CName,SID,SCID,SubClass.CYear,ASemester,LNAME,FNAME;
end;
DELIMITER ;


### Xem danh sách lớp học của mỗi môn học mà mình đăng ký có nhiều hơn 1 giảng viên phụ trách ở một học kỳ.
DROP PROCEDURE IF EXISTS LIST_SUBCLASS_OF_SUBJECT_ATTEND_LEAST_1_LECTURE;
DELIMITER |
CREATE PROCEDURE LIST_SUBCLASS_OF_SUBJECT_ATTEND_LEAST_1_LECTURE( VIEWSTUDENTID CHAR(7),
                                    VIEWSEMESTER CHAR(3))
BEGIN

        select CName,SID,SCID,Lname
        FROM SubClass JOIN Subject ON (SubClass.SCID=Subject.CID )join Lecturer L on (SubClass.SCLID = L.LID) join Employee E
            on (L.LID = E.EmployeeID) JOIN MemberOfEducationUnit MOEU on (E.PersonalEID = MOEU.ID),
             Student JOIN Attend A on Student.StudentID = A.AStudentID
        WHERE AStudentID=VIEWSTUDENTID AND ASemester=VIEWSEMESTER
                AND ACID=CID AND exists(select count(*)
                                    from Lecturer LL,SubClass sc
                                    where sc.SCID=CID AND sc.SCLID= LID
                                    group by sc.SCID having count(*)>1);
end;
DELIMITER ;
#### SXem tổng số tín chỉ đã đăng ký được ở một học kỳ.\
DROP PROCEDURE IF EXISTS SUM_No_Registered_Credits_ONE_SEMESTER;
DELIMITER |
CREATE PROCEDURE SUM_No_Registered_Credits_ONE_SEMESTER( VIEWSTUDENTID CHAR(7),
                                    VIEWSEMESTER CHAR(3))
BEGIN

        SELECT ASemester,sum(NoCredits)NoCredit
        from SubClass JOIN Subject ON (SubClass.SCID=Subject.CID ),
            Student JOIN Attend A on Student.StudentID = A.AStudentID
        WHERE AStudentID=VIEWSTUDENTID AND ASemester=VIEWSEMESTER
            AND ACID=CID AND ASID=SID AND ASemester=CSemester;
end;
DELIMITER ;

#### SXem tổng số tín chỉ đã đăng ký được ở mỗi học kỳ.\
DROP PROCEDURE IF EXISTS SUM_No_Registered_Credits_ALL_SEMESTER;
DELIMITER |
CREATE PROCEDURE SUM_No_Registered_Credits_ALL_SEMESTER( VIEWSTUDENTID CHAR(7))
BEGIN

        SELECT ASemester,sum(NoCredits)NoCredit
        from SubClass JOIN Subject ON (SubClass.SCID=Subject.CID ),
            Student JOIN Attend A on Student.StudentID = A.AStudentID
        WHERE AStudentID=VIEWSTUDENTID
            AND ACID=CID AND ASID=SID AND ASemester=CSemester
        GROUP BY ASemester;
end;
DELIMITER ;

####Xem tổng số môn học đã đăng ký được ở một học kỳ.
DROP PROCEDURE IF EXISTS SUM_SUBJECT_ATTEND;
DELIMITER |
CREATE PROCEDURE SUM_SUBJECT_ATTEND( VIEWSTUDENTID CHAR(7),
                                    VIEWSEMESTER CHAR(3))
BEGIN

        SELECT COUNT(*) from SubClass,Student JOIN Attend A on Student.StudentID = A.AStudentID
        WHERE AStudentID=VIEWSTUDENTID AND ASemester=VIEWSEMESTER AND ACID=SCID AND ASID=SID AND ASemester=CSemester;
end;
DELIMITER ;
#### Xem 3 học kỳ có số tổng số tín chỉ cao nhất mà mình đã từng đăng ký.
DROP VIEW  IF EXISTS Nocreadit_semeter;
create view Nocreadit_semeter as
SELECT sum(NoCredits) sum,ASemester
        from SubClass JOIN Subject ON (SubClass.SCID=Subject.CID ),
            Student JOIN Attend A on Student.StudentID = A.AStudentID
        WHERE AStudentID='1814812' AND ACID=CID AND ASID=SID AND ASemester=CSemester group by ASemester;
DROP PROCEDURE IF EXISTS GET3_Nocreadit_semeter;
DELIMITER |
CREATE PROCEDURE GET3_Nocreadit_semeter( VIEWSTUDENTID CHAR(7),
                                    VIEWSEMESTER CHAR(3))
BEGIN

        select ASemester,sum
                from Nocreadit_semeter
                order by sum desc limit 3;
end;
DELIMITER ;



DROP PROCEDURE IF EXISTS GET_TYPE_ACCOUNT_ID;
DELIMITER |
CREATE PROCEDURE GET_TYPE_ACCOUNT_ID(iduser varchar(100)
                             )
BEGIN

        select * ,CASE when exists(select * from  MemberOfEducationUnit M
                                            join Employee E on M.ID = E.PersonalEID join AAOEmployee AE on E.EmployeeID = AE.AEID
                                            WHERE M.ID=iduser)
                                then 'aaoemployee'
                         when exists(select * from MemberOfEducationUnit M
                                            join Employee E on M.ID = E.PersonalEID JOIN Lecturer L on E.EmployeeID = L.LID
                                     WHERE M.ID=iduser)
                                then 'lecturer'

                        when exists(select * from  MemberOfEducationUnit M
                                            join Student S on M.ID = S.PersonalSID
                                    WHERE M.ID=iduser)
                                then 'student'
                        when exists(select * from  MemberOfEducationUnit M
                                            join Employee E2 on M.ID = E2.PersonalEID JOIN SeniorLecturer SL2 on E2.EmployeeID = SL2.SLID
                                    WHERE M.ID=iduser)
                                then 'faculty'
                        END as TYPEUSER
                from MemberOfEducationUnit M where M.ID=iduser;

end;
DELIMITER ;
use Learning_Teaching1;

DROP PROCEDURE IF EXISTS GET_STUDENT;
DELIMITER |
CREATE PROCEDURE GET_STUDENT(memberID char(9)
                             )
BEGIN

        Select LearningStatus status,SemesterStatus semester,StudentID,FSName,YearofAdmission
                from Student join Status S on Student.StudentID = S.SSID
                where PersonalSID=memberID and SemesterStatus =
                                        (select max(SemesterStatus)
                                        from Status
                                        where Status.SSID=Student.StudentID);

end;
DELIMITER ;





DROP PROCEDURE IF EXISTS UPDATE_SUBJECT_STATUS;
DELIMITER |
CREATE PROCEDURE UPDATE_SUBJECT_STATUS(subjectID char(6),setstatus int
                             )
BEGIN

        update  Subject set STATUS=setstatus
        where CID=subjectID;
end;
DELIMITER ;

DROP PROCEDURE IF EXISTS UPDATE_LECTURER_CLASS;
DELIMITER |
CREATE PROCEDURE UPDATE_LECTURER_CLASS(IdMonHoc CHAR(6),SubclaaID char(3),_year year,_semester char(3)
                             ,lecturerID char(6))
BEGIN

        update SubClass set SCLID=lecturerID
        where SID=SubclaaID and SCID=IdMonHoc and CYear=_year and _semester=CSemester;
end;
DELIMITER ;
DROP PROCEDURE IF EXISTS LIST_SUBCLASS_SEMESTER_FACULTY;
DELIMITER |
CREATE PROCEDURE LIST_SUBCLASS_SEMESTER_FACULTY(_year year,semester char(3),FacultyName varchar(70))
BEGIN

       select CNAME,SID,CID,SUBCLASS_INFO.NoCredits,CYEAR,CSEMESTER,LECTURER_INFO.FNAME,LECTURER_INFO.LNAME,WL.FNAME as WLFNAME,WL.LNAME AS WLLNAME
       from (SUBCLASS_INFO left outer join LECTURER_INFO on LID=SCLID)
           left outer join (Week join LECTURER_INFO WL on WLID=LID)
               on WSID=SID and WCID=CID and WSemester=CSemester and WYear=CYEAR
            where CYEAR=_year and semester=CSemester and SUBCLASS_INFO.FCName=FacultyName;

end;
DELIMITER ;


DROP PROCEDURE IF EXISTS LIST_CLASS_OF_LECTURER_SEMESTER_FACULTY;
DELIMITER |
CREATE PROCEDURE LIST_CLASS_OF_LECTURER_SEMESTER_FACULTY(_year year,semester char(3),FacultyName varchar(70),lecturerID char(6))
BEGIN
        if EXISTS(select * from LECTURER_INFO where LID=lecturerID and LECTURER_INFO.FEName=FacultyName) then
        select CNAME,SID,CID,SUBCLASS_INFO.NoCredits,CYEAR,CSEMESTER,LECTURER_INFO.FNAME,LECTURER_INFO.LNAME,WL.FNAME as WLFNAME,WL.LNAME AS WLLNAME
       from (SUBCLASS_INFO left outer join LECTURER_INFO on LECTURER_INFO.LID=SCLID)
           left outer join (Week join LECTURER_INFO WL on WLID=WL.LID)
               on WSID=SID and WCID=CID and WSemester=CSemester and WYear=CYEAR
                                WHERE CYear=_year and semester=CSemester and FCName=FacultyName and LECTURER_INFO.LID=lecturerID;
       else
            SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT ='Không tìm thấy Giảng Viên';
            end if;

end;
DELIMITER ;


DROP PROCEDURE IF EXISTS GET_EMPLOYEE;
DELIMITER |
CREATE PROCEDURE GET_EMPLOYEE(persionID char(9))
BEGIN
        select EmployeeID ID,FEName FACULTYNAME from Employee where PersonalEID=PersonalEID;

end;
DELIMITER ;







use LEARNING_TEACHING_ACCOUNT;
DROP PROCEDURE IF EXISTS GET_ACCOUNT_ID;
DELIMITER |
CREATE PROCEDURE GET_ACCOUNT_ID(id char(9))
BEGIN
    select USERID,USERNAME,PASSWORD from Account where Account.USERID=id;

end;
DELIMITER ;


use LEARNING_TEACHING_ACCOUNT;
DROP PROCEDURE IF EXISTS GET_ACCOUNT_NAME;
DELIMITER |
CREATE PROCEDURE GET_ACCOUNT_NAME(_USERNAME varchar(100))
BEGIN
    select USERID,USERNAME,PASSWORD from Account where Account.USERNAME=_USERNAME;

end;
DELIMITER ;



use Learning_Teaching1;
call LIST_SUBCLASS_SEMESTER_FACULTY(2020,'201','Khoa khoa hoc va ki thuat may tinh')