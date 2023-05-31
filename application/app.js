const express = require('express');

require('custom-env').env('localhost');

/* ROUTES and how to import routes */

const layout = require('./routes/layout');

/* end of ROUTES and how to import routes */

const app = express();
const port = process.env.SERVER_PORT || 3000;

app.listen(port, () => {
    console.log(`🚀 Server running on port ${port}!`);
});

/* Routes used by the project */

app.use('/', layout);

/* End of routes used by the project */

// In case of an endpoint does not exist must return 404.html
app.use((req, res, next) => { res.status(404).render('404.ejs', { pageTitle: '404' }) })
module.exports = app;