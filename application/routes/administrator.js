const express = require('express');
const router = express.Router();


const admin_login = require('../controllers/administrator');

router.get('/admin_login',admin_login.getAdminLoginPage);
router.post('/admin_mainpage',admin_login.handleLogin_admin );


module.exports = router;