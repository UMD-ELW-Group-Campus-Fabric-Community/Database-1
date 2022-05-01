const express = require('express');
const router = express.Router();
const controller = require('../controller/api.controller');

router.get('/', (req, res) => {
    res.status(200).json({
        message: 'Welcome to the database API'
    });
});

router.get('/programs/:program_name', controller.getProgram);
router.get('/programs', controller.getProgram);

router.get('/articles/:article_title', controller.getArticle);
router.get('/articles', controller.getArticle);


module.exports = router;