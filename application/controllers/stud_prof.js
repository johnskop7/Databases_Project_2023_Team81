// Import the database connection pool
const {pool} = require('../database');

// Handle login request
exports.handleLogin_member = (req, res) => {
    // Check for messages in order to show them when rendering the page
    console.log('Reached controller!')
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
            console.log('Reached query!')
            // User doesn't exist, add an error message
            res.redirect('/');
            req.flash('messages', { type: 'error', value: 'Invalid username or password' });
          
          }
          else {
         // Render the login page with the updated messages array
          res.redirect('/admin_login')
        }
        })
        .then(() => pool.releaseConnection(conn))
        .catch(err => console.log(err));
    });
  };
  