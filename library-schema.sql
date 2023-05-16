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

CREATE TABLE users(
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

CREATE TABLE users_phone_number(
    phone_number VARCHAR(15) NOT NULL,
    user_id SMALLINT UNSIGNED NOT NULL,
    PRIMARY KEY(phone_number, user_id),
    CONSTRAINT fk_users_phone_number_users FOREIGN KEY(user_id) REFERENCES users(user_id) ON DELETE CASCADE ON UPDATE CASCADE
);

--
-- Table structure for table 'users_email'
--

CREATE TABLE users_email(
    email VARCHAR(45) NOT NULL,
    user_id SMALLINT UNSIGNED NOT NULL,
    PRIMARY KEY(email, user_id),
    CONSTRAINT fk_users_email_users FOREIGN KEY(user_id) REFERENCES users(user_id) ON DELETE CASCADE ON UPDATE CASCADE
);

--
-- Table structure for table 'administrator'
--

CREATE TABLE administrator(
    admin_user_id SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
    PRIMARY KEY(admin_user_id),
    CONSTRAINT fk_administrator_users FOREIGN KEY(admin_user_id) REFERENCES users(user_id) ON DELETE CASCADE ON UPDATE CASCADE
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
-- Table structure for table 'operator'
--

CREATE TABLE operators(
    operator_user_id SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
    admin_user_id SMALLINT UNSIGNED NOT NULL,
    school_id SMALLINT UNSIGNED NOT NULL,
    PRIMARY KEY(operator_user_id),
    CONSTRAINT fk_operators_users FOREIGN KEY(operator_user_id) REFERENCES users(user_id) ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT fk_operators_administrator FOREIGN KEY(admin_user_id) REFERENCES administrator(admin_user_id) ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT fk_operators_school_unit FOREIGN KEY(school_id) REFERENCES school_unit(school_id) ON DELETE RESTRICT ON UPDATE CASCADE
);
