const express = require('express');
const router = express.Router();


const admin_login = require('../controllers/administrator');

router.post('/admin_login',admin_login.handleLogin_admin );
router.get('/',admin_login.getAdminLoginPage);

module.exports = router;