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
    console.log(copies);
  
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
          console.log(results);
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
      console.log(firstname);
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
              console.log(results)
            })
            .then(() => pool.releaseConnection(conn))
            .catch(err => console.log(err))
        })
          
      };
      
      
exports.getAvgRating = (req, res) => {
        const studentName = req.query.studentName;
        const category = req.query.category;
        const operatorId = req.session.operatorId;
        console.log(operatorId);
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
      console.log(operatorId)
      pool.getConnection((err, conn) => {
        var sqlQuery = `
        SELECT b.title, GROUP_CONCAT(DISTINCT a.author) AS author, GROUP_CONCAT(DISTINCT c.thematic_category) AS thematic_category,b.publisher,b.ISBN,b.number_of_pages,b.image,b.language,b.summary,b.key_words, b.available_copies 
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
  

