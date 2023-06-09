const express = require('express');
const router = express.Router();


const admin_route = require('../controllers/administrator');

router.get('/admin_login',admin_route.getAdminLoginPage);
router.post('/admin_mainpage',admin_route.handleLogin_admin );
router.get('/authors_prof_genres',admin_route.getGenreInfo);
router.get('/prof_with_most_borrowings',admin_route.getProfWithMostBorrowings);
router.get('/authors_with_no_borrowings',admin_route.getAuthorsWithNoBorrowings);
router.get('/top3_pairs',admin_route.getTop3Pairs),
router.get('/authors_with_five_or_less',admin_route.getAuthorsWithFiveOrLessBooks),
router.get('/operators_with_same_loans',admin_route.getOperatorsWithSameLoans),
router.get('/borrowings_per_school',admin_route.BorrowingsPerSchool),
router.get('/admin_profile',admin_route.getAdminProfilePage),
router.post('/admin_profile',admin_route.UpdateAdminPassword),
router.get('/member_login',admin_route.getBacktotheMainPage);
router.get('/applications_for_libraries',admin_route.getApplicationsPage);
router.post('/dismiss_application',admin_route.postDismissLibrary);
router.post('/accept_application',admin_route.postAcceptLibrary);


module.exports = router;