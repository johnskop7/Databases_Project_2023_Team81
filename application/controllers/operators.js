// Import the database connection pool
const {pool} = require('../database');

exports.getOperatorLoginPage= (req, res, next) => {
    //console.log('Found!')
    res.render('operator_login.ejs', {
        pageTitle: 'Operator Login Page',
        messages: [] // You can pass any desired messages to display on the admin login page
      });
}

exports.handleLogin_operator = (req, res) => {

    /* check for messages in order to show them when rendering the page */
    let messages = req.flash("messages");
    if (messages.length == 0) messages = [];

    // Retrieve username and password from request body
    const username = req.body.operator_username;
    const password = req.body.operator_password;

    //console.log('Reached controller!')
  
    // Query the database to check if the user exists
    pool.getConnection((err, conn) => {
      if (err) {
        console.error(err);
        return res.status(500).send('Internal Server Error');
      }
  
      conn.promise()
        .query("SELECT * FROM operator WHERE status = 'approved' AND username = ? AND password = ?", [username, password])
        .then(([results]) => {
            if (results.length === 0) {
                res.redirect('/operator_login')
                req.flash('messages', { type: 'error', value: "Try another password or username" })
            }
          // Check if user exists
          else{
            req.session.operatorId = results[0].operator_id;
            res.render('operator_mainpage.ejs', {
            pageTitle: "Operator login Page",
            messages: messages
            })
            //console.log(results);
          }
        })
        .then(() => pool.releaseConnection(conn))
        .catch(err => console.log(err))
    });
  };

  exports.getBooks = (req, res) => {
    const title = req.query.title;
    const category = req.query.category;
    const author = req.query.author;
    let copies = req.query.copies;
    const operatorId = req.session.operatorId;
    //console.log(operatorId);
    //console.log(copies);
  
    // Check if copies parameter is "null" and set it to null
    if (copies === "null") {
      copies = null;
    }
  
    // Query the database with the genre parameter
    pool.getConnection((err, conn) => {
      if (err) {
        console.error(err);
        return res.status(500).send('Internal Server Error');
      }
      conn.promise()
        .query('CALL list_title_authors(?,?,?,?,?)', [operatorId, title, category, author, copies])
        .then(([results]) => {
          // Render the view with both sets of results
          res.render('books_per_school.ejs', {
            pageTitle: "Query 3.2.1",
            results: results,
          });
          //console.log(results);
        })
        .then(() => pool.releaseConnection(conn))
        .catch(err => console.log(err));
    });
  };
  

exports.getLateReturns = (req, res) => {
      const firstname = req.query.firstname;
      const lastname = req.query.lastname;
      let overdueDays = req.query.overdueDays;
      const operatorId = req.session.operatorId;
      //console.log(operatorId);
      //console.log(firstname);
      // Query the database with the genre parameter
      if (overdueDays === "null") {
        overdueDays = null;
      }
      pool.getConnection((err, conn) => {
        if (err) {
          console.error(err);
          return res.status(500).send('Internal Server Error');
        }
        conn.promise()
        .query('CALL find_overdue_borrowers(?,?,?,?)', [operatorId ,firstname,lastname,overdueDays])
        .then(([results]) => {
               // Render the view with both sets of results
                res.render('late_returns.ejs', {
                pageTitle: "Query 3.2.2",
                results: results,
              });
              //console.log(results)
            })
            .then(() => pool.releaseConnection(conn))
            .catch(err => console.log(err))
        })
          
      };
      
      
exports.getAvgRating = (req, res) => {
        const fullname = req.query.studentName;
        let category = req.query.category;
        const operatorId = req.session.operatorId;
        if (category === '') {
          category = null;
        }
        pool.getConnection((err, conn) => {
          if (err) {
            console.error(err);
            return res.status(500).send('Internal Server Error');
          }
          conn.promise()
          .query('CALL avg_rating_borrowers_categories(?,?,?)', [operatorId ,fullname,category])
          .then(([results]) => {
                 // Render the view with both sets of results
                  res.render('average_rating.ejs', {
                  pageTitle: "Query 3.2.3",
                  results: results,
                });
                console.log(results)
              })
              .then(() => pool.releaseConnection(conn))
              .catch(err => console.log(err))
          })
            
        };

  exports.getOperatorPasswordPage= (req, res, next) => {
    res.render('operator_password.ejs', {
    pageTitle: 'Operator change password ',
    messages: [] 
        });
    }

    exports.UpdateOperatorPassword = (req, res, next) => {
      /* get necessary data sent */
      const password = req.body.newPassword;
      const operatorId = req.session.operatorId;
      pool.getConnection((err, conn) => {
        var sqlQuery = `UPDATE operator SET password = ? WHERE operator_id = ${operatorId}`;
        conn.promise().query(sqlQuery, [password])
          .then(() => {
            pool.releaseConnection(conn);
            res.render('operator_mainpage.ejs', {
              pageTitle: 'Operator Main Page',
              messages: [] // You can pass any desired messages to display on the admin login page
            });
          })
          .catch(err => {
            console.log(err);
            req.flash('messages', { type: 'error', value: "Something went wrong, Executive could not be updated." })
            res.redirect('/operator_mainpage');
          })
      })
    }
   
    exports.getSchoolBooksPage= (req, res, next) => {
      const operatorId = req.session.operatorId;
      //console.log(operatorId)
      pool.getConnection((err, conn) => {
        var sqlQuery = `
        SELECT b.title, GROUP_CONCAT(DISTINCT a.author) AS author, GROUP_CONCAT(DISTINCT c.thematic_category) AS thematic_category,b.publisher,b.ISBN,b.number_of_pages,b.image,b.language,b.summary,b.key_words, b.available_copies, b.book_id
        FROM book b
        JOIN book_authors a
        ON b.book_id = a.book_id
        JOIN book_thematic_categories c
        ON b.book_id = c.book_id
        WHERE b.school_id = ${operatorId}
        GROUP BY b.book_id;`;

        //school_id and operator_id are always the same
        conn.promise().query(sqlQuery)
          .then(([results]) => {
            pool.releaseConnection(conn);
            res.render('school_books.ejs', {
              pageTitle: 'School books page ',
              books:results,
              messages: [] 
                  });
                //console.log(results);
          })
          .catch(err => {
            console.log(err);
            req.flash('messages', { type: 'error', value: "Something went wrong, Executive could not be updated." })
            res.redirect('/operator_mainpage');
          })
      })
      }
  
      exports.getAllOverdueBorrowersPage= (req, res, next) => {
        const operatorId = req.session.operatorId;
        //console.log(operatorId)
        pool.getConnection((err, conn) => {
          var sqlQuery = `
          SELECT * FROM overdue_library_book WHERE operator_id = ${operatorId}`;
          conn.promise().query(sqlQuery)
            .then(([results]) => {
              pool.releaseConnection(conn);
              res.render('all_the_overdue_borrowers.ejs', {
                pageTitle: 'Overdue Borrowings',
                borrowers:results,
                messages: [] 
                    });
                //console.log(results);
            })
            .catch(err => {
              console.log(err);
              req.flash('messages', { type: 'error', value: "Something went wrong, Executive could not be updated." })
              res.redirect('/operator_mainpage');
            })
        })
        }
    

        exports.getUpdateBookPage = (req, res, next) => {
          const bookId = req.query.book_id;
          pool.getConnection((err, conn) => {
            var sqlQuery = `
            SELECT
            b.book_id,
            b.title,
            b.publisher,
            b.summary,
            b.key_words,
            b.ISBN,
            b.available_copies,
            b.number_of_pages,
            b.image,
            b.language,
            GROUP_CONCAT(DISTINCT btc.thematic_category SEPARATOR ', ') AS thematic_categories,
            GROUP_CONCAT(DISTINCT ba.author SEPARATOR ', ') AS authors
          FROM
            book AS b
          LEFT JOIN
            book_thematic_categories AS btc ON b.book_id = btc.book_id
          LEFT JOIN
            book_authors AS ba ON b.book_id = ba.book_id
          WHERE
            b.book_id = ${bookId}
          GROUP BY
            b.book_id;
          `;
            conn.promise()
              .query(sqlQuery)
              .then(([results]) => {
                pool.releaseConnection(conn);
                res.render('update_books.ejs', {
                  pageTitle: 'Update Books',
                  book: results[0], // Assuming there is only one book with the given book_id
                  messages: []
                });
                //console.log(results);
              })
              .catch((err) => {
                console.log(err);
                req.flash('messages', {
                  type: 'error',
                  value: "Something went wrong, Executive could not be updated."
                });
                res.redirect('/operator_mainpage');
              });
          });
        };
        
        exports.postUpdateBook = (req, res, next) => {
          // Get necessary data sent
          const id = req.body.id;
          const title = req.body.title;
          const publisher = req.body.publisher;
          const ISBN = req.body.ISBN;
          const authors = req.body.authors;
          const number_of_pages = req.body.number_of_pages;
          const summary = req.body.summary;
          const available_copies = req.body.available_copies;
          const image = req.body.image;
          const thematic_categories = req.body.thematic_categories;
          const language = req.body.language;
          const key_words = req.body.key_words;
        
          // Create the connection
          pool.getConnection((err, conn) => {
            if (err) {
              console.log(err);
              req.flash('messages', {
                type: 'error',
                value: 'Something went wrong, book could not be updated.',
              });
              res.render('operator_mainpage.ejs');
              return;
            }
        
            // Begin transaction
            conn.beginTransaction((transErr) => {
              if (transErr) {
                console.log(transErr);
                req.flash('messages', {
                  type: 'error',
                  value: 'Something went wrong, book could not be updated.',
                });
                res.render('operator_mainpage.ejs');
                return;
              }
        
              const bookQuery = `UPDATE book SET title = ?, publisher = ?, ISBN = ?, number_of_pages = ?, summary = ?, available_copies = ?, image = ?, language = ?, key_words = ? WHERE book_id = ?`;

              // Split the authors and thematic categories into arrays
              const authorsArray = authors.split(',').map((author) => author.trim());
              const categoriesArray = thematic_categories.split(',').map((category) => category.trim());
        
              // Delete existing book authors and insert new book authors
              const deleteAuthorsQuery = `DELETE FROM book_authors WHERE book_id = ?`;
              const insertAuthorsQuery = `INSERT INTO book_authors (book_id, author) VALUES ?`;
        
              const authorsValues = authorsArray.map((author) => [id, author]);
        
              // Delete existing thematic categories and insert new thematic categories
              const deleteCategoriesQuery = `DELETE FROM book_thematic_categories WHERE book_id = ?`;
              const insertCategoriesQuery = `INSERT INTO book_thematic_categories (book_id,thematic_category) VALUES ?`;
        
              const categoriesValues = categoriesArray.map((category) => [id, category]);
        
              // Execute the queries and handle the transaction
              conn
                .promise()
                .query(bookQuery, [title, publisher, ISBN, number_of_pages, summary, available_copies, image, language, key_words, id])
                .then(() => conn.promise().query(deleteAuthorsQuery, [id]))
                .then(() => conn.promise().query(insertAuthorsQuery, [authorsValues]))
                .then(() => conn.promise().query(deleteCategoriesQuery, [id]))
                .then(() => conn.promise().query(insertCategoriesQuery, [categoriesValues]))
                .then(() => {
                  // Commit the transaction and handle the response
                  conn.commit((commitErr) => {
                    if (commitErr) {
                      console.log(commitErr);
                      req.flash('messages', {
                        type: 'error',
                        value: 'Something went wrong, book could not be updated.',
                      });
                      res.render('operator_mainpage.ejs');
                      return;
                    }
        
                    pool.releaseConnection(conn);
                    req.flash('messages', {
                      type: 'success',
                      value: 'Successfully updated book!',
                    });
                    res.render('operator_mainpage.ejs');
                  });
                })
                .catch((err) => {
                  conn.rollback(() => {
                    console.log(err);
                    req.flash('messages', {
                      type: 'error',
                      value: 'Something went wrong, book could not be updated.',
                    });
                    res.render('operator_mainpage.ejs');
                  });
                });
            });
          });
        };
        
      
      
        exports.postDeleteBook = (req, res, next) => {
          /* get id from params */
          const id = req.params.book_id;
          console.log(id);
          /* create the connection, execute query, flash respective message and redirect to executives route */
          pool.getConnection((err, conn) => {
              var sqlQuery = `DELETE FROM book WHERE book_id = ${id}`;
      
              conn.promise().query(sqlQuery)
              .then(() => {
                  pool.releaseConnection(conn);
                  req.flash('messages', { type: 'success', value: "Successfully deleted executive!" })
                  res.render('operator_mainpage.ejs');
              })
              .catch(err => {
                  req.flash('messages', { type: 'error', value: "Something went wrong, Executive could not be deleted." })
                  res.render('operator_mainpage.ejs');
              })
          })
      
      }


      exports.getAddBookPage= (req, res, next) => {
        res.render('add_book.ejs', {
        pageTitle: 'Add Book Page ',
        messages: [] 
            });
        }


        exports.AddNewBook = (req, res, next) => {
          // Retrieve the book data from the request body
          const { title, publisher, isbn, pages, image, language, copies, summary, keywords, authors, categories } = req.body;
          const operatorId = req.session.operatorId;
        
          // Perform the INSERT query for the book
          pool.query(
            'INSERT INTO book (title, publisher, ISBN, number_of_pages, image, language, available_copies, summary, key_words, school_id) VALUES (?,?,?,?,?,?,?,?,?,?)',
            [title, publisher, isbn, pages, image, language, copies, summary, keywords, operatorId],
            (error, results) => {
              if (error) {
                console.error('Error adding book:', error);
                return res.status(500).send('Error adding book');
              } else {
                console.log('Book added successfully');
                const bookId = results.insertId;
        
                // Split the authors and categories by comma
                const authorsArray = authors.split(',');
                const categoriesArray = categories.split(',');
        
                // Prepare the data for inserting authors
                const authorValues = authorsArray.map((author) => [bookId, author.trim()]);
        
                // Perform the INSERT query for authors
                pool.query('INSERT INTO book_authors (book_id, author) VALUES ?', [authorValues], (error, results) => {
                  if (error) {
                    console.error('Error adding authors:', error);
                    return res.status(500).send('Error adding authors');
                  } else {
                    console.log('Authors added successfully');
        
                    // Prepare the data for inserting categories
                    const categoryValues = categoriesArray.map((category) => [bookId, category.trim()]);
        
                    // Perform the INSERT query for categories
                    pool.query('INSERT INTO book_thematic_categories (book_id, thematic_category) VALUES ?', [categoryValues], (error, results) => {
                      if (error) {
                        console.error('Error adding categories:', error);
                        return res.status(500).send('Error adding categories');
                      } else {
                        console.log('Categories added successfully');
                        res.render('operator_mainpage.ejs'); // Redirect to operator_mainpage
                      }
                    });
                  }
                });
              }
            }
          );
        };
        

        exports.getAllUsersPage = (req, res, next) => {
          const operatorId = req.session.operatorId;
        
          pool.getConnection((err, conn) => {
            var sqlQuery = `SELECT * FROM student_professor WHERE operator_id = ${operatorId}`;
            conn.promise()
              .query(sqlQuery)
              .then(([results]) => {
                pool.releaseConnection(conn);
        
                const filteredResults = results.map((user) => ({
                  stud_prof_id:user.stud_prof_id,
                  fullname: user.fullname,
                  username: user.username,
                  email: user.email,
                  phone_number: user.phone_number,
                  date_of_birth: user.date_of_birth,
                  role: user.role,
                }));
        
                res.render('all_users.ejs', {
                  pageTitle: 'All the school library members',
                  users: filteredResults,
                  messages: [],
                });
        
                console.log(filteredResults);
              })
              .catch((err) => {
                console.log(err);
                req.flash('messages', {
                  type: 'error',
                  value: 'Something went wrong, Executive could not be updated.',
                });
                res.redirect('/operator_mainpage');
              });
          });
        };
        

        exports.postDeleteUser = (req, res, next) => {
          // Get id from URL params
          const id = req.params.id;
      
          // Create the connection, execute the query, flash respective message, and redirect to the operator_mainpage route
          pool.getConnection((err, conn) => {
              if (err) {
                  console.error('Error getting database connection:', err);
                  req.flash('messages', { type: 'error', value: "Something went wrong, Executive could not be deleted." });
                  return res.redirect('/operator_mainpage');
              }
      
              var sqlQuery = `DELETE FROM student_professor WHERE stud_prof_id = ?`;
              conn.query(sqlQuery, [id], (err, result) => {
                  conn.release();
      
                  if (err) {
                      console.error('Error executing query:', err);
                      req.flash('messages', { type: 'error', value: "Something went wrong, Executive could not be deleted." });
                      return res.redirect('/operator_mainpage');
                  }
      
                  req.flash('messages', { type: 'success', value: "Successfully deleted executive!" });
                  res.render('operator_mainpage.ejs');
              });
          });
      };
      exports.postDeactivateUser = (req, res, next) => {
        // Get id from URL params
        const id = req.params.id;
    
        // Create the connection, execute the query, flash respective message, and redirect to the operator_mainpage route
        pool.getConnection((err, conn) => {
            if (err) {
                console.error('Error getting database connection:', err);
                req.flash('messages', { type: 'error', value: "Something went wrong, Executive could not be deleted." });
                return res.redirect('/operator_mainpage');
            }
    
            var sqlQuery = `UPDATE student_professor SET approval_status = 'deactivated' WHERE stud_prof_id = ${id}`;
            conn.query(sqlQuery, [id], (err, result) => {
                conn.release();
    
                if (err) {
                    console.error('Error executing query:', err);
                    return res.redirect('/operator_mainpage');
                }
    
                req.flash('messages', { type: 'success', value: "Successfully deactivated executive!" });
                res.render('operator_mainpage.ejs');
            });
        });
    };


      exports.getAllActiveBorrowingsPage = (req, res, next) => {
        const operatorId = req.session.operatorId;
        
        pool.getConnection((err, conn) => {
          var sqlQuery = `SELECT * FROM active_book_borrowings WHERE operator_id = ${operatorId}`;
          conn.promise()
            .query(sqlQuery)
            .then(([results]) => {
              pool.releaseConnection(conn);
      
              const filteredResults = results.map((results) => ({
                borrowingId:results.borrowing_id,
                borrower_name:results.borrower_name,
                borrowing_date:results.borrowing_date,
                ISBN: results.ISBN,
                return_date: results.return_date,
                title: results.title  
              }));
      
              res.render('active_borrowings.ejs', {
                pageTitle: 'Active book borrowings',
                users: filteredResults,
                messages: [],
              });
      
              console.log(filteredResults);
            })
            .catch((err) => {
              console.log(err);
              req.flash('messages', {
                type: 'error',
                value: 'Something went wrong, Executive could not be updated.',
              });
              res.redirect('/operator_mainpage');
            });
        });
      };


      exports.postBookReturned = (req, res, next) => {
        const borrowingId = req.body.borrowingId;
        const currentDate = new Date().toISOString().slice(0, 10); // Get the current date in YYYY-MM-DD format
        console.log(borrowingId);
        pool.getConnection((err, conn) => {
            var sqlQuery = `UPDATE book_borrowing SET actual_return_date = '${currentDate}' WHERE borrowing_id = ${borrowingId}`;
    
            conn.promise().query(sqlQuery)
                .then(() => {
                    pool.releaseConnection(conn);
                    req.flash('messages', { type: 'success', value: "Book returned successfully!" });
                    res.render('operator_mainpage.ejs')
                })
                .catch(err => {
                    req.flash('messages', { type: 'error', value: "Something went wrong, book could not be returned." });
                    res.redirect('/active_borrowings');
                });
        });
    };
    


    exports.getOldBorrowingsPage = (req, res, next) => {
      const operatorId = req.session.operatorId;
      
      pool.getConnection((err, conn) => {
        var sqlQuery = `SELECT * FROM old_book_borrowings WHERE operator_id = ${operatorId};`;
        conn.promise()
          .query(sqlQuery)
          .then(([results]) => {
            pool.releaseConnection(conn);
    
            const filteredResults = results.map((results) => ({
              borrower_name:results.borrower_name,
              borrowing_date:results.borrowing_date,
              actual_return_date: results.actual_return_date,
              title: results.title  
            }));
    
            res.render('old_borrowings.ejs', {
              pageTitle: 'Old book borrowings',
              users: filteredResults,
              messages: [],
            });
    
            console.log(filteredResults);
          })
          .catch((err) => {
            console.log(err);
            req.flash('messages', {
              type: 'error',
              value: 'Something went wrong, Executive could not be updated.',
            });
            res.redirect('/operator_mainpage');
          });
      });
    };


    exports.getNewBorrowingsPage = (req, res, next) => {
          res.render('add_borrowing.ejs', {
          pageTitle: 'New book borrowing',
          messages: [],
            });
    };

    
    exports.AddNewBorrowing = (req, res, next) => {
      // Retrieve the book data from the request body
      const { title, isbn, fullname, phonenumber } = req.body;
      const operatorId = req.session.operatorId;
      console.log(title);
      console.log(isbn);
      console.log(fullname);
      console.log(phonenumber);
      pool.getConnection((err, conn) => {
          if (err) {
              console.log(err);
              req.flash('messages', { type: 'error', value: 'Something went wrong.' });
              res.render('add_borrowing.ejs');
              return;
          }
  
          // Find the book_id using the title and ISBN
          const findBookQuery = `SELECT book_id FROM book WHERE title = ? AND ISBN = ? AND school_id = ${operatorId}`;
          conn.query(findBookQuery, [title, isbn], (err, bookResult) => {
              if (err) {
                  console.log(err);
                  req.flash('messages', { type: 'error', value: 'Error finding the book.' });
                  res.render('add_borrowing.ejs');
                  return;
              }
  
              if (bookResult.length === 0) {
                  req.flash('messages', { type: 'error', value: 'Book not found.' });
                  res.render('add_borrowing.ejs');
                  return;
              }
  
              const bookId = bookResult[0].book_id;
  
              // Find the stud_prof_id using the fullname and phonenumber
              const findStudentQuery = `SELECT stud_prof_id FROM student_professor WHERE fullname = ? AND phone_number = ? AND operator_id = ${operatorId}`;
              conn.query(findStudentQuery, [fullname, phonenumber], (err, studentResult) => {
                  if (err) {
                      console.log(err);
                      req.flash('messages', { type: 'error', value: 'Error finding the student/professor.' });
                      res.render('add_borrowing.ejs');
                      return;
                  }
  
                  if (studentResult.length === 0) {
                      req.flash('messages', { type: 'error', value: 'Student/Professor not found.' });
                      res.render('add_borrowing.ejs');
                      return;
                  }
  
                  const studProfId = studentResult[0].stud_prof_id;
  
                  // Get the current date
                  const currentDate = new Date();
  
                  // Calculate the return date (current date + 7 days)
                  const returnDate = new Date();
                  returnDate.setDate(currentDate.getDate() + 7);
  
                  // Insert the new borrowing into the book_borrowing table
                  const insertBorrowingQuery = `INSERT INTO book_borrowing (borrowing_date, return_date, actual_return_date, book_id, stud_prof_id) VALUES (?, ?, NULL, ?, ?)`;
                  conn.query(
                      insertBorrowingQuery,
                      [currentDate, returnDate, bookId, studProfId],
                      (err, insertResult) => {
                          if (err) {
                              console.log(err);
                              req.flash('messages', { type: 'error', value: 'Error adding the new borrowing.' });
                              res.render('add_borrowing.ejs');
                              return;
                          }
                          console.log(currentDate);
  
                          req.flash('messages', { type: 'success', value: 'Borrowing added successfully.' });
                          res.render('operator_mainpage.ejs');
                      }
                  );
              });
          });
      });
  };
  


  
    exports.getPublishedReviewsPage = (req, res, next) => {
      const operatorId = req.session.operatorId;
      
      pool.getConnection((err, conn) => {
        var sqlQuery = `SELECT * FROM get_approved_reviews WHERE operator_id = ${operatorId};`;
        conn.promise()
          .query(sqlQuery)
          .then(([results]) => {
            pool.releaseConnection(conn);
    
            const filteredResults = results.map((results) => ({
              borrower_name:results.fullname,
              title: results.title ,
              rating:results.rating,
              review_text: results.review_text, 
            }));
    
            res.render('published_reviews.ejs', {
              pageTitle: 'Published Reviews',
              users: filteredResults,
              messages: [],
            });
    
            console.log(filteredResults);
          })
          .catch((err) => {
            console.log(err);
            req.flash('messages', {
              type: 'error',
              value: 'Something went wrong, Executive could not be updated.',
            });
            res.redirect('/operator_mainpage');
          });
      });
    };


    exports.getDeniedReviewsPage = (req, res, next) => {
      const operatorId = req.session.operatorId;
      
      pool.getConnection((err, conn) => {
        var sqlQuery = `SELECT * FROM get_denied_reviews WHERE operator_id = ${operatorId};`;
        conn.promise()
          .query(sqlQuery)
          .then(([results]) => {
            pool.releaseConnection(conn);
    
            const filteredResults = results.map((results) => ({
              borrower_name:results.fullname,
              title: results.title ,
              rating:results.rating,
              review_text: results.review_text, 
            }));
    
            res.render('denied_reviews.ejs', {
              pageTitle: 'Denied Reviews',
              users: filteredResults,
              messages: [],
            });
    
            console.log(filteredResults);
          })
          .catch((err) => {
            console.log(err);
            req.flash('messages', {
              type: 'error',
              value: 'Something went wrong, Executive could not be updated.',
            });
            res.redirect('/operator_mainpage');
          });
      });
    };


    exports.getNotApprovedReviewsPage = (req, res, next) => {
      const operatorId = req.session.operatorId;
      
      pool.getConnection((err, conn) => {
        var sqlQuery = `SELECT * FROM get_notyetapproved_reviews WHERE operator_id = ${operatorId};`;
        conn.promise()
          .query(sqlQuery)
          .then(([results]) => {
            pool.releaseConnection(conn);
    
            const filteredResults = results.map((results) => ({
              reviewId:results.review_id,
              borrower_name:results.fullname,
              title: results.title ,
              rating:results.rating,
              review_text: results.review_text, 
            }));
    
            res.render('notapproved_reviews.ejs', {
              pageTitle: 'Reviews that have not been approved yet',
              users: filteredResults,
              messages: [],
            });
    
            //console.log(filteredResults);
          })
          .catch((err) => {
            console.log(err);
            req.flash('messages', {
              type: 'error',
            });
            res.redirect('/operator_mainpage');
          });
      });
    };

    exports.postReviewAccepted = (req, res, next) => {
      const reviewId = req.body.reviewId;
      console.log(reviewId);
      pool.getConnection((err, conn) => {
          var sqlQuery = `UPDATE reviews SET status = 'approved' WHERE review_id = ${reviewId}`;
  
          conn.promise().query(sqlQuery)
              .then(() => {
                  pool.releaseConnection(conn);
                  res.render('operator_mainpage.ejs')
              })
              .catch(err => {
                  req.flash('messages', { type: 'error', value: "Something went wrong, book could not be returned." });
                  res.redirect('/accept_review');
              });
      });
  };
  

  exports.postReviewDeny = (req, res, next) => {
    const reviewId = req.body.reviewId;
    console.log(reviewId);
    pool.getConnection((err, conn) => {
        var sqlQuery = `UPDATE reviews SET status = 'denied' WHERE review_id = ${reviewId}`;

        conn.promise().query(sqlQuery)
            .then(() => {
                pool.releaseConnection(conn);
                res.render('operator_mainpage.ejs')
            })
            .catch(err => {
                req.flash('messages', { type: 'error', value: "Something went wrong, book could not be returned." });
                res.redirect('/accept_review');
            });
    });
};

exports.getReservationsPage = (req, res, next) => {
  const operatorId = req.session.operatorId;
  
  pool.getConnection((err, conn) => {
    var sqlQuery = `SELECT * FROM get_active_reservations WHERE operator_id = ${operatorId};`;
    conn.promise()
      .query(sqlQuery)
      .then(([results]) => {
        pool.releaseConnection(conn);

        const filteredResults = results.map((results) => ({
          reservation_date:results.reservation_date,
          expiry_date:results.expiry_date,
          reservationId:results.reservation_id,
          bookId:results.book_id,
          stud_prof_id:results.stud_prof_id,
          name:results.fullname,
          title: results.book_title
        }));
       
        res.render('reservations.ejs', {
          pageTitle: 'Active Reservations',
          users: filteredResults,
          messages: [],
        });

        //console.log(results);
      })
      .catch((err) => {
        console.log(err);
        req.flash('messages', {
          type: 'error',
        });
        res.redirect('/operator_mainpage');
      });
  });
};


exports.getNewBorrowingsPage = (req, res, next) => {
  res.render('add_borrowing.ejs', {
  pageTitle: 'New book borrowing',
  messages: [],
    });
};


exports.UpgradetoBorrowing = (req, res, next) => {
  const operatorId = req.session.operatorId;
  const bookId = req.body.bookId;
  const stud_prof_id = req.body.stud_prof_id;
  console.log(bookId);
  pool.getConnection((err, conn) => {
    if (err) {
      console.log(err);
      req.flash('messages', { type: 'error', value: 'Something went wrong.' });
      res.render('reservations.ejs');
      return;
    }

    // Delete the existing reservation with the given book_id
    const deleteReservationQuery = `DELETE FROM reservations WHERE book_id = ?`;
    conn.query(deleteReservationQuery, [bookId], (err, deleteResult) => {
      if (err) {
        console.log(err);
        req.flash('messages', { type: 'error', value: 'Error deleting the reservation.' });
        res.render('reservations.ejs');
        return;
      }

      // Get the current date
      const currentDate = new Date();

      // Calculate the return date (current date + 7 days)
      const returnDate = new Date();
      returnDate.setDate(currentDate.getDate() + 7);

      // Insert the new borrowing into the book_borrowing table
      const insertBorrowingQuery = `INSERT INTO book_borrowing (borrowing_date, return_date, actual_return_date, book_id, stud_prof_id) VALUES (?, ?, NULL, ?, ?)`;
      conn.query(
        insertBorrowingQuery,
        [currentDate, returnDate, bookId, stud_prof_id],
        (err, insertResult) => {
          if (err) {
            console.log(err);
            req.flash('messages', { type: 'error', value: 'Error adding the new borrowing.' });
            res.render('book_copies_expired.ejs');
            return;
          }
          console.log(currentDate);

          req.flash('messages', { type: 'success', value: 'Borrowing added successfully.' });
          res.render('operator_mainpage.ejs');
        }
      );
    });
  });
};



  exports.getLibraryRegistration= (req, res, next) => {
    res.render('library_registration.ejs', {
    pageTitle: 'New Library Registration',
    messages: [],
      });
  };


  exports.postRegisterSchool = (req, res, next) => {
    const school_name = req.body.schoolName;
    const address = req.body.address;
    const city = req.body.city;
    const director_full_name = req.body.directorFullName;
    const school_email = req.body.schoolEmail;
    const school_phone_number = req.body.schoolPhoneNumber;
    const library_operator_fullname = req.body.libraryOperatorFullName;
    const username = req.body.operatorUsername;
    const password = req.body.operatorPassword;
    const email = req.body.operatorEmail;
    const phonenumber = req.body.operatorPhoneNumber;
    console.log(school_email);
    pool.getConnection((err, conn) => {
        var schoolUnitQuery = `INSERT INTO school_unit(school_name, address, city , school_director_full_name , library_operator_full_name, email , phone_number,status,administrator_id ) VALUES (?,?,?,?,?,?,?,'not approved',1)`;
      
        var operatorQuery = `INSERT INTO operator(fullname,username, password, operator_email, operator_phone_number, status, school_id, administrator_id) VALUES (?,?,?,?,?,?,?,1)`;
      
        conn.promise().query(schoolUnitQuery, [school_name, address, city, director_full_name, library_operator_fullname, school_email, school_phone_number])
            .then(([result]) => {
                const school_id = result.insertId;
                return conn.promise().query(operatorQuery, [library_operator_fullname,username, password, email, phonenumber, 'not approved', school_id]);
            })
            .then(() => {
                pool.releaseConnection(conn);
                res.render('member_login.ejs');
            })
            .catch(err => {
                console.error('Error executing query:', err);
                res.redirect('library_registration');
            });
    });
};


exports.getApplicationsPage = (req, res, next) => {
  pool.getConnection((err, conn) => {
    const sqlQuery = `
      SELECT *
      FROM student_professor
      WHERE student_professor.approval_status = 'not approved'
    `;

    conn.promise().query(sqlQuery)
      .then(([rows]) => {
        pool.releaseConnection(conn);
        res.render('new_member_applications.ejs', {
          pageTitle: 'Users Registration Applications ',
          applications: rows,
        });
      })
      .catch(err => {
        console.error('Error executing query:', err);
        res.render('new_member_applications.ejs', {
          pageTitle: 'Applications for new libraries and operators',
          applications: [],
          messages: ['Error retrieving applications'] // An error message if the query fails
        });
      });
  });
};


exports.postAcceptMember = (req, res, next) => {
  // Get id from URL params
  const id = req.body.stud_prof_id;
  console.log(id);
  // Create the connection, execute the query, flash respective message, and redirect to the operator_mainpage route
  pool.getConnection((err, conn) => {
    if (err) {
      console.error('Error getting database connection:', err);
      return res.redirect('/operator_mainpage');
    }

    var sqlQuery = `
      UPDATE student_professor
      SET approval_status='approved'
      WHERE stud_prof_id = ${id}`;

    conn.query(sqlQuery, (err, result) => {
      if (err) {
        conn.release();
        console.error('Error executing query:', err);
        return res.redirect('/admin_mainpage');
      }
        req.flash('messages', { type: 'success', value: "Successfully approved user!" });
        res.render('operator_mainpage.ejs');
      });
    });
  }

  exports.postDismissMember = (req, res, next) => {
    // Get id from URL params
    const id = req.body.stud_prof_id;
    console.log(id);
    // Create the connection, execute the query, flash respective message, and redirect to the operator_mainpage route
    pool.getConnection((err, conn) => {
      if (err) {
        console.error('Error getting database connection:', err);
        return res.redirect('/operator_mainpage');
      }
  
      var sqlQuery = `DELETE FROM student_professor WHERE stud_prof_id = ${id}`;
  
      conn.query(sqlQuery, (err, result) => {
        if (err) {
          conn.release();
          console.error('Error executing query:', err);
          return res.redirect('/operator_mainpage');
        }
          req.flash('messages', { type: 'success', value: "Successfully approved user!" });
          res.render('operator_mainpage.ejs');
        });
      });
    }
