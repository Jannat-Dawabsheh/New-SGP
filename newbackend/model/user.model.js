const mongoose=require('mongoose');
const db=require('../config/db');
const bcrypt=require("bcrypt");

const {Schema}=mongoose;

const userSchema=new Schema({

    username:{
        type: String,
        required: true,
        index: true,
    },
    email:{
        type:String,
        lowercase:true,
        required:true,
        unique:true
    },

    password:{
        type:String,
        unique:true  
    }
});

userSchema.pre('save',async function(){
    try{
       var user=this;
       const hashpass=await bcrypt.hash(user.password,10);
       user.password=hashpass;
    }catch(error){
        throw error;
    }
});

userSchema.methods.comparePassword=async function(userPassword){
    try{
      const isMatch= await bcrypt.compare(userPassword,this.password);
      return isMatch;
    }catch(error){
        throw error;
    }
}

const UserModel=db.model('user',userSchema);
module.exports=UserModel;