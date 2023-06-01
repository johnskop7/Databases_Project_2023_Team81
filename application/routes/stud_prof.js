const express = require('express');
const router = express.Router();


const member_login = require('../controllers/stud_prof');

router.post('/member_mainpage',member_login.handleLogin_member );

module.exports = router;