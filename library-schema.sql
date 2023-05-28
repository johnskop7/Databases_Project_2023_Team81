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
    CONSTRAINT fk_school_unit_administrator FOREIGN KEY(administrator_id) REFERENCES administrator(administrator_id) ON UPDATE CASCADE
);

--
-- Table structure for table 'operator'
--

CREATE TABLE operator(
    operator_id SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
    username VARCHAR(45) NOT NULL,
    password VARCHAR(45) NOT NULL,
    fullname VARCHAR(45) NOT NULL,
    email VARCHAR(45) NOT NULL,
    phone_number VARCHAR(45) NOT NULL,
    school_id SMALLINT UNSIGNED NOT NULL,
    administrator_id SMALLINT UNSIGNED NOT NULL,
    PRIMARY KEY(operator_id),
    CONSTRAINT fk_operator_administrator FOREIGN KEY(administrator_id) REFERENCES administrator(administrator_id) ON UPDATE CASCADE,
    CONSTRAINT fk_operator_school_unit FOREIGN KEY(school_id) REFERENCES school_unit(school_id) ON DELETE RESTRICT ON UPDATE CASCADE
);

--
-- Table structure for table 'student_professor'
--

CREATE TABLE student_professor(
	stud_prof_id SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
    fullname VARCHAR(45) NOT NULL,
    username VARCHAR(45) NOT NULL,
    password VARCHAR(45) NOT NULL,
    email VARCHAR(45) NOT NULL,
    phone_number VARCHAR(45) NOT NULL,
    date_of_birth DATE,
	role ENUM ("student", "professor"),
	approval_status ENUM ('approved','not approved'),
	operator_id SMALLINT UNSIGNED NOT NULL, 
    -- school_id SMALLINT UNSIGNED NOT NULL,
	PRIMARY KEY(stud_prof_id),
	CONSTRAINT fk_student_professor_operator FOREIGN KEY(operator_id) REFERENCES operator(operator_id) ON DELETE RESTRICT ON UPDATE CASCADE
	-- CONSTRAINT fk_student_school_unit FOREIGN KEY(school_id) REFERENCES school_unit(school_id) ON DELETE CASCADE ON UPDATE CASCADE

);

--
-- Table structure for table 'borrower_card'
--

CREATE TABLE borrower_card(
	card_id SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
	issue_date DATE NOT NULL,
	expiry_date DATE NOT NULL,
	stud_prof_id SMALLINT UNSIGNED NOT NULL,
	operator_id SMALLINT UNSIGNED NOT NULL,
	PRIMARY KEY(card_id),
	CONSTRAINT fk_borrower_card_student_professor FOREIGN KEY(stud_prof_id) REFERENCES student_professor(stud_prof_id) ON DELETE RESTRICT ON UPDATE CASCADE,
	CONSTRAINT fk_borrower_card_operator FOREIGN KEY(operator_id) REFERENCES operator(operator_id) ON DELETE RESTRICT ON UPDATE CASCADE
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
  stud_prof_id SMALLINT UNSIGNED NOT NULL,
  -- operator_id SMALLINT UNSIGNED NOT NULL,
  rating DECIMAL(1,0) CHECK(rating>0 AND rating<6 ),
  review_date DATE,
  review_text TEXT,
  status ENUM('approved', 'not yet approved', 'denied'),
  PRIMARY KEY (review_id, book_id, stud_prof_id),
  CONSTRAINT fk_reviews_book FOREIGN KEY (book_id) REFERENCES book(book_id) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT fk_reviews_student_professor_book FOREIGN KEY (stud_prof_id) REFERENCES student_professor(stud_prof_id) ON DELETE RESTRICT ON UPDATE CASCADE
  -- CONSTRAINT fk_reviews_operator FOREIGN KEY (operator_id) REFERENCES operator(operator_id) ON DELETE RESTRICT ON UPDATE CASCADE
);

--
-- Table structure for table 'reservations'
--

CREATE TABLE reservations (
  reservation_id SMALLINT UNSIGNED NOT NULL auto_increment,
  book_id SMALLINT UNSIGNED NOT NULL,
  stud_prof_id SMALLINT UNSIGNED NOT NULL,
  -- operator_id SMALLINT UNSIGNED NOT NULL,
  reservation_date DATE,
  expiry_date DATE,
  status ENUM('expired', 'active'),
  PRIMARY KEY (reservation_id, book_id, stud_prof_id),
  CONSTRAINT fk_reservations_book FOREIGN KEY (book_id) REFERENCES book(book_id) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT fk_reservations_student_professor_book FOREIGN KEY (stud_prof_id) REFERENCES student_professor(stud_prof_id) ON DELETE RESTRICT ON UPDATE CASCADE
  -- CONSTRAINT fk_reservations_operator FOREIGN KEY (operator_id) REFERENCES operator(operator_id) ON DELETE RESTRICT ON UPDATE CASCADE
);

--
-- Table structure for table 'book-borrowing'
--

CREATE TABLE book_borrowing (
  borrowing_id SMALLINT UNSIGNED NOT NULL auto_increment,
  borrowing_date DATE NOT NULL,
  return_date DATE NOT NULL,
  actual_return_date DATE,
  book_id SMALLINT UNSIGNED NOT NULL,
  stud_prof_id SMALLINT UNSIGNED NOT NULL,
  -- operator_id SMALLINT UNSIGNED NOT NULL,
  PRIMARY KEY (borrowing_id, book_id, stud_prof_id),
  CONSTRAINT fk_book_borrowing_book FOREIGN KEY (book_id) REFERENCES book(book_id) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT fk_book_borrowing_student_professor_book FOREIGN KEY (stud_prof_id) REFERENCES student_professor(stud_prof_id) ON DELETE RESTRICT ON UPDATE CASCADE
  -- CONSTRAINT fk_book_borrowing_operator FOREIGN KEY (operator_id) REFERENCES operator(operator_id) ON DELETE RESTRICT ON UPDATE CASCADE
);


-- QUERIES
-- 3.1.7) Find all the authors that have written five or less books than the author with the most books
CREATE VIEW authors_with_five_or_less AS
SELECT ba.author, COUNT(b.book_id) AS book_count
FROM book_authors ba
JOIN book b ON ba.book_id = b.book_id
GROUP BY ba.author
HAVING COUNT(b.book_id) <= (
    SELECT MAX(book_count) - 5
    FROM (
        SELECT COUNT(b.book_id) AS book_count
        FROM book_authors ba
        JOIN book b ON ba.book_id = b.book_id
        GROUP BY ba.author
    ) AS subquery
);

-- 3.1.2) For a specific book category, find all the authors of this category and the professors that have borrowed a book of that category the last year
-- CREATE PROCEDURE authors_of_category (thematic_category VARCHAR(255)) 
-- SELECT DISTINCT ba.author 
-- FROM book_authors ba 
-- JOIN book b ON ba.book_id = b.book_id 
-- JOIN book_thematic_categories btc ON b.book_id = btc.book_id 
-- WHERE btc.thematic_category = thematic_category ;







