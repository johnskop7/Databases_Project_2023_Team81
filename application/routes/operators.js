const express = require('express');
const router = express.Router();


const operator_login = require('../controllers/operators');

router.post('/operator_login',operator_login.handleLogin_operator );
router.get('/',operator_login.getOperatorLoginPage);

module.exports = router;