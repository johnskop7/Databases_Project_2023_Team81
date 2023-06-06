USE library;

-- DELETE data
DELETE FROM administrator;
DELETE FROM school_unit;
DELETE FROM book;
DELETE FROM book_thematic_categories;
DELETE FROM book_authors ;
DELETE FROM operator;
DELETE FROM book_borrowing;
DELETE FROM student_professor;
DELETE FROM reservations;
DELETE FROM reviews;
DELETE FROM borrower_card;
ALTER TABLE `administrator` auto_increment = 1;
ALTER TABLE `school_unit` auto_increment =1;
ALTER TABLE `book` auto_increment = 1;
ALTER TABLE `book_thematic_categories` auto_increment =1;
ALTER TABLE `book_authors` auto_increment = 1;
ALTER TABLE `operator` auto_increment = 1;
ALTER TABLE `book_borrowing` auto_increment = 1;
ALTER TABLE `student_professor` auto_increment = 1;
ALTER TABLE `reservations` auto_increment = 1;
ALTER TABLE `reviews` auto_increment = 1;
ALTER TABLE `borrower_card` auto_increment = 1;

