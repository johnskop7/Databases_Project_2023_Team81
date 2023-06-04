const express = require('express');
const router = express.Router();


const member_login = require('../controllers/stud_prof');

router.post('/member_mainpage',member_login.handleLogin_member );
router.get('/new_member_registration',member_login.getSignUpPage);
router.post('/register',member_login.postRegister);
router.post('/search_book',member_login.SearchBook);
router.post('/make_reservation', member_login.MakeReservation);
router.get('/my_borrowings',member_login.getMyBorrowings);
router.get('/member_login',member_login.getLoginPage);
router.get('/my_reviews',member_login.getMyReviewsPage);
router.get('/add_review',member_login.getAddReviewPage);
router.post('/submit_review',member_login.postReview);
router.get('/my_reservations',member_login.getMyReservations);
router.post('/delete_reservation', member_login.postDeleteReservation);
router.get('/see_all_the_reviews', member_login.getAllReviews);
router.get('/member_password',member_login.getMemberPassword);
router.post('/member_password',member_login.UpdateMemberPassword);
router.get('/my_profile',member_login.getProfilePage);
router.post('/update_professor_profile', member_login.updateProfile);


module.exports = router;