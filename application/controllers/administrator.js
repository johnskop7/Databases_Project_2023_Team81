// Import the database connection pool
const {pool} = require('../database');

exports.getAdminLoginPage= (req, res, next) => {
    res.render('admin_login.ejs', {
        pageTitle: 'Administrator Login Page',
        messages: [] // You can pass any desired messages to display on the admin login page
      });
}

exports.handleLogin_admin = (req, res ) => {

    /* check for messages in order to show them when rendering the page */
    let messages = req.flash("messages");
    if (messages.length == 0) messages = [];

    // Retrieve username and password from request body
    const username = req.body.admin_username;
    const password = req.body.admin_password;

    // console.log(username)
    // Query the database to check if the user exists
    pool.getConnection((err, conn) => {
      if (err) {
        console.error(err);
        return res.status(500).send('Internal Server Error');
      }
  
      conn.promise()
        .query('SELECT * FROM administrator WHERE username = ? AND password = ?', [username, password])
        .then(([results]) => {
            if (results.length === 0) {

              res.redirect('/admin_login')
              req.flash('messages', { type: 'error', value: 'Invalid username or password' });
          }
          else{
            res.render('admin_mainpage.ejs', {
                pageTitle: 'Administrator Main Page',
                messages: [] // You can pass any desired messages to display on the admin login page
              });
            
            }
        })
        .then(() => pool.releaseConnection(conn))
        .catch(err => console.log(err))
    });
  };


  exports.getGenreInfo = (req, res) => {
    const genre = req.query.genre;
    // console.log(genre);
    // Query the database with the genre parameter
    pool.getConnection((err, conn) => {
      if (err) {
        console.error(err);
        return res.status(500).send('Internal Server Error');
      }
      conn.promise()
      .query('CALL authors_belong_to_category(?)', [genre])
      .then(([results]) => {
        // Process the results or perform any other actions
        const authors = results[0];

        // Run another query
        return conn.promise().query('CALL teachers_borrowed_books_from_category(?)', [genre])
          .then(([results1]) => {
            // Process the results of the second query
            const professors = results1[0];

            // Render the view with both sets of results
            res.render('authors_prof_genres.ejs', {
              pageTitle: "Query 3.1.2",
              authors: authors,
              professors: professors
            });
          });
      })
  
   
        .then(() => pool.releaseConnection(conn))
        .catch(err => console.log(err))
    });
  };


  exports.getProfWithMostBorrowings = (req, res) => {
    /* check for messages in order to show them when rendering the page */
    let messages = req.flash("messages");
    if (messages.length === 0) messages = [];
  
    /* create the connection, execute query, render data */
    pool.getConnection((err, conn) => {
      conn.promise()
        .query('SELECT * FROM prof_with_most_borrowings')
        .then(([rows]) => {
            const professors = rows;
            res.render('prof_with_most_borrowings.ejs', {
            pageTitle: "Professors With Most Borrowings Page",
            professors: professors,
            messages: messages
          });
        })
        .then(() => pool.releaseConnection(conn))
        .catch(err => console.log(err));
    });
  };
  
  exports.getAuthorsWithNoBorrowings = (req, res) => {
    /* check for messages in order to show them when rendering the page */
    let messages = req.flash("messages");
    if (messages.length === 0) messages = [];
  
    /* create the connection, execute query, render data */
    pool.getConnection((err, conn) => {
      conn.promise()
        .query('SELECT * FROM authors_with_no_borrowing')
        .then(([rows]) => {
            const authors = rows;
            res.render('authors_with_no_borrowings.ejs', {
            pageTitle: "Authors With No Borrowings Page",
            authors: authors,
            messages: messages
          });
          console.log(authors);
        })
        .then(() => pool.releaseConnection(conn))
        .catch(err => console.log(err));
    });
  };


  exports.getTop3Pairs = (req, res) => {
    /* check for messages in order to show them when rendering the page */
    let messages = req.flash("messages");
    if (messages.length === 0) messages = [];
  
    /* create the connection, execute query, render data */
    pool.getConnection((err, conn) => {
      conn.promise()
        .query('SELECT * FROM top_3_pairs')
        .then(([rows]) => {
            const pairs = rows;
            res.render('top3_pairs.ejs', {
            pageTitle: "Top3 pairs of book genres Page",
            pairs: pairs,
            messages: messages
          });
          console.log(pairs);
        })
        .then(() => pool.releaseConnection(conn))
        .catch(err => console.log(err));
    });
  };


  exports.getAuthorsWithFiveOrLessBooks = (req, res) => {
    /* check for messages in order to show them when rendering the page */
    let messages = req.flash("messages");
    if (messages.length === 0) messages = [];
  
    /* create the connection, execute query, render data */
    pool.getConnection((err, conn) => {
      conn.promise()
        .query('SELECT * FROM authors_with_five_or_less')
        .then(([rows]) => {
            const authors = rows;
            res.render('authors_with_five_or_less.ejs', {
            pageTitle: "Authors With Five or Less Books Than the Author with the most books Page",
            authors: authors,
            messages: messages
          });
          console.log(authors);
        })
        .then(() => pool.releaseConnection(conn))
        .catch(err => console.log(err));
    });
  };

