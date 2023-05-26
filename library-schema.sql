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
CREATE SCHEMA library; 
USE library;
    
    --
    -- Table structure for table 'users'
    --

CREATE TABLE user(
    user_id SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
    username VARCHAR(45) NOT NULL,
    full_name VARCHAR(45) NOT NULL,
    PASSWORD VARCHAR(20) NOT NULL,
    date_of_birth DATE NOT NULL CHECK (date_of_birth < '2017-01-01'),
    email VARCHAR(45) NOT NULL,
    phone_number VARCHAR(45),
    PRIMARY KEY(user_id)
);

--
-- Table structure for table 'administrator'
--

CREATE TABLE administrator(
    administrator_id SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
    username VARCHAR(45) NOT NULL, 
    password VARCHAR(20) NOT NULL,
    PRIMARY KEY(administrator_id)
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
    email VARCHAR(45) NOT NULL,
    phone_number VARCHAR(45) NOT NULL,
    administrator_id SMALLINT UNSIGNED NOT NULL,
    PRIMARY KEY(school_id),
    CONSTRAINT fk_school_unit_administrator FOREIGN KEY(administrator_id) REFERENCES administrator(administrator_id) ON DELETE RESTRICT ON UPDATE CASCADE
);

--
-- Table structure for table 'operator'
--

CREATE TABLE operator(
    operator_user_id SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
    administrator_id SMALLINT UNSIGNED NOT NULL,
    school_id SMALLINT UNSIGNED NOT NULL,
    PRIMARY KEY(operator_user_id),
    CONSTRAINT fk_operator_user FOREIGN KEY(operator_user_id) REFERENCES user(user_id) ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT fk_operator_administrator FOREIGN KEY(administrator_id) REFERENCES administrator(administrator_id) ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT fk_operator_school_unit FOREIGN KEY(school_id) REFERENCES school_unit(school_id) ON DELETE RESTRICT ON UPDATE CASCADE
);

--
-- Table structure for table 'student_professor'
--

CREATE TABLE student_professor(
	stud_prof_user_id SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
	role ENUM ("student", "professor"),
	active_status VARCHAR(15) NOT NULL,
	approval_status VARCHAR(15) NOT NULL,
	operator_user_id SMALLINT UNSIGNED NOT NULL, 
    school_id SMALLINT UNSIGNED NOT NULL,
	PRIMARY KEY(stud_prof_user_id),
	CONSTRAINT fk_student_professor_user FOREIGN KEY(stud_prof_user_id) REFERENCES user(user_id) ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT fk_student_professor_operator FOREIGN KEY(operator_user_id) REFERENCES operator(operator_user_id) ON DELETE RESTRICT ON UPDATE CASCADE,
	CONSTRAINT fk_student_school_unit FOREIGN KEY(school_id) REFERENCES school_unit(school_id) ON DELETE CASCADE ON UPDATE CASCADE

);

--
-- Table structure for table 'borrower_card'
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

--
-- Table structure for table 'book'
--

CREATE TABLE book (
  book_id SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
  school_id SMALLINT UNSIGNED NOT NULL,
  title VARCHAR(255) NOT NULL,
  publisher VARCHAR(255) NOT NULL,
  ISBN VARCHAR(20) NOT NULL,
  number_of_pages SMALLINT UNSIGNED NOT NULL,
  image VARCHAR(255) NOT NULL,
  language VARCHAR(50) NOT NULL,
  available_copies SMALLINT UNSIGNED,
  summary TEXT,
  key_words TEXT,
  PRIMARY KEY (book_id),
  CONSTRAINT fk_book_school_unit FOREIGN KEY (school_id) REFERENCES school_unit(school_id) ON DELETE RESTRICT ON UPDATE CASCADE
);

--
-- Table structure for table 'book_thematic_categories'
--

CREATE TABLE book_thematic_categories (
  book_id SMALLINT UNSIGNED NOT NULL,
  thematic_category VARCHAR(255) NOT NULL,
  PRIMARY KEY (thematic_category,book_id),
  CONSTRAINT fk_book_thematic_categories_book FOREIGN KEY (book_id) REFERENCES book(book_id) ON DELETE RESTRICT ON UPDATE CASCADE
);

--
-- Table structure for table 'book_authors'
--

CREATE TABLE book_authors (
  book_id SMALLINT UNSIGNED NOT NULL,
  author VARCHAR(255) NOT NULL,
  PRIMARY KEY (book_id, author),
  CONSTRAINT fk_book_authors_book FOREIGN KEY (book_id) REFERENCES book(book_id) ON DELETE RESTRICT ON UPDATE CASCADE
);

--
-- Table structure for table 'reviews'
--

CREATE TABLE reviews (
  review_id SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
  book_id SMALLINT UNSIGNED NOT NULL,
  stud_prof_user_id SMALLINT UNSIGNED NOT NULL,
  operator_user_id SMALLINT UNSIGNED NOT NULL,
  rating DECIMAL(1,0) CHECK(rating>0 AND rating<6 ),
  review_date DATE,
  review_text TEXT,
  status ENUM('approved', 'not yet approved', 'denied'),
  PRIMARY KEY (review_id, book_id, stud_prof_user_id),
  CONSTRAINT fk_reviews_book FOREIGN KEY (book_id) REFERENCES book(book_id) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT fk_reviews_student_professor_book FOREIGN KEY (stud_prof_user_id) REFERENCES student_professor(stud_prof_user_id) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT fk_reviews_operator FOREIGN KEY (operator_user_id) REFERENCES operator(operator_user_id) ON DELETE RESTRICT ON UPDATE CASCADE
);

--
-- Table structure for table 'reservations'
--

CREATE TABLE reservations (
  reservation_id SMALLINT UNSIGNED NOT NULL auto_increment,
  book_id SMALLINT UNSIGNED NOT NULL,
  stud_prof_user_id SMALLINT UNSIGNED NOT NULL,
  operator_user_id SMALLINT UNSIGNED NOT NULL,
  reservation_date DATE,
  expiry_date DATE,
  status ENUM('expired', 'active'),
  PRIMARY KEY (reservation_id, book_id, stud_prof_user_id),
  CONSTRAINT fk_reservations_book FOREIGN KEY (book_id) REFERENCES book(book_id) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT fk_reservations_student_professor_book FOREIGN KEY (stud_prof_user_id) REFERENCES student_professor(stud_prof_user_id) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT fk_reservations_operator FOREIGN KEY (operator_user_id) REFERENCES operator(operator_user_id) ON DELETE RESTRICT ON UPDATE CASCADE
);

--
-- Table structure for table 'book-borrowing'
--

CREATE TABLE book_borrowing (
  borrowing_id SMALLINT UNSIGNED NOT NULL auto_increment,
  book_id SMALLINT UNSIGNED NOT NULL,
  stud_prof_user_id SMALLINT UNSIGNED NOT NULL,
  operator_user_id SMALLINT UNSIGNED NOT NULL,
  borrowing_date DATE,
  return_date DATE,
  actual_return_date DATE,
  status ENUM('active', 'delayed_return', 'returned_on_time'),
  PRIMARY KEY (borrowing_id, book_id, stud_prof_user_id),
  CONSTRAINT fk_book_borrowing_book FOREIGN KEY (book_id) REFERENCES book(book_id) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT fk_book_borrowing_student_professor_book FOREIGN KEY (stud_prof_user_id) REFERENCES student_professor(stud_prof_user_id) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT fk_book_borrowing_operator FOREIGN KEY (operator_user_id) REFERENCES operator(operator_user_id) ON DELETE RESTRICT ON UPDATE CASCADE
);







