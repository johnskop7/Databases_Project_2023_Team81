const express = require('express');
const router = express.Router();


const member_login = require('../controllers/stud_prof');

router.post('/member_mainpage',member_login.handleLogin_member );
router.get('/new_member_registration',member_login.getSignUpPage);
router.post('/register',member_login.postRegister);

module.exports = router;