USE LEARNING_TEACHING_ACCOUNT;

DROP PROCEDURE IF EXISTS GET_ACCOUNT_ID;
DELIMITER \\
CREATE PROCEDURE GET_ACCOUNT_ID(id char(9))
BEGIN
    select USERID,USERNAME,PASSWORD from Account where Account.USERID=id;

END\\
DELIMITER ;

DROP PROCEDURE IF EXISTS GET_ACCOUNT_NAME;
DELIMITER \\
CREATE PROCEDURE GET_ACCOUNT_NAME(_USERNAME varchar(100))
BEGIN
    select USERID,USERNAME,PASSWORD from Account where Account.USERNAME=_USERNAME;

END\\
DELIMITER ;