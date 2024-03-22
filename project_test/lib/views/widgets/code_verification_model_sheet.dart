import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_verification_code_field/flutter_verification_code_field.dart';
import 'package:project_test/config.dart';
import 'package:project_test/views/widgets/create_new_password_model_sheet.dart';
import 'package:flutter_verification_code/flutter_verification_code.dart';
import '../../utils/app_colors.dart';
import 'package:http/http.dart' as http;
class CodeVerificationModelSheet extends StatefulWidget {
  final email;
  const CodeVerificationModelSheet({super.key, this.email});

  @override
  State<CodeVerificationModelSheet> createState() => _CodeVerificationModelSheetState();
}

class _CodeVerificationModelSheetState extends State<CodeVerificationModelSheet> {
  String? _code;
  bool _onEditing = true;
  bool isVerified=true;
  @override
  void initState() {
    super.initState();
  }
  void submit() async{
    
    var codeVerification = {
        "email":widget.email,
        "verificationCode":_code,
      };
      var response = await http.post(Uri.parse(verifyCode),
      headers: {"Content-Type":"application/json"},
      body: jsonEncode(codeVerification)
      );
      var jsonResponse = jsonDecode(response.body);
      final int statusCode = response.statusCode;
      print(statusCode);
      if(statusCode==200){
        Navigator.of(context).pop();
        setState(() {
          isVerified=true;
        });
        showModalBottomSheet(
        context: context, 
        builder: (context)=> CreateNewPasswordModelSheet(email:widget.email),
        );
      }else{
        setState(() {
          isVerified=false;
        });
        
      }
    }
  
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350,
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal:20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 24,),
                Text("Verification Code", style: Theme.of(context).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.bold, color: AppColors.primary),),
                const SizedBox(height: 8,),
                Text("We have sent the code verification to your email", style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: AppColors.grey,
                ),),
                const SizedBox(height: 36,),
                
                Center(
                  child: VerificationCode(
                        keyboardType: TextInputType.number,
                        length: 4,
                        autofocus: false,
                        cursorColor:AppColors.primary,
                        underlineUnfocusedColor:isVerified?AppColors.grey4:AppColors.red, 
                        underlineColor:isVerified?AppColors.primary:AppColors.red,
                        onCompleted: (String value) {
                          print(value);
                          setState(() {
                            _code = value;
                          });
                        },
                        onEditing: (bool value) {
                          setState(() {
                            _onEditing = value;
                          });
                        },
                      ),
                ),
                    (_onEditing != true)
                        ? Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                              child: Text(
                                isVerified?'Your code is: $_code':'Invalid verification code',
                              ),
                            ),
                          ): Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                              child: Text(
                                'Please enter full code',
                               style: Theme.of(context)
                                    .textTheme
                                    .titleSmall!
                                    .copyWith(
                                      color: AppColors.grey,
                                )),
                                              ),
                            ),
               const SizedBox(height: 36,),
                 SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                    onPressed:submit,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      foregroundColor: AppColors.white,
                    ),
                    child: Text("Submit",style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: AppColors.white,
                    fontWeight: FontWeight.w600
                       )),
                    ),  
                  ),

                  const SizedBox(height: 8,),
                  Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Don't receive the code?",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(
                                    color: AppColors.grey,
                                  )),
                          TextButton(
                            onPressed: () async {
                              var userEmail = {
                              "email":widget.email,
                            };
                            var response = await http.post(Uri.parse(sendVerificationCode),
                            headers: {"Content-Type":"application/json"},
                            body: jsonEncode(userEmail)
                            );
                            },
                            child: Text(
                              "Resend",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(
                                    color: AppColors.primary,
                                  ),
                            ),
                          ),
                        ],
                      ),
                   
              ],
                  ),
            ),
          );
     
  }
}



