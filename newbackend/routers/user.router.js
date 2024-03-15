const router=require('express').Router();
const UserController=require("../controller/user.controller");
router.post('/registeration',UserController.register);
router.post('/login',UserController.login);
router.post('/sendVerificationCode', UserController.sendVerificationCode);
router.post('/resetPassword', UserController.verifyCodeAndResetPassword);
module.exports=router;