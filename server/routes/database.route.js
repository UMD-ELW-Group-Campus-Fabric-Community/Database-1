const express = require('express');
const router = express.Router();
const controller = require('../controller/database.controller');

router.get('/', (req, res) => {
    res.status(200).json({
        message: 'Welcome to the database API'
    });
});

router.get('/programs/:id', controller.getProgram);
router.get('/programs', controller.getProgram);

router.get('/articles/:id', controller.getArticle);
router.get('/articles', controller.getArticle);


module.exports = router;