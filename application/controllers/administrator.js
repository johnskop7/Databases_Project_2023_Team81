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
    const username = req.body.username;
    const password = req.body.password;

    console.log('Reached query!')
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
            // Check if user exists
            res.render('admin_login.ejs', {
            pageTitle: "Administrator Login Page",
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