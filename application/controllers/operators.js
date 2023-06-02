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

    console.log('Reached controller!')
  
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
            res.render('operator_login.ejs', {
            pageTitle: "Operator login Page",
            messages: messages
            })
          }
          // User exists, redirect to the desired page or perform any other action
          // For example, redirect to a dashboard page
          // res.redirect('/dashboard');
        })
        .then(() => pool.releaseConnection(conn))
        .catch(err => console.log(err))
    });
  };