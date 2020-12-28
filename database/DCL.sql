USE Learning_Teaching;

DROP USER IF EXISTS 'trainingbureau'@'localhost';
CREATE USER 'trainingbureau'@'localhost' IDENTIFIED BY 'trainingbureau';

###### câp nhât đăng ký môn học
GRANT EXECUTE ON PROCEDURE Learning_Teaching.them_lop TO 'trainingbureau'@'localhost';
GRANT EXECUTE ON PROCEDURE Learning_Teaching.xoa_lop TO 'trainingbureau'@'localhost';
GRANT EXECUTE ON PROCEDURE Learning_Teaching.cap_nhat_lop TO 'trainingbureau'@'localhost';

#### xem thông tin của một lớp học
GRANT EXECUTE ON PROCEDURE Learning_Teaching.xem_ds_sv_dk_1_lop TO 'trainingbureau'@'localhost';
GRANT EXECUTE ON PROCEDURE Learning_Teaching.xem_ds_gv_cua_1_lop TO 'trainingbureau'@'localhost';
GRANT EXECUTE ON PROCEDURE Learning_Teaching.xem_tong_sv_dk_1_lop TO 'trainingbureau'@'localhost';

###### xem danh sách lop của một sinh viên hoặc học sinh
GRANT EXECUTE ON PROCEDURE Learning_Teaching.xem_ds_lop_cua_1_sv TO 'trainingbureau'@'localhost';
GRANT EXECUTE ON PROCEDURE Learning_Teaching.xem_ds_lop_cua_1_gv TO 'trainingbureau'@'localhost';

###### xem thông tin mỗi môn học được mở
GRANT EXECUTE ON PROCEDURE Learning_Teaching.xem_ds_mon_hoc_dk TO 'trainingbureau'@'localhost';
GRANT EXECUTE ON PROCEDURE Learning_Teaching.xem_tong_sv_dk_1_mon_hoc TO 'trainingbureau'@'localhost';
GRANT EXECUTE ON PROCEDURE Learning_Teaching.LIST_SUBJECT_SEMESTER TO 'trainingbureau'@'localhost';

## thống kê của mỗi khoa
GRANT EXECUTE ON PROCEDURE Learning_Teaching.xem_tong_mon_hoc TO 'trainingbureau'@'localhost';
GRANT EXECUTE ON PROCEDURE Learning_Teaching.xem_tong_lop TO 'trainingbureau'@'localhost';
GRANT EXECUTE ON PROCEDURE Learning_Teaching.xem_tong_sv_dk TO 'trainingbureau'@'localhost';




#########################################
DROP USER IF EXISTS 'faculty'@'localhost';
CREATE USER 'faculty'@'localhost' IDENTIFIED BY 'faculty';
GRANT EXECUTE ON PROCEDURE Learning_Teaching.xem_ds_lop_cua_1_gv TO 'faculty'@'localhost';
GRANT EXECUTE ON PROCEDURE Learning_Teaching.xem_ds_sv_dk_1_lop TO 'faculty'@'localhost';
GRANT EXECUTE ON PROCEDURE Learning_Teaching.xem_ds_sv_dk_1_lop TO 'faculty'@'localhost';
GRANT EXECUTE ON PROCEDURE Learning_Teaching.UPDATE_LECTURER_CLASS TO 'faculty'@'localhost';
GRANT EXECUTE ON PROCEDURE Learning_Teaching.UPDATE_SUBJECT_STATUS TO 'faculty'@'localhost';
GRANT EXECUTE ON PROCEDURE Learning_Teaching.LIST_SUBCLASS_SEMESTER_FACULTY TO 'faculty'@'localhost';
GRANT EXECUTE ON PROCEDURE Learning_Teaching.LIST_CLASS_OF_LECTURER_SEMESTER_FACULTY TO 'faculty'@'localhost';
GRANT EXECUTE ON PROCEDURE Learning_Teaching.xem_giao_trinh_mon_hoc_khoa TO 'faculty'@'localhost';
GRANT EXECUTE ON PROCEDURE Learning_Teaching.xem_tong_lop TO 'faculty'@'localhost';
GRANT EXECUTE ON PROCEDURE Learning_Teaching.xem_tong_sv_dk TO 'faculty'@'localhost';
GRANT EXECUTE ON PROCEDURE Learning_Teaching.them_mon_hoc TO 'faculty'@'localhost';
GRANT EXECUTE ON PROCEDURE Learning_Teaching.xoa_mon_hoc TO 'faculty'@'localhost';
GRANT EXECUTE ON PROCEDURE Learning_Teaching.cap_nhat_mon_hoc TO 'faculty'@'localhost';
GRANT EXECUTE ON PROCEDURE Learning_Teaching.them_gv_phu_trach TO 'faculty'@'localhost';
GRANT EXECUTE ON PROCEDURE Learning_Teaching.xoa_gv_phu_trach TO 'faculty'@'localhost';
GRANT EXECUTE ON PROCEDURE Learning_Teaching.cap_nhat_gv_phu_trach TO 'faculty'@'localhost';
GRANT EXECUTE ON PROCEDURE Learning_Teaching.xem_ds_mon_hoc TO 'faculty'@'localhost';
GRANT EXECUTE ON PROCEDURE Learning_Teaching.xem_ds_giang_vien TO 'faculty'@'localhost';
GRANT EXECUTE ON PROCEDURE Learning_Teaching.xem_top_mon_hoc_nhieu_gv_phu_trach TO 'faculty'@'localhost';
GRANT EXECUTE ON PROCEDURE Learning_Teaching.xem_tb_sv_dk_mon_hoc TO 'faculty'@'localhost';

################################################
DROP USER IF EXISTS 'lecturer'@'localhost';
CREATE USER 'lecturer'@'localhost' IDENTIFIED BY 'lecturer';
GRANT EXECUTE ON PROCEDURE Learning_Teaching.them_textbook_chinh TO 'lecturer'@'localhost';
GRANT EXECUTE ON PROCEDURE Learning_Teaching.xem_textbook_mon_hoc_pt TO 'lecturer'@'localhost';
GRANT EXECUTE ON PROCEDURE Learning_Teaching.xoa_textbook_theo_ten TO 'lecturer'@'localhost';
GRANT EXECUTE ON PROCEDURE Learning_Teaching.xoa_textbook_theo_ma_mh TO 'lecturer'@'localhost';
GRANT EXECUTE ON PROCEDURE Learning_Teaching.xem_ds_lop_mon_hoc_pt TO 'lecturer'@'localhost';
GRANT EXECUTE ON PROCEDURE Learning_Teaching.xem_ds_lop_pt TO 'lecturer'@'localhost';
GRANT EXECUTE ON PROCEDURE Learning_Teaching.xem_ds_sv_pt TO 'lecturer'@'localhost';
GRANT EXECUTE ON PROCEDURE Learning_Teaching.xem_ds_mon_hoc_textbook_pt TO 'lecturer'@'localhost';
GRANT EXECUTE ON PROCEDURE Learning_Teaching.xem_tong_sv_moi_lop_pt TO 'lecturer'@'localhost';
GRANT EXECUTE ON PROCEDURE Learning_Teaching.xem_so_lop_pt_gan_day TO 'lecturer'@'localhost';
GRANT EXECUTE ON PROCEDURE Learning_Teaching.xem_top_5_lop_sv_cao_nhat_pt TO 'lecturer'@'localhost';
GRANT EXECUTE ON PROCEDURE Learning_Teaching.xem_top_5_hk_lop_nhieu_nhat_pt TO 'lecturer'@'localhost';




#########################################
DROP USER IF EXISTS 'student'@'localhost';
CREATE USER 'student'@'localhost' IDENTIFIED BY 'student';
GRANT EXECUTE ON PROCEDURE Learning_Teaching.xem_mon_hoc_dk TO 'student'@'localhost';
GRANT EXECUTE ON PROCEDURE Learning_Teaching.xem_textbook_dk TO 'student'@'localhost';
GRANT EXECUTE ON PROCEDURE Learning_Teaching.xem_ds_lop_dk TO 'student'@'localhost';
GRANT EXECUTE ON PROCEDURE Learning_Teaching.xem_ds_lop_dk_hon_1_gv TO 'student'@'localhost';
GRANT EXECUTE ON PROCEDURE Learning_Teaching.xem_tong_tin_chi_dk TO 'student'@'localhost';
GRANT EXECUTE ON PROCEDURE Learning_Teaching.xem_tong_mon_hoc_dk TO 'student'@'localhost';
GRANT EXECUTE ON PROCEDURE Learning_Teaching.xem_top_3_hk_tong_tin_chi_cao_nhat TO 'student'@'localhost';
GRANT EXECUTE ON PROCEDURE Learning_Teaching.DANGKY TO 'student'@'localhost';
GRANT EXECUTE ON PROCEDURE Learning_Teaching.LIST_SUBCLASS_ATTEND TO 'student'@'localhost';
GRANT EXECUTE ON PROCEDURE Learning_Teaching.LIST_SUBCLASS_OF_SUBJECT_ATTEND_LEAST_1_LECTURE TO 'student'@'localhost';
GRANT EXECUTE ON PROCEDURE Learning_Teaching.LIST_SUBJECT_ATTEND TO 'student'@'localhost';
GRANT EXECUTE ON PROCEDURE Learning_Teaching.LIST_SUBJECT_SEMESTER TO 'student'@'localhost';
GRANT EXECUTE ON PROCEDURE Learning_Teaching.SUM_No_Registered_Credits_ONE_SEMESTER TO 'student'@'localhost';
GRANT EXECUTE ON PROCEDURE Learning_Teaching.GET3_Nocreadit_semeter TO 'student'@'localhost';
GRANT EXECUTE ON PROCEDURE Learning_Teaching.SUM_SUBJECT_ATTEND TO 'student'@'localhost';
GRANT EXECUTE ON PROCEDURE Learning_Teaching.SUBJECT_SEMESTER_BY_CID TO 'student'@'localhost';
GRANT EXECUTE ON PROCEDURE Learning_Teaching.SUM_No_Registered_Credits_ALL_SEMESTER TO 'student'@'localhost';
GRANT EXECUTE ON PROCEDURE Learning_Teaching.GET_STUDENT TO 'student'@'localhost';
GRANT EXECUTE ON PROCEDURE Learning_Teaching.Delete_Attend TO 'student'@'localhost';
GRANT EXECUTE ON PROCEDURE Learning_Teaching.GET_STUDENT TO 'student'@'localhost';

