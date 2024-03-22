const UserModel=require('../model/user.model');
const ChildModel = require('../model/child.model');
const EmailService = require("../services/email.services");
const jwt=require('jsonwebtoken');
const bcrypt = require("bcrypt");

class UserService{
    static async registerUser(username,email,password){
        try{
          const createUser = new UserModel({username,email,password});
          await createUser.save();

          const subject = 'Verification Email ';
          const text = `You have registered successfully `;
          await EmailService.sendEmail(email, subject, text);
          return { user: createUser};
        }catch(err){
           throw err;
        }
    }

    static async checkuser(email){
      try{
        return await UserModel.findOne({email});
      }catch(err){
         throw err;
      }
  }

  static async generateToken(tokenData,secretKey,jwt_expire){
     return jwt.sign(tokenData,secretKey,{expiresIn:jwt_expire});
  }
  
  static async generateVerificationCode(email) {
   
    const verificationCode = Math.floor(1000 + Math.random() * 9000).toString();
  
    this.verificationCodes[email] = verificationCode;

   return verificationCode;
  }
  
  
  static async verifyCode(email, verificationCode) {
    try {
       
        const storedVerificationCode = this.verificationCodes[email];
        if (!storedVerificationCode || storedVerificationCode !== verificationCode) {
            throw new Error('Invalid verification code');
        }
    } catch (err) {
        throw err;
    }
    
}


static async ResetPassword(email,newPassword) {
  try {
      const user = await UserModel.findOne({ email });
      if (!user) {
          throw new Error('User not found');
      }
      user.password = newPassword;
      await user.save();        
      delete this.verificationCodes[email];
  } catch (err) {
      throw err;
  }
  
}
 
static async getUserInfo(email) {
  try {
      return await UserModel.findOne({ email }).select('-password');
  } catch (err) {
      throw err;
  }
}

static async deleteAccount(userId) {
  try {
      await UserModel.findByIdAndDelete(userId);
      await ChildModel.deleteMany({ motherUserId: userId });
  } catch (err) {
      throw err;
  }
}


static async editUserInfo(userId, newUserInfo) {
  try {
      await UserModel.findByIdAndUpdate(userId, newUserInfo);
  } catch (err) {
      throw err;
  }
}
}

UserService.verificationCodes = {};

module.exports=UserService;