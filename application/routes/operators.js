const express = require('express');
const router = express.Router();


const operator_login = require('../controllers/operators');

router.get('/operator_login',operator_login.getOperatorLoginPage),
router.post('/operator_mainpage',operator_login.handleLogin_operator),
router.get('/books_per_school',operator_login.getBooks),
router.get('/late_returns',operator_login.getLateReturns),
router.get('/average_rating',operator_login.getAvgRating),
router.get('/operator_password',operator_login.getOperatorPasswordPage),
router.post('/operator_password',operator_login.UpdateOperatorPassword),
router.get('/school_books',operator_login.getSchoolBooksPage),
router.get('/all_the_overdue_borrowers',operator_login.getAllOverdueBorrowersPage),
router.get('/update_books',operator_login.getUpdateBookPage),
router.post('/update_books', operator_login.postUpdateBook),
router.post('/delete_book/:book_id',operator_login.postDeleteBook);
router.get('/add_book',operator_login.getAddBookPage);
router.post('/add_book',operator_login.AddNewBook);
router.get('/all_users',operator_login.getAllUsersPage);
router.post('/delete_user/:id',operator_login.postDeleteUser);


module.exports = router;