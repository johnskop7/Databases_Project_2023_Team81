const express = require('express');
const router = express.Router();

// Import the login controller
const handleLogin = require('../controllers/login_page');


// Handle POST request to '/login'
router.get('/', handleLogin.handleLogin_member);
router.get('/admin_login' , handleLogin.handleLogin_admin);
router.get('/operator_login', handleLogin.handleLogin_operator);

module.exports = router;
