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




--
-- QUERIES
--

--
-- Administrator
--

--
-- 3.1.1) List with the total number of loans per school (Search criteria: year, calendar month, e.g. January).
--

CREATE VIEW book_borrowings_per_school_unit AS
SELECT new.borrowing_id, new.book_id, s.school_name, new.borrowing_date
FROM
    (
    SELECT
        br.borrowing_id,
        b.book_id,
        b.school_id,
        br.borrowing_date
    FROM
        book b
    JOIN book_borrowing br ON
        b.book_id = br.book_id
) new
JOIN school_unit s ON
    s.school_id = new.school_id;


DELIMITER $$
CREATE PROCEDURE book_borrowings_count_per_school (IN month SMALLINT, IN year SMALLINT)
BEGIN
    IF month IS NULL AND year IS NULL THEN
        SELECT school_name, COUNT(borrowing_id) FROM book_borrowings_per_school_unit GROUP BY school_name;
    ELSEIF month IS NULL THEN
        SELECT school_name, COUNT(borrowing_id) FROM book_borrowings_per_school_unit WHERE YEAR(borrowing_date) = year GROUP BY school_name;
    ELSEIF year IS NULL THEN
        SELECT school_name, COUNT(borrowing_id) FROM book_borrowings_per_school_unit WHERE MONTH(borrowing_date) = month GROUP BY school_name;
    ELSE
        SELECT school_name, COUNT(borrowing_id) FROM book_borrowings_per_school_unit WHERE MONTH(borrowing_date) = month AND YEAR(borrowing_date) = year GROUP BY school_name;
    END IF;
END $$
DELIMITER ;


--
-- 3.1.2) For a given book category (user-selected), which authors belong to it and which teachers have borrowed books from that category in the last year?
--

DELIMITER $$
CREATE PROCEDURE authors_belong_to_category (IN category VARCHAR(30))
BEGIN
	SELECT DISTINCT a.author
	FROM book_authors a
	JOIN book_thematic_categories c
       	ON a.book_id = c.book_id
        WHERE c.thematic_category = category;
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE teachers_borrowed_books_from_category (IN category VARCHAR(30))
BEGIN   
	SELECT DISTINCT fullname
	FROM student_professor
	WHERE stud_prof_id in
	(SELECT DISTINCT br.stud_prof_id
	FROM book_borrowing br
	JOIN book_thematic_categories c
	ON br.book_id = c.book_id
	WHERE c.thematic_category = category
        AND YEAR(br.borrowing_date) = YEAR(CURDATE()))
	AND role = 'professor';
END $$
DELIMITER ;


--
-- 3.1.3) Find all the professors under the age of 40 that have borrowed the most books and the number of the books
--

CREATE VIEW prof_with_most_borrowings AS
SELECT sp.stud_prof_id, COUNT(bb.book_id) AS num_borrowed
FROM student_professor sp
JOIN book_borrowing bb ON sp.stud_prof_id = bb.stud_prof_id
WHERE sp.role = 'professor' AND TIMESTAMPDIFF(YEAR, sp.date_of_birth, CURDATE()) < 40
GROUP BY sp.stud_prof_id
HAVING COUNT(bb.book_id) = (
  SELECT COUNT(bb2.book_id) AS max_books
  FROM student_professor sp2
  JOIN book_borrowing bb2 ON sp2.stud_prof_id = bb2.stud_prof_id
  WHERE sp2.role = 'professor' AND TIMESTAMPDIFF(YEAR, sp2.date_of_birth, CURDATE()) < 40
  GROUP BY sp2.stud_prof_id
  ORDER BY max_books DESC
  LIMIT 1
);


--
-- 3.1.4) Find all the authors whose books have never been borrowed
--

CREATE VIEW authors_with_no_borrowing AS
SELECT DISTINCT ba.author
FROM book_authors ba
WHERE ba.book_id IN (
  SELECT book_id
  FROM book
  WHERE book_id NOT IN (SELECT book_id FROM book_borrowing)
)
AND ba.author NOT IN (
  SELECT DISTINCT ba2.author
  FROM book_authors ba2
  JOIN book_borrowing bb ON ba2.book_id = bb.book_id
);


--
-- 3.1.5) Find the operators that have loaned the most books(>20) in a span of a year
--

CREATE VIEW oper_with_same_loans AS
SELECT bo.operator_id, COUNT(bb.book_id) AS num_borrowed
FROM book_borrowing bb
JOIN student_professor sp ON bb.stud_prof_id = sp.stud_prof_id
JOIN operator bo ON sp.operator_id = bo.operator_id
WHERE YEAR(bb.borrowing_date) = YEAR(CURDATE()) AND DATEDIFF(CURDATE(), bb.borrowing_date) <= 365
GROUP BY bo.operator_id
HAVING num_borrowed > 20
ORDER BY num_borrowed DESC;


--
-- 3.1.6) Many books cover more than one category. Among field pairs (e.g., history and poetry) that are common in books, find the top-3 pairs that appeared in borrowings.
--

CREATE VIEW top_3_pairs AS
SELECT th.Category1, th.Category2, COUNT(*) AS Score
FROM (SELECT c1.book_id, c1.thematic_category AS Category1, c2.thematic_category AS Category2
FROM book_thematic_categories c1
JOIN book_thematic_categories c2
ON c1.book_id = c2.book_id AND c1.thematic_category > c2.thematic_category) th
JOIN book_borrowing br
ON th.book_id = br.book_id
GROUP BY th.Category1, th.Category2
ORDER BY Score DESC LIMIT 3;


--
-- 3.1.7) Find all the authors that have written five or less books than the author with the most books
--

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



--
-- Operator
--

--
-- 3.2.1) All books by Title, Author (Search criteria: title/ category/ author/ copies).
--

CREATE VIEW book_info_3_joins AS
SELECT b.book_id, b.school_id , b.title, GROUP_CONCAT(DISTINCT a.author) AS author, GROUP_CONCAT(DISTINCT c.thematic_category) AS thematic_category, b.available_copies 
FROM book b
JOIN book_authors a
ON b.book_id = a.book_id
JOIN book_thematic_categories c
ON b.book_id = c.book_id
GROUP BY b.book_id;


DELIMITER $$
CREATE PROCEDURE list_title_authors(IN School_id1 SMALLINT UNSIGNED, IN Title1 VARCHAR(100), IN Category1 VARCHAR(30), IN Author1 VARCHAR(70), Copies1 SMALLINT UNSIGNED) 
BEGIN 
	IF Title1 IS NULL AND Category1 IS NULL AND Author1 IS NULL AND Copies1 IS NULL THEN
              SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'At least one field is required';
	ELSEIF Title1 IS NOT NULL AND Category1 IS NULL AND Author1 IS NULL AND Copies1 IS NULL THEN
		SELECT title, GROUP_CONCAT(DISTINCT author)
                FROM book_info_3_joins
                WHERE school_id = School_id1
                AND (title LIKE CONCAT('%', Title1, '%'))
		GROUP BY book_id;
	ELSEIF Title1 IS NULL AND Category1 IS NOT NULL AND Author1 IS NULL AND Copies1 IS NULL THEN
		SELECT title, GROUP_CONCAT(DISTINCT author)
                FROM book_info_3_joins
                WHERE school_id = School_id1
                AND (thematic_category LIKE CONCAT('%', Category1, '%'))
                GROUP BY book_id;
	ELSEIF Title1 IS NULL AND Category1 IS NULL AND Author1 IS NOT NULL AND Copies1 IS NULL THEN
		SELECT title, GROUP_CONCAT(DISTINCT author)
                FROM book_info_3_joins
                WHERE school_id = School_id1
                AND (author LIKE CONCAT('%', Author1, '%'))
                GROUP BY book_id;
	ELSEIF Title1 IS NULL AND Category1 IS NULL AND Author1 IS NULL AND Copies1 IS NOT NULL THEN
		SELECT title, author
		FROM book_info_3_joins
		WHERE school_id = School_id1
		AND (available_copies = Copies1);
                
	ELSEIF Title1 IS NOT NULL AND Category1 IS NOT NULL AND Author1 IS NULL AND Copies1 IS NULL THEN
		SELECT title, GROUP_CONCAT(DISTINCT author)
                FROM book_info_3_joins
                WHERE school_id = School_id1
                AND (title LIKE CONCAT('%', Title1, '%'))
                AND (thematic_category LIKE CONCAT('%', Category1, '%'))
                GROUP BY book_id;
	ELSEIF Title1 IS NULL AND Category1 IS NOT NULL AND Author1 IS NOT NULL AND Copies1 IS NULL THEN
		SELECT title, GROUP_CONCAT(DISTINCT author)
                FROM book_info_3_joins
                WHERE school_id = School_id1
                AND (thematic_category LIKE CONCAT('%', Category1, '%'))
                AND (author LIKE CONCAT('%', Author1, '%'))
                GROUP BY book_id;
	ELSEIF Title1 IS NULL AND Category1 IS NULL AND Author1 IS NOT NULL AND Copies1 IS NOT NULL THEN
		SELECT title, GROUP_CONCAT(DISTINCT author)
                FROM book_info_3_joins
                WHERE school_id = School_id1
                AND (author LIKE CONCAT('%', Author1, '%'))
                AND (available_copies = Copies1)
                GROUP BY book_id;
	ELSEIF Title1 IS NOT NULL AND Category1 IS NULL AND Author1 IS NOT NULL AND Copies1 IS NULL THEN
		SELECT title, GROUP_CONCAT(DISTINCT author)
                FROM book_info_3_joins
                WHERE school_id = School_id1
                AND (title LIKE CONCAT('%', Title1, '%'))
                AND (author LIKE CONCAT('%', Author1, '%'))
                GROUP BY book_id;
	ELSEIF Title1 IS NOT NULL AND Category1 IS NULL AND Author1 IS NULL AND Copies1 IS NOT NULL THEN
		SELECT title, GROUP_CONCAT(DISTINCT author)
                FROM book_info_3_joins
                WHERE school_id = School_id1
                AND (title LIKE CONCAT('%', Title1, '%'))
                AND (available_copies = Copies1)
                GROUP BY book_id;
	ELSEIF Title1 IS NULL AND Category1 IS NOT NULL AND Author1 IS NULL AND Copies1 IS NOT NULL THEN
		SELECT title, GROUP_CONCAT(DISTINCT author)
                FROM book_info_3_joins
                WHERE school_id = School_id1
                AND (thematic_category LIKE CONCAT('%', Category1, '%'))
                AND (available_copies = Copies1)
                GROUP BY book_id;
	ELSEIF Title1 IS NOT NULL AND Category1 IS NOT NULL AND Author1 IS NOT NULL AND Copies1 IS NULL THEN
		SELECT title, GROUP_CONCAT(DISTINCT author)
                FROM book_info_3_joins
                WHERE school_id = School_id1
                AND (title LIKE CONCAT('%', Title1, '%'))
                AND (thematic_category LIKE CONCAT('%', Category1, '%'))
                AND (author LIKE CONCAT('%', Author1, '%'))
                GROUP BY book_id;
	ELSEIF Title1 IS NULL AND Category1 IS NOT NULL AND Author1 IS NOT NULL AND Copies1 IS NOT NULL THEN
		SELECT title, GROUP_CONCAT(DISTINCT author)
                FROM book_info_3_joins
                WHERE school_id = School_id1
                AND (thematic_category LIKE CONCAT('%', Category1, '%'))
                AND (author LIKE CONCAT('%', Author1, '%'))
                AND (available_copies = Copies1)
                GROUP BY book_id;
	ELSEIF Title1 IS NOT NULL AND Category1 IS NULL AND Author1 IS NOT NULL AND Copies1 IS NOT NULL THEN
		SELECT title, GROUP_CONCAT(DISTINCT author)
                FROM book_info_3_joins
                WHERE school_id = School_id1
                AND (title LIKE CONCAT('%', Title1, '%'))
                AND (author LIKE CONCAT('%', Author1, '%'))
                AND (available_copies = Copies1)
                GROUP BY book_id;
	ELSEIF Title1 IS NOT NULL AND Category1 IS NOT NULL AND Author1 IS NULL AND Copies1 IS NOT NULL THEN
		SELECT title, GROUP_CONCAT(DISTINCT author)
                FROM book_info_3_joins
                WHERE school_id = School_id1
                AND (title LIKE CONCAT('%', Title1, '%'))
                AND (thematic_category LIKE CONCAT('%', Category1, '%'))
                AND (available_copies = Copies1)
                GROUP BY book_id;
	ELSE 
		SELECT title, GROUP_CONCAT(DISTINCT author)
                FROM book_info_3_joins
                WHERE school_id = School_id1
                AND (title LIKE CONCAT('%', Title1, '%'))
                AND (thematic_category LIKE CONCAT('%', Category1, '%'))
                AND (author LIKE CONCAT('%', Author1, '%'))
                AND (available_copies = Copies1)
                GROUP BY title;
	END IF;
END $$
DELIMITER ;


--
-- 3.2.2) Find all borrowers who own at least one book and have delayed its return. (Search criteria: First Name, Last Name, Delay Days).
-- 

CREATE VIEW overdue_library_book AS
SELECT br.book_id, br.stud_prof_id, DATEDIFF(CURDATE(), return_date) AS overdue_days, sp.fullname, sp.operator_id
FROM book_borrowing br
JOIN student_professor sp
ON br.stud_prof_id = sp.stud_prof_id
WHERE actual_return_date IS NULL
AND DATEDIFF(CURDATE(), return_date) > 0;


DELIMITER $$
CREATE PROCEDURE find_overdue_borrowers(IN operator_id_ SMALLINT, IN first_name_ VARCHAR(20), IN last_name_ VARCHAR(20), IN overdue_days_ SMALLINT)
BEGIN 
	IF first_name_ IS NULL AND last_name_ IS NULL AND overdue_days_ IS NULL THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'At least one field is required';
	ELSEIF first_name_ IS NOT NULL AND last_name_ IS NULL AND overdue_days_ IS NULL THEN
		SELECT fullname, overdue_days
		FROM overdue_library_book
		WHERE operator_id = operator_id_
		AND (fullname LIKE CONCAT('%', first_name_, '%'));
	ELSEIF first_name_ IS NULL AND last_name_ IS NOT NULL AND overdue_days_ IS NULL THEN
		SELECT fullname, overdue_days
                FROM overdue_library_book
                WHERE operator_id = operator_id_
                AND (fullname LIKE CONCAT('%', last_name_, '%'));
	ELSEIF first_name_ IS NULL AND last_name_ IS NULL AND overdue_days_ IS NOT NULL THEN
		SELECT fullname, overdue_days
                FROM overdue_library_book
                WHERE operator_id = operator_id_
                AND overdue_days = overdue_days_;
	ELSEIF first_name_ IS NOT NULL AND last_name_ IS NOT NULL AND overdue_days_ IS NULL THEN
		SELECT fullname, overdue_days
                FROM overdue_library_book
                WHERE operator_id = operator_id_
                AND (fullname LIKE CONCAT('%', first_name_, '%'))
		AND (fullname LIKE CONCAT('%', last_name_, '%'));
	ELSEIF first_name_ IS  NULL AND last_name_ IS NOT NULL AND overdue_days_ IS NOT NULL THEN
                SELECT fullname, overdue_days
                FROM overdue_library_book
                WHERE operator_id = operator_id_
                AND (fullname LIKE CONCAT('%', last_name_, '%'))
		AND overdue_days = overdue_days_;
	ELSEIF first_name_ IS NOT NULL AND last_name_ IS NULL AND overdue_days_ IS NOT NULL THEN
		SELECT fullname, overdue_days
                FROM overdue_library_book
                WHERE operator_id = operator_id_
                AND (fullname LIKE CONCAT('%', first_name_, '%'))
                AND overdue_days = overdue_days_;
	ELSE
		SELECT fullname, overdue_days
                FROM overdue_library_book
                WHERE operator_id = operator_id_
                AND (fullname LIKE CONCAT('%', first_name_, '%'))
		AND (fullname LIKE CONCAT('%', last_name_, '%'))
                AND overdue_days = overdue_days_;
	END IF;
END $$
DELIMITER ;


--
-- 3.2.3) Average Ratings per borrower and category (Search criteria: user/category)
--

CREATE VIEW reviews_borrowers_categories AS
SELECT r.stud_prof_id, r.book_id, r.status, r.rating, c.thematic_category, sp.operator_id, sp.fullname
FROM reviews r
JOIN book_thematic_categories c
ON r.book_id = c.book_id
JOIN student_professor sp
ON r.stud_prof_id = sp.stud_prof_id
WHERE r.status = 'approved';

DELIMITER $$
CREATE PROCEDURE avg_rating_borrowers_categories(IN operator_id_ SMALLINT, IN full_name_ VARCHAR(45), IN category_ VARCHAR(40))
BEGIN
	IF full_name_ IS NULL AND category_ IS NULL THEN 
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'At least one field is required';
	ELSEIF full_name_ IS NOT NULL AND category_ IS NULL THEN
		SELECT th.fullname, AVG(th.rating) AS Average_rating
		FROM (SELECT fullname, rating, operator_id
		      FROM reviews_borrowers_categories
		      WHERE (fullname LIKE CONCAT('%', full_name_, '%'))
		      AND operator_id = operator_id_
	              GROUP BY book_id) AS th; 
	ELSEIF full_name_ IS NULL AND category_ IS NOT NULL THEN
		SELECT th.thematic_category, AVG(th.rating) AS Average_rating
		FROM (SELECT stud_prof_id, book_id, rating, operator_id, thematic_category
		      FROM reviews_borrowers_categories
		      WHERE thematic_category = category_
	              AND operator_id = operator_id_) AS th;
	ELSE
		SELECT th.fullname, th.thematic_category, AVG(th.rating) AS Average_rating
		FROM (SELECT fullname, thematic_category, rating, operator_id
		      FROM reviews_borrowers_categories
	              WHERE (fullname LIKE CONCAT('%', full_name_, '%'))
	              AND thematic_category = category_
		      AND operator_id = operator_id_) AS th;
	END IF;
END $$
DELIMITER ;



--
-- User: Student/Professor
--

--
-- 3.3.1) List with all books (Search criteria: title/category/author), ability to select a book and create a reservation request.
--

DELIMITER $$
CREATE PROCEDURE search_book_by_title_author_category(IN school_id_ SMALLINT, IN title_ VARCHAR(100), IN author_ VARCHAR(45), IN category_ VARCHAR(30))
BEGIN
	IF title_ IS NULL AND author_ IS NULL AND category_ IS NULL THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'At least one field is required';
	ELSEIF title_ IS NOT NULL AND author_ IS NULL AND category_ IS NULL THEN 
		SELECT title 
		FROM book_info_3_joins
		WHERE (title LIKE CONCAT('%', title_, '%'))
		AND school_id = school_id_;
	ELSEIF title_ IS NULL AND author_ IS NOT NULL AND category_ IS NULL THEN
		SELECT title
		FROM book_info_3_joins
		WHERE (author LIKE CONCAT('%', author_, '%'))
                AND school_id = school_id_;
	ELSEIF title_ IS NULL AND author_ IS NULL AND category_ IS NOT NULL THEN
	       SELECT title
	       FROM book_info_3_joins
	       WHERE (thematic_category LIKE CONCAT('%', category_, '%'))
               AND school_id = school_id_;	
	ELSEIF title_ IS NOT NULL AND author_ IS NOT NULL AND category_ IS NULL THEN
		SELECT title
		FROM book_info_3_joins
		WHERE (title LIKE CONCAT('%', title_, '%'))
		AND (author LIKE CONCAT('%', author_, '%'))
		AND school_id = school_id_;
	ELSEIF title_ IS NULL AND author_ IS NOT NULL AND category_ IS NOT NULL THEN
	       SELECT title
               FROM book_info_3_joins
               WHERE (author LIKE CONCAT('%', author_, '%'))
	       AND (thematic_category LIKE CONCAT('%', category_, '%'))
	       AND school_id = school_id_;
	ELSEIF title_ IS NOT NULL AND author_ IS NULL AND category_ IS NOT NULL THEN
		SELECT title
                FROM book_info_3_joins
		WHERE (title LIKE CONCAT('%', title_, '%'))
		AND (thematic_category LIKE CONCAT('%', category_, '%'))
		AND school_id = school_id_;
	ELSE 
		SELECT title
                FROM book_info_3_joins
		WHERE (title LIKE CONCAT('%', title_, '%'))
		AND (author LIKE CONCAT('%', author_, '%'))
		AND (thematic_category LIKE CONCAT('%', category_, '%'))
		AND school_id = school_id_;
	END IF;
END $$
DELIMITER ;


--
-- 3.3.2) List of all books borrowed by this user.
--

DELIMITER $$ 
CREATE PROCEDURE find_books_i_have_borrowed(IN stud_prof_id_ SMALLINT)
BEGIN
	SELECT DISTINCT new.title
        FROM (SELECT b.book_id, b.title
	     FROM book_borrowing br
	     JOIN book b
	     ON br.book_id = b.book_id
	     WHERE br.stud_prof_id = stud_prof_id_) new;
END $$
DELIMITER ;

