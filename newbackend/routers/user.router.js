const router = require('express').Router();
const UserController = require("../controller/user.controller");
const { authenticate } = require("../middleware/auth.middleware"); 

router.post('/registration', UserController.register);
router.post('/login',UserController.login);
router.post('/sendVerificationCode', UserController.sendVerificationCode);
router.post('/resetPassword', UserController.ResetPassword);
router.post('/verifyCode', UserController.verifyCode);
router.get('/account', authenticate, UserController.getUserInfo);
router.delete('/account', authenticate, UserController.deleteAccount);
router.put('/account', authenticate, UserController.editUserInfo);

module.exports = router;