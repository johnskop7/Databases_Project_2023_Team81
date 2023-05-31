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
    saveUninitialized: false
}));

const port = process.env.SERVER_PORT || 3000;
app.listen(port, () => {
    console.log(`🚀 Server running on port ${port}!`);
});


/* ROUTES and how to import routes */

const loginRouter = require('./routes/login_page');

/* end of ROUTES and how to import routes */

app.use(express.urlencoded({ extended: true }));
app.use(express.json());

/* Routes used by the project */

app.use('/', loginRouter);
app.use('/admin_login' , loginRouter)
app.use('/operator_login' , loginRouter)

/* End of routes used by the project */

// In case of an endpoint does not exist must return 404.html
app.use((req, res, next) => { res.status(404).render('404.ejs', { pageTitle: '404' }) })
module.exports = app;