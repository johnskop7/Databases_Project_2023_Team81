const express = require('express');
const router = express.Router();


const operator_login = require('../controllers/operators');

router.get('/operator_login',operator_login.getOperatorLoginPage);
router.post('/operator_mainpage',operator_login.handleLogin_operator);


module.exports = router;