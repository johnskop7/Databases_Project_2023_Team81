USE library;

-- DELETE FROM users;
ALTER TABLE `users` auto_increment =1 ;

INSERT INTO users(username,full_name,password,date_of_birth) VALUES
   ('johnli7','Giannis Litsos','12345','2001-06-27');