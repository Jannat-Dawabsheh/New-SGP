

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:project_test/config.dart';
import 'package:project_test/views/widgets/code_verification_model_sheet.dart';
import 'package:http/http.dart' as http;

import '../../utils/app_colors.dart';

class forgetPasswordModelSheet extends StatefulWidget {
  const forgetPasswordModelSheet({super.key});

  @override
  State<forgetPasswordModelSheet> createState() => _forgetPasswordModelSheetState();
}

class _forgetPasswordModelSheetState extends State<forgetPasswordModelSheet> {
    late final GlobalKey<FormState> _formKey;
  late final TextEditingController _emailControler;
  late FocusNode _emailFocusNode;
  String? _email;
  bool userFound=true;
  @override
  void initState() {
    _formKey=GlobalKey<FormState>();
    _emailControler=TextEditingController();
    _emailFocusNode=FocusNode();
    userFound=true;
    super.initState();
  }
  @override
  void dispose() {
    _emailControler.dispose();
    super.dispose();
  }
  void sendCode()async{
    if(_formKey.currentState!.validate()){
      var userEmail = {
        "email":_email,
      };
      var response = await http.post(Uri.parse(sendVerificationCode),
      headers: {"Content-Type":"application/json"},
      body: jsonEncode(userEmail)
      );
      var jsonResponse = jsonDecode(response.body);
      final int statusCode = response.statusCode;
      print(statusCode);
      if(statusCode==200){
        Navigator.of(context).pop();
        showModalBottomSheet(
        context: context, 
        builder: (context)=> CodeVerificationModelSheet(email:_email),
        );
        setState(() {
          userFound=true;
        });
      }else{
        setState(() {
          userFound=false;
        });
      }
 
    }
 }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350,
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal:20.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 24,),
                  Text("Forgot Password?", style: Theme.of(context).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.bold, color: AppColors.primary),),
                  const SizedBox(height: 8,),
                  Text("Don't worry it happens. Please enter the address associated with your account", style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: AppColors.grey,
                  ),),
                  const SizedBox(height: 36,),
                  Text("Email", style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),),
                  const SizedBox(height: 8,),
                  TextFormField(
                    controller: _emailControler,
                    onChanged: (value) => _email=value,
                    validator: (value) {
                      if(value==null || value.isEmpty){
                        return 'Please enter your email';
                      }else if(!value.contains('@')){
                        return 'Please enter a valid email';
                      }else{
                        return null;
                      }
                    },
                    keyboardType: TextInputType.emailAddress,
                    focusNode: _emailFocusNode,
                    textInputAction: TextInputAction.done,
                    onEditingComplete: () {
                      _emailFocusNode.unfocus();
                      sendCode();
                    },
                    
                    decoration: InputDecoration(
                      hintText: "Enter your Email",
                      prefixIcon: const Icon(Icons.email_outlined),
                      prefixIconColor: AppColors.grey4, 
                     enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: BorderSide(color:userFound?AppColors.grey4:AppColors.red, width: 1.0),
                      ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: BorderSide(color:userFound?AppColors.primary:AppColors.red, width: 2.0),
                    ),
                    errorBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: AppColors.red),
                    borderRadius: BorderRadius.circular(30.0),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide:const BorderSide(color: AppColors.red),
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                    
                  ),
                   const SizedBox(height: 24,),
                   SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                      onPressed:sendCode,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        foregroundColor: AppColors.white,
                      ),
                      child: Text("Send Code",style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: AppColors.white,
                      fontWeight: FontWeight.w600
                         )),
                      ),  
                    ),

                ],
                    ),
                
              ),
            ),
            
          );
       
    
  }
}