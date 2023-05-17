SET
    @OLD_UNIQUE_CHECKS = @@UNIQUE_CHECKS,
    UNIQUE_CHECKS = 0;
SET
    @OLD_FOREIGN_KEY_CHECKS = @@FOREIGN_KEY_CHECKS,
    FOREIGN_KEY_CHECKS = 0;
SET
    @OLD_SQL_MODE = @@SQL_MODE,
    SQL_MODE = 'TRADITIONAL';
DROP
    SCHEMA IF EXISTS library;
CREATE SCHEMA library; USE
    library;
    
    --
    -- Table structure for table 'users'
    --

CREATE TABLE user(
    user_id SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
    username VARCHAR(45) NOT NULL,
    full_name VARCHAR(45) NOT NULL,
    PASSWORD VARCHAR(45) NOT NULL,
    date_of_birth DATE NOT NULL,
    PRIMARY KEY(user_id)
);

--
-- Table structure for table 'users_phone_number'
--

CREATE TABLE user_phone_number(
    phone_number VARCHAR(15) NOT NULL,
    user_id SMALLINT UNSIGNED NOT NULL,
    PRIMARY KEY(phone_number, user_id),
    CONSTRAINT fk_user_phone_number_user FOREIGN KEY(user_id) REFERENCES user(user_id) ON DELETE CASCADE ON UPDATE CASCADE
);

--
-- Table structure for table 'users_email'
--

CREATE TABLE user_email(
    email VARCHAR(45) NOT NULL,
    user_id SMALLINT UNSIGNED NOT NULL,
    PRIMARY KEY(email, user_id),
    CONSTRAINT fk_user_email_user FOREIGN KEY(user_id) REFERENCES user(user_id) ON DELETE CASCADE ON UPDATE CASCADE
);

--
-- Table structure for table 'administrator'
--

CREATE TABLE administrator(
    admin_user_id SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
    PRIMARY KEY(admin_user_id),
    CONSTRAINT fk_administrator_user FOREIGN KEY(admin_user_id) REFERENCES user(user_id) ON DELETE CASCADE ON UPDATE CASCADE
);

--
-- Table structure for tabel 'school_unit'
--

CREATE TABLE school_unit(
    school_id SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
    school_name VARCHAR(50) NOT NULL,
    address VARCHAR(80) NOT NULL,
    city VARCHAR(45) NOT NULL,
    school_director_full_name VARCHAR(45) NOT NULL,
    library_operator_full_name VARCHAR(45) NOT NULL,
    admin_user_id SMALLINT UNSIGNED NOT NULL,
    PRIMARY KEY(school_id),
    CONSTRAINT fk_school_unit_administrator FOREIGN KEY(admin_user_id) REFERENCES administrator(admin_user_id) ON DELETE RESTRICT ON UPDATE CASCADE
);

--
-- Table structure for table 'school_unit_phone_number'
--

CREATE TABLE school_unit_phone_number(
	phone_number VARCHAR(15) NOT NULL,
	school_id SMALLINT UNSIGNED NOT NULL,
	PRIMARY KEY(phone_number, school_id),
	CONSTRAINT fk_school_unit_phone_number_school_unit FOREIGN KEY(school_id) REFERENCES school_unit(school_id) ON DELETE CASCADE ON UPDATE CASCADE
);

--
-- Table structure for table 'school_unit_email'
--

CREATE TABLE school_unit_email(
	email VARCHAR(45) NOT NULL,
	school_id SMALLINT UNSIGNED NOT NULL,
	PRIMARY KEY(email, school_id),
	CONSTRAINT fk_school_unit_email_school_unit FOREIGN KEY(school_id) REFERENCES school_unit(school_id) ON DELETE CASCADE ON UPDATE CASCADE
);

--
-- Table structure for table 'operator'
--

CREATE TABLE operator(
    operator_user_id SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
    admin_user_id SMALLINT UNSIGNED NOT NULL,
    school_id SMALLINT UNSIGNED NOT NULL,
    PRIMARY KEY(operator_user_id),
    CONSTRAINT fk_operator_user FOREIGN KEY(operator_user_id) REFERENCES user(user_id) ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT fk_operator_administrator FOREIGN KEY(admin_user_id) REFERENCES administrator(admin_user_id) ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT fk_operator_school_unit FOREIGN KEY(school_id) REFERENCES school_unit(school_id) ON DELETE RESTRICT ON UPDATE CASCADE
);

--
-- Table structure for table 'student_professor'
--

CREATE TABLE student_professor(
	stud_prof_user_id SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
	role VARCHAR(10) NOT NULL,
	active_status VARCHAR(15) NOT NULL,
	approval_status VARCHAR(15) NOT NULL,
	operator_user_id SMALLINT UNSIGNED NOT NULL, 
	PRIMARY KEY(stud_prof_user_id),
	CONSTRAINT fk_student_professor_user FOREIGN KEY(stud_prof_user_id) REFERENCES user(user_id) ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT fk_student_professor_operator FOREIGN KEY(operator_user_id) REFERENCES operator(operator_user_id) ON DELETE RESTRICT ON UPDATE CASCADE
);

--
-- Table structure for tble 'borrower_card'
--

CREATE TABLE borrower_card(
	card_id SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
	issue_date DATE NOT NULL,
	expiry_date DATE NOT NULL,
	stud_prof_user_id SMALLINT UNSIGNED NOT NULL,
	operator_user_id SMALLINT UNSIGNED NOT NULL,
	PRIMARY KEY(card_id),
	CONSTRAINT fk_borrower_card_student_professor FOREIGN KEY(stud_prof_user_id) REFERENCES student_professor(stud_prof_user_id) ON DELETE RESTRICT ON UPDATE CASCADE,
	CONSTRAINT fk_borrower_card_operator FOREIGN KEY(operator_user_id) REFERENCES operator(operator_user_id) ON DELETE RESTRICT ON UPDATE CASCADE
);
