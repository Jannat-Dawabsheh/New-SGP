import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:project_test/config.dart';
import 'package:project_test/views/pages/login_page.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_routes.dart';
import 'package:http/http.dart' as http;

class CreateNewPasswordModelSheet extends StatefulWidget {
   final email;
  const CreateNewPasswordModelSheet({super.key, this.email});

  @override
  State<CreateNewPasswordModelSheet> createState() => _CreateNewPasswordModelSheetState();
}

class _CreateNewPasswordModelSheetState extends State<CreateNewPasswordModelSheet> {
 late final GlobalKey<FormState> _formKey;
  late final TextEditingController _confirmPasswordControler;
  late final TextEditingController _passwordControler;
  late FocusNode _confirmFocusNode,_passwordFocusNode;
  String? _confirmPassword,_password;
  bool visibility=false, confirmVisibility=false;
  @override
  void initState() {
    _formKey=GlobalKey<FormState>();
    _confirmPasswordControler=TextEditingController();
    _passwordControler=TextEditingController();
    _confirmFocusNode=FocusNode();
    _passwordFocusNode=FocusNode();
    super.initState();
  }
  @override
  void dispose() {
    _confirmPasswordControler.dispose();
    _passwordControler.dispose();
    super.dispose();
  }

  Future<void> changePassword() async {
    if(_formKey.currentState!.validate()){
      var resetToNewPassword = {
        "email":widget.email,
        "newPassword":_password,
      };
      var response = await http.post(Uri.parse(resetPassword),
      headers: {"Content-Type":"application/json"},
      body: jsonEncode(resetToNewPassword)
      );
      var jsonResponse = jsonDecode(response.body);
      final int statusCode = response.statusCode;
      print(statusCode);
      if(statusCode==200){
        Navigator.of(context).pop();
         ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          behavior: SnackBarBehavior.floating, 
          content: Text('Password changed successfully'),
          ),
        );
        Navigator.of(context).pushNamed(AppRoutes.login);
      }else{
       
      }
    
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal:20.0),
            child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 24,),
                    Text("Reset Password", style: Theme.of(context).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.bold, color: AppColors.primary),),
                    const SizedBox(height: 8,),
                    Text("Enter your new password", style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: AppColors.grey,
                    ),),
                    const SizedBox(height: 36,),
                     Text("Password", style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),),
                    const SizedBox(height: 8,),
                    TextFormField(
                      controller: _passwordControler,
                      onChanged: (value) => _password=value,
                      focusNode: _passwordFocusNode,
                      textInputAction: TextInputAction.next,
                      onEditingComplete: () {
                        _passwordFocusNode.unfocus();
                      },
                      validator: (value) {
                        if(value==null || value.isEmpty){
                          return 'Please enter your password';
                        }else if(value.length<6){
                          return 'Password must be at least 6 characters';
                        }else{
                          return null;
                        }
                      },
                      obscureText: !visibility,
                      decoration: InputDecoration(
                        hintText: "Enter your new password",
                        prefixIcon: const Icon(Icons.lock),
                        prefixIconColor: AppColors.grey4, 
                        suffixIcon: InkWell(
                          onTap: (){
                            setState(() {
                              visibility=!visibility;
                            });
                          },
                          child: Icon(visibility?Icons.visibility_off: Icons.visibility),
                          ), 
                        suffixIconColor: AppColors.grey,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          borderSide: BorderSide(color:AppColors.grey4, width: 1.0),
                          ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          borderSide: const BorderSide(color:AppColors.primary, width: 2.0),
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
                     const SizedBox(height: 8,),
                
                     Text("Confirm Password", style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),),
                    const SizedBox(height: 8,),
                    TextFormField(
                      controller: _confirmPasswordControler,
                      onChanged: (value) => _confirmPassword=value,
                      focusNode: _confirmFocusNode,
                      textInputAction: TextInputAction.done,
                      onEditingComplete: () {
                        _confirmFocusNode.unfocus();
                        changePassword();
                      },
                      validator: (value) {
                        if(value==null || value.isEmpty){
                          return 'Please confirm your password';
                        }else if(value!=_password){
                          return 'Your password and confirmation password do not match';
                        }else{
                          return null;
                        }
                      },
                      obscureText: !confirmVisibility,
                       decoration: InputDecoration(
                            hintText: "Confirm your password",
                            prefixIcon: const Icon(Icons.lock),
                            prefixIconColor: AppColors.grey4, 
                            suffixIcon: InkWell(
                              onTap: (){
                                setState(() {
                                  confirmVisibility=!confirmVisibility;
                                });
                              },
                              child: Icon(confirmVisibility?Icons.visibility_off: Icons.visibility),
                              ), 
                            suffixIconColor: AppColors.grey,
                           
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              borderSide: BorderSide(color:AppColors.grey4, width: 1.0),
                              ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              borderSide: const BorderSide(color:AppColors.primary, width: 2.0),
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
                        onPressed:changePassword,
                        child: Text("Change Password",style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: AppColors.white,
                        fontWeight: FontWeight.w600
                           )),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primary,
                          foregroundColor: AppColors.white,
                        ),
                        ),  
                      ),
                      const SizedBox(height: 10,),
                  ],
                  
                      ),
                      
              ),
                
              ),
            ),
          );
       
    
  }
}