const express = require('express');
const path = require('path');
const session = require('express-session');
const flash = require('connect-flash');
const app = express();

app.use(express.json());
app.use(express.urlencoded({ extended: true }));

app.use(express.static(path.join(__dirname, 'public')));
app.set('view engine', 'ejs');
app.set('views', 'views');

app.use(flash());
app.use(session({
    secret: "ThisShouldBeSecret",
    resave: false,
    saveUninitialized: true
}));

const port = process.env.SERVER_PORT || 3000;
app.listen(port, () => {
    console.log(`🚀 Server running on port ${port}!`);
});


/* ROUTES and how to import routes */


const adminloginRouter = require('./routes/administrator');
const operatorloginRouter = require('./routes/operators');
const memberloginRouter = require('./routes/stud_prof');
const homepageRouter = require('./routes/get_home');

/* end of ROUTES and how to import routes */

app.use(express.urlencoded({ extended: true }));
app.use(express.json());

/* Routes used by the project */

app.use('/', homepageRouter);
app.use('/', memberloginRouter);
app.use('/', adminloginRouter);
app.use('/', operatorloginRouter);

/* End of routes used by the project */

// In case of an endpoint does not exist must return 404.html
app.use((req, res, next) => { res.status(404).render('404.ejs', { pageTitle: '404' }) })
module.exports = app;