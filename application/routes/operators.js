const express = require('express');
const router = express.Router();


const operator_login = require('../controllers/operators');

router.get('/operator_login',operator_login.getOperatorLoginPage),
router.post('/operator_mainpage',operator_login.handleLogin_operator),
router.get('/books_per_school',operator_login.getBooks),
router.get('/late_returns',operator_login.getLateReturns),
router.get('/average_rating',operator_login.getAvgRating);


module.exports = router;