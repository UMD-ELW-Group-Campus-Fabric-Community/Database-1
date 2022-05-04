const express = require('express');
const router = express.Router();
const controller = require('../controller/user.controller');

router.get('/', (req, res) => {
    res.status(200).json({
        message: 'Welcome to the user API'
    });
});

router.post('/login', controller.login);
router.post('/register', controller.register);
router.post('/info', controller._authenticateToken, controller.getUser);
router.post('/update', controller._authenticateToken, controller.update);
router.post('/revalidate', controller.revalidateToken);

module.exports = router;