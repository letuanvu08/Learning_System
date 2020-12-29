USE Learning_Teaching;

-- Mỗi sinh viên không được đăng ký quá 18 tín chỉ.
DROP TRIGGER IF EXISTS check_registered_credits;
DELIMITER //
CREATE TRIGGER check_registered_credits AFTER INSERT ON Attend
	FOR EACH ROW
    BEGIN 
		IF (SELECT SUM(NOCREDITS) FROM Attend, Subject WHERE NEW.AYEAR =Attend.AYEAR and NEW.ASEMESTER=Attend.Asemester and Attend.ACID= Subject.CID AND ASTUDENTID = NEW.ASTUDENTID) > 18 THEN
        SIGNAL SQLSTATE '45001' SET MESSAGE_TEXT = 'Một sinh viên không thể đăng ký quá 18 tín chỉ trong một học kỳ.';
	   END IF;
    END;
//
DELIMITER ;


-- Mỗi lớp không có quá 60 sinh viên đăng ký.
DROP TRIGGER IF EXISTS check_students_in_class;
DELIMITER //
CREATE TRIGGER check_students_in_class AFTER INSERT ON Attend
	FOR EACH ROW
    BEGIN 
		IF (SELECT COUNT(*) FROM Attend WHERE AYEAR = NEW.AYEAR AND ASEMESTER = NEW.ASEMESTER AND ACID = NEW.ACID AND ASID = NEW.ASID) > 60 THEN
        SIGNAL SQLSTATE '45001' SET MESSAGE_TEXT = 'Một lớp hoc không thể chứa quá 60 sinh viên.';
	   END IF;
    END;
//
DELIMITER ;

-- Giáo trình chính phải được xuất bản không quá 10 năm.
DROP TRIGGER IF EXISTS check_textbook_publish_year;
DELIMITER //
CREATE TRIGGER check_textbook_publish_year BEFORE INSERT ON MainlyUse
	FOR EACH ROW
    BEGIN 
		IF (SELECT MAX(PYEAR) FROM PublishingYear WHERE PYISBN = NEW.MISBD) < YEAR(CURDATE()) - 10 THEN
        SIGNAL SQLSTATE '45001' SET MESSAGE_TEXT = 'Giáo trình chính phải xuất bản cách hiện nay không quá 10 năm.';
		END IF;
    END;
//
DELIMITER ;

-- Chỉ những môn học đang ở trạng thái Mở mới được tạo lớp.
DROP TRIGGER IF EXISTS check_main_Subject_status;
DELIMITER //
CREATE TRIGGER check_main_Subject_status BEFORE INSERT ON Class
	FOR EACH ROW
    BEGIN 
		IF (SELECT `STATUS` FROM `Subject` WHERE CID = NEW.CCID) = 0 THEN
        SIGNAL SQLSTATE '45001' SET MESSAGE_TEXT = 'Môn học đang không trong trạng thái Mở.';
		END IF;
    END;
//
DELIMITER ;

-- Sinh viên ở trạng thái Đang học mới được đăng ký môn học
DROP TRIGGER IF EXISTS check_student_status;
DELIMITER //
CREATE TRIGGER check_student_status BEFORE INSERT ON Attend
	FOR EACH ROW
    BEGIN 
		IF (SELECT LearningStatus FROM Status WHERE SSID = NEW.ASTUDENTID AND SEMESTERSTATUS = NEW.ASEMESTER) != 0 THEN
        SIGNAL SQLSTATE '45001' SET MESSAGE_TEXT = 'Môn học đang không trong trạng thái Mở.';
		END IF;
    END;
//
DELIMITER ;

-- Ngày sinh không được sau thời điểm hiện tại.
DROP TRIGGER IF EXISTS check_birth_date;
DELIMITER //
CREATE TRIGGER check_birth_date BEFORE INSERT ON MemberOfEducationUnit
	FOR EACH ROW
    BEGIN 
		IF NEW.DOB > CURDATE() THEN
        SIGNAL SQLSTATE '45001' SET MESSAGE_TEXT = 'Ngày sinh không được sau thời điểm hiện tại.';
		END IF;
    END;
//
DELIMITER ;


-- Năm xuất bản giáo trình không được sau năm hiện tại.
DROP TRIGGER IF EXISTS check_publishing_year;
DELIMITER //
CREATE TRIGGER check_publishing_year BEFORE INSERT ON PublishingYear
	FOR EACH ROW
    BEGIN 
		IF NEW.PYEAR > YEAR(CURDATE()) THEN
        SIGNAL SQLSTATE '45001' SET MESSAGE_TEXT = 'Năm xuất bản giáo trình không được sau năm hiện tại.';
		END IF;
    END;
//
DELIMITER ;
