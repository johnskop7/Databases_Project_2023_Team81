const express = require('express');
const router = express.Router();

const homepage = require('../controllers/get_home')
router.get('/',homepage.getHome);

module.exports = router;