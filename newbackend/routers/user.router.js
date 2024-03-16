const router=require('express').Router();
const UserController=require("../controller/user.controller");
router.post('/registeration',UserController.register);
router.post('/login',UserController.login);
router.post('/sendVerificationCode', UserController.sendVerificationCode);
router.post('/resetPassword', UserController.ResetPassword);
router.post('/verifyCode', UserController.verifyCode);
module.exports=router;