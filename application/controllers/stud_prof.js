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
          res.redirect('/admin_login')
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
    console.log(role);
    console.log(school_id) 
    console.log(fullname) 
    console.log(username) 
    console.log(password) 
    console.log(email)
    console.log(phonenumber) 
    console.log(date_of_birth) 
   
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
