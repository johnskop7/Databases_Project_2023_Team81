const { pool } = require('../database');

/* Controller to render data shown in landing page */
exports.getLanding = (req, res, next) => {

    /* check for messages in order to show them when rendering the page */
   
    /* create the connection */
    pool.getConnection((err, conn) => {

        /* execute query to get best dribbler */
        let Programs = new Promise((resolve, reject) => {
            conn.promise().query("SELECT * FROM book")
            .then(([rows, fields]) => {
                res.render('landing.ejs', {
                pageTitle: "Landing Page",
                programs: rows,
                })
             })
            .then(() => pool.releaseConnection(conn))
            .catch(err => console.log(err))
        })
    })
}