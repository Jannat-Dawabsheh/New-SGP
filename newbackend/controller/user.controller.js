const UserService=require("../services/user.services");
const EmailService = require("../services/email.services");


exports.register=async(req,res,next)=>{
    try{
      const{username,email,password}=req.body;
      const user=await UserService.checkuser(email);
      if(user){
        res.status(409).json({status:409});
        return;
      }
      const successRes=await UserService.registerUser(username,email,password);
      res.json({status:200,success:"User Registered successfully"});
    }catch(error){
        throw error;
    }
}

exports.login = async (req, res, next) => {
  try {
      const { email, password } = req.body;
      const user = await UserService.checkuser(email);
  
    
      if (!user) {
          res.status(401).json({ status: 401, message: 'Invalid email or password' });
          return;
      }
      const isMatch = await user.comparePassword(password);
  
      if (!isMatch) {
          res.status(401).json({ status: 401, message: 'Invalid email or password' });
          return;
      }
      const tokenData = { _id: user._id, email: user.email };
      const token = await UserService.generateToken(tokenData, "secretKey", '1h');
      res.status(200).json({ status: 200, token: token });
  } catch (error) {
      console.error('Error in login:', error);
      res.status(500).json({ status: 500, message: 'Internal server error' });
  }
}

exports.sendVerificationCode = async (req, res, next) => {
  try {
      const { email } = req.body;
      const user = await UserService.checkuser(email);
      if (!user) {
          res.status(404).json({ status: 404, message: 'User not found' });
          return;
      }
      const verificationCode = await UserService.generateVerificationCode(email);

    
      const subject = 'Verification Code';
      const text = `Your verification code is: ${verificationCode}`;
      const emailSent = await EmailService.sendEmail(email, subject, text);

      if (emailSent) {
          res.status(200).json({ status: 200, message: 'Verification code sent successfully' });
      } else {
          res.status(500).json({ status: 500, message: 'Failed to send verification code' });
      }
  } catch (error) {
      throw error;
  }
}

exports.ResetPassword = async (req, res, next) => {
  try {
      const { email,newPassword } = req.body;
      await UserService.ResetPassword(email, newPassword);
      res.status(200).json({ status: 200, message: 'Password reset successful' });
  } catch (error) {
      res.status(400).json({ status: 400, message: error.message });
  }
}

exports.verifyCode = async (req, res, next) => {
  try {
      const { email, verificationCode} = req.body;
      await UserService.verifyCode(email, verificationCode);
      res.status(200).json({ status: 200, message: 'code verified successfully' });
  } catch (error) {
      res.status(400).json({ status: 400, message: error.message });
  }
}

exports.getUserInfo = async (req, res, next) => {
    try {
        const user = await UserService.getUserInfo(req.user.email);
        res.status(200).json({ status: 200, user });
    } catch (error) {
        res.status(500).json({ status: 500, message: 'Internal server error' });
    }
}


exports.deleteAccount = async (req, res, next) => {
    try {
        const userId = req.user._id; 
        await UserService.deleteAccount(userId);
        res.status(200).json({ status: 200, message: 'Account deleted successfully' });
    } catch (error) {
        console.error(error.message);
        res.status(500).json({ status: 500, message: 'Internal server error' });
    }
};

exports.editUserInfo = async (req, res, next) => {
    try {
        const userId = req.user._id; 
        const { username, email, password } = req.body;
        const newUserInfo = {};
        if (username) newUserInfo.username = username;
        if (email) newUserInfo.email = email;
        if (password) {
            const hashedPassword = await bcrypt.hash(password, 10);
            newUserInfo.password = hashedPassword;
        }
        
        await UserService.editUserInfo(userId, newUserInfo);
        res.status(200).json({ status: 200, message: 'User information updated successfully' });
    } catch (error) {
        console.error(error.message);
        res.status(500).json({ status: 500, message: 'Internal server error' });
    }
};

