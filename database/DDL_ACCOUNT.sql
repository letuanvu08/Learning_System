drop database if exists LEARNING_TEACHING_ACCOUNT;
CREATE DATABASE LEARNING_TEACHING_ACCOUNT;
USE  LEARNING_TEACHING_ACCOUNT;
create table Account
(
    USERID   char(9)      not null,
    USERNAME NVARCHAR(100) not null,
    PASSWORD NVARCHAR(100) not null,
    primary key (USERID, USERNAME),
    constraint USERNAME
        unique (USERNAME)
);