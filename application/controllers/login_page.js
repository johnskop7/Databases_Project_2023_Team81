// Import the database connection pool
const {pool} = require('../database');

// Handle login request
exports.handleLogin_member = (req, res) => {
    // Retrieve username and password from request body
    const { username, password } = req.body;
  
    // Query the database to check if the user exists
    pool.getConnection((err, conn) => {
      if (err) {
        console.error(err);
        return res.status(500).send('Internal Server Error');
      }
  
      conn.promise()
        .query('SELECT * FROM student_professor WHERE username = ? AND password = ?', [username, password])
        .then(([results]) => {
          // Check if user exists
          res.render('member_login.ejs', {
            pageTitle: "Login Page",
            })
          if (results.length === 0) {
            req.flash('messages', { type: 'error', value: "Try another password or username" })
          }
  
          // User exists, redirect to the desired page or perform any other action
          // For example, redirect to a dashboard page
          // res.redirect('/dashboard');
        })
        .then(() => pool.releaseConnection(conn))
        .catch(err => console.log(err))
    });
  };
  

  exports.handleLogin_admin = (req, res) => {
    // Retrieve username and password from request body
    const { username, password } = req.body;
  
    // Query the database to check if the user exists
    pool.getConnection((err, conn) => {
      if (err) {
        console.error(err);
        return res.status(500).send('Internal Server Error');
      }
  
      conn.promise()
        .query('SELECT * FROM administrator WHERE username = ? AND password = ?', [username, password])
        .then(([results]) => {
          // Check if user exists
          res.render('admin_login.ejs', {
            pageTitle: "Administrator Login Page",
            })
          if (results.length === 0) {
            req.flash('messages', { type: 'error', value: "Try another password or username" })
          }
  
          // User exists, redirect to the desired page or perform any other action
          // For example, redirect to a dashboard page
          // res.redirect('/dashboard');
        })
        .then(() => pool.releaseConnection(conn))
        .catch(err => console.log(err))
    });
  };

  exports.handleLogin_operator = (req, res) => {
    // Retrieve username and password from request body
    const { username, password } = req.body;
  
    // Query the database to check if the user exists
    pool.getConnection((err, conn) => {
      if (err) {
        console.error(err);
        return res.status(500).send('Internal Server Error');
      }
  
      conn.promise()
        .query('SELECT * FROM operator WHERE username = ? AND password = ?', [username, password])
        .then(([results]) => {
          // Check if user exists
          res.render('operator_login.ejs', {
            pageTitle: "Operator login Page",
            })
          if (results.length === 0) {
            req.flash('messages', { type: 'error', value: "Try another password or username" })
        }
  
          // User exists, redirect to the desired page or perform any other action
          // For example, redirect to a dashboard page
          // res.redirect('/dashboard');
        })
        .then(() => pool.releaseConnection(conn))
        .catch(err => console.log(err))
    });
  };