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
    const category = req.query.categroy;
    const author = req.query.author;
    const copies = req.query.copies;
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
      .query('CALL list_title_authors(?,?,?,?,?)', [operatorId,title,category,author,copies])
      .then(([results]) => {
             // Render the view with both sets of results
              res.render('books_per_school.ejs', {
              pageTitle: "Query 3.2.1",
              results: results,
            });
            //console.log(results)
          })
          .then(() => pool.releaseConnection(conn))
          .catch(err => console.log(err))
      })
        
    };

exports.getLateReturns = (req, res) => {
      const firstname = req.query.firstname;
      const lastname = req.query.lastname;
      const overdueDays = req.query.overdueDays;
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