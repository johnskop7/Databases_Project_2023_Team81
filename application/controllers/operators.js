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
        .query('SELECT * FROM operator WHERE username = ? AND password = ?', [username, password])
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
        const studentName = req.query.studentName;
        const category = req.query.category;
        const operatorId = req.session.operatorId;
        //console.log(operatorId);
        // console.log(genre);
        // Query the database with the genre parameter
        pool.getConnection((err, conn) => {
          if (err) {
            console.error(err);
            return res.status(500).send('Internal Server Error');
          }
          conn.promise()
          .query('CALL avg_rating_borrowers_categories(?,?,?)', [operatorId ,studentName,category])
          .then(([results]) => {
                 // Render the view with both sets of results
                  res.render('average_rating.ejs', {
                  pageTitle: "Query 3.2.3",
                  results: results,
                });
                //console.log(results)
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
      