// Import the database connection pool
const {pool} = require('../database');

// Handle login request
exports.handleLogin_member = (req, res) => {
    // Check for messages in order to show them when rendering the page
    //console.log('Reached controller!')
    let messages = req.flash('messages');
    if (messages.length === 0) messages = [];
  
    // Retrieve username and password from request body
    const username = req.body.username;
    const password = req.body.password;
    console.log(username);
    // Query the database to check if the user exists
    pool.getConnection((err, conn) => {
      if (err) {
        console.error(err);
        return res.status(500).send('Internal Server Error');
      }
  
      conn.promise()
        .query('SELECT * FROM student_professor WHERE username = ? AND password = ?', [username, password])
        .then(([results]) => {
          if (results.length === 0) {
            //console.log('Reached query!')
            // User doesn't exist, add an error message
            res.redirect('/');
            req.flash('messages', { type: 'error', value: 'Invalid username or password' });
          
          }
          else {
         // Render the login page with the updated messages array
          req.session.stud_prof_id = results[0].stud_prof_id
          res.render('member_mainpage.ejs')
        }
        })
        .then(() => pool.releaseConnection(conn))
        .catch(err => console.log(err));
    });
  };

  exports.getSignUpPage = (req, res) => {
    // Fetch school units from the database
    pool.getConnection((err, conn) => {
      if (err) {
        console.error(err);
        return res.status(500).send('Internal Server Error');
      }
      conn.promise()
        .query('SELECT school_id, school_name FROM school_unit')
        .then(([results]) => {
          const schoolUnits = results;
          
          console.log(results);
          // Render the view with school units
          res.render('new_member_registration.ejs', {
            pageTitle: 'User Registration',
            schoolUnits: schoolUnits,
          });
        })
        .then(() => pool.releaseConnection(conn))
        .catch(err => {
          console.error(err);
          res.status(500).send('Internal Server Error');
        });
    });
  };
  
  exports.postRegister = (req, res, next) => {
    const school_id = req.body.school_id;
    const fullname = req.body.fullname;
    const username = req.body.username;
    const password = req.body.password;
    const email = req.body.email;
    const phonenumber = req.body.phoneNumber;
    const date_of_birth = req.body.dob;
    const role = req.body.role;
    pool.getConnection((err, conn) => {
        var sqlQuery = `INSERT INTO student_professor(fullname,username,password,email,phone_number,date_of_birth,role,approval_status, operator_id) VALUES (?,?,?,?,?,?,?,'not approved',?)`;

        conn.promise().query(sqlQuery,[fullname,username,password,email,phonenumber,date_of_birth,role,school_id])
            .then(() => {
              if (err) {
                console.error('Error executing query:', err);
                req.flash('messages', { type: 'error', value: "Something went wrong, Executive could not be deleted." });
                return res.redirect('/operator_mainpage');
            }
                pool.releaseConnection(conn);
                req.flash('messages', { type: 'success', value: "Book returned successfully!" });
                res.render('member_login.ejs')
            })
            .catch(err => {
                req.flash('messages', { type: 'error', value: "Something went wrong, book could not be returned." });
                res.redirect('new_member_registration');
            });
    });
};

exports.SearchBook = (req, res, next) => {
  const stud_prof_id = req.session.stud_prof_id;
  let title = req.body.title;
  let author = req.body.author;
  let category = req.body.category;
  
  // Convert empty strings to null values
  if (title == ''){title = null};
  if(author == ''){author = null};
  if(category == ''){category = null};

  console.log(stud_prof_id);
  console.log(title);
  console.log(author);
  console.log(category);

  if (title ==null & author == null & category == null){
    pool.getConnection((err, conn) => {
      var sqlQuery = `SELECT b.book_id, b.title, b.image, b.summary, b.available_copies,
      GROUP_CONCAT(DISTINCT ba.author) AS author,
      GROUP_CONCAT(DISTINCT btc.thematic_category) AS thematic_category
      FROM book b
      JOIN school_unit su ON b.school_id = su.school_id
      JOIN student_professor sp ON su.school_id = sp.operator_id
      LEFT JOIN book_authors ba ON b.book_id = ba.book_id
      LEFT JOIN book_thematic_categories btc ON b.book_id = btc.book_id
      WHERE sp.stud_prof_id = ${stud_prof_id}
      GROUP BY b.book_id, b.title, b.image, b.summary, b.available_copies;
      `;

      conn.promise().query(sqlQuery,[stud_prof_id])
        .then(([results]) => {
          // Render the view with both sets of results
          res.render('search_results.ejs', {
            pageTitle: "Search results",
            results: results,

          });
          console.log(results);
        })
        .then(() => pool.releaseConnection(conn))
        .catch(err => console.log(err));
    });
  }
  else{
    pool.getConnection((err, conn) => {
      var sqlQuery = `CALL search_book_by_title_author_category(?,?,?,?)`;

      conn.promise().query(sqlQuery,[stud_prof_id,title,author,category])
        .then(([results]) => {
          // Render the view with both sets of results
          res.render('search_results.ejs', {
            pageTitle: "Search results",
            results: results[0],
          });
          console.log(results);
        })
        .then(() => pool.releaseConnection(conn))
        .catch(err => console.log(err));
    });
  }
}


 
exports.MakeReservation = (req, res, next) => {
  // Retrieve the book data from the request body
    const bookId = req.body.book_id;
    const stud_prof_id = req.session.stud_prof_id;
    console.log(bookId);
    pool.getConnection((err, conn) => {
    if (err) {
      //console.log(err);
      req.flash('messages', { type: 'error', value: 'Something went wrong.' });
      res.render('search_results.ejs');
      return;
  }

      // Get the current date
      const currentDate = new Date();

      // Calculate the return date (current date + 7 days)
      const expiry_date = new Date();
      expiry_date.setDate(currentDate.getDate() + 7);

      // Insert the new borrowing into the book_borrowing table
      
      const insertReservationQuery = `INSERT INTO reservations (book_id, stud_prof_id, reservation_date, expiry_date, status) VALUES (?, ?, ?, ?, 'active')`;
      conn.query(
          insertReservationQuery,
          [bookId, stud_prof_id, currentDate, expiry_date],
          (err, insertResult) => {
              if (err) {
                  console.log(err);
                  res.render('reached_limit_in_reservations.ejs');
                  return;
              }
              res.render('member_mainpage.ejs');
          }
      );
  });
}

exports.getMyBorrowings = (req, res) => {
  // Fetch school units from the database
  const stud_prof_id = req.session.stud_prof_id;
  pool.getConnection((err, conn) => {
    if (err) {
      console.error(err);
      return res.status(500).send('Internal Server Error');
    }
    var sqlQuery = `SELECT bb.*, b.title
                    FROM book_borrowing bb
                    JOIN book b ON bb.book_id = b.book_id
                    WHERE bb.stud_prof_id = ${stud_prof_id}`;
    conn.promise()
      .query(sqlQuery)
      .then(([results]) => {
        console.log(results)
        // Render the view with school units
        res.render('my_borrowings.ejs', {
          pageTitle: 'My borrowinngs',
          borrowings:results
        });
      })
      .then(() => pool.releaseConnection(conn))
      .catch(err => {
        console.error(err);
        res.status(500).send('Internal Server Error');
      });
  });
};


exports.getLoginPage = (req, res, next) => {
  res.render('member_login.ejs')
}

exports.getMyReviewsPage = (req, res, next) => {
  
  const stud_prof_id = req.session.stud_prof_id;
  pool.getConnection((err, conn) => {
    if (err) {
      console.error(err);
      return res.status(500).send('Internal Server Error');
    }
    var sqlQuery = `SELECT r.*, b.title
                    FROM reviews r
                    JOIN book b ON r.book_id = b.book_id
                    WHERE r.stud_prof_id = ${stud_prof_id}
                      `;
    conn.promise()
      .query(sqlQuery)
      .then(([results]) => {
        console.log(results)

        // Render the view with school units
        res.render('my_reviews.ejs', {
          pageTitle: 'My reviews',
          reviews:results
        });
      })
      .then(() => pool.releaseConnection(conn))
      .catch(err => {
        console.error(err);
        res.status(500).send('Internal Server Error');
      });
  });
}

exports.getAddReviewPage = (req, res, next) => {
  res.render('add_review.ejs')
}


exports.postReview = (req, res) => {
  const { title, ISBN, reviewText, rating } = req.body;
  const stud_prof_id = req.session.stud_prof_id;
  console.log(title);
  console.log(ISBN);
  // Query to retrieve the role based on stud_prof_id
  const roleQuery = `SELECT role FROM student_professor WHERE stud_prof_id = ${stud_prof_id}`;
 const currentDate = new Date();
  // Query to insert the review into the reviews table
  const insertQuery = `INSERT INTO reviews (book_id, stud_prof_id, rating, review_date,review_text, status) VALUES (?, ?, ?, ?,?, ?)`;
  let status = '';
  pool.getConnection((err, conn) => {
    if (err) {
      console.error(err);
      return res.status(500).send('Internal Server Error');
    }

    conn.promise()
      .query(roleQuery)
      .then(([roleResult]) => {
        const role = roleResult[0]?.role;

        if (role === 'professor') {
          const status = 'approved'; //the reviews of the professors are published without the approval of the operator
        } else if (role === 'student') {
          const status = 'not yet approved';
        }

        // Query to retrieve the book_id based on title and ISBN
        const bookQuery = `SELECT book_id FROM book WHERE title = ? AND ISBN = ?`;

        return conn.promise().query(bookQuery, [title, ISBN]);
      })
      .then(([bookResult]) => {
        const bookId = bookResult[0]?.book_id;

        if (bookId) {
          return conn.promise().query(insertQuery, [bookId, stud_prof_id, rating, currentDate, reviewText, status]);
        } else {
          throw new Error('Book not found');
        }
      })
      .then(() => {
        // Redirect to a success page or perform any other necessary actions
        res.redirect('/member_mainpage');
      })
      .catch(err => {
        console.error(err);
        res.status(500).send('Internal Server Error');
      })
      .finally(() => {
        pool.releaseConnection(conn);
      });
  });
};

