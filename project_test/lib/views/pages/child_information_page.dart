import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:project_test/utils/app_colors.dart';
import 'package:project_test/utils/app_routes.dart';
import 'package:intl/intl.dart';
import 'package:flutter_toggle_tab/flutter_toggle_tab.dart';

class ChildInformationPage extends StatefulWidget {
  const ChildInformationPage({super.key});

  @override
  State<ChildInformationPage> createState() => _ChildInformationPageState();
}

class _ChildInformationPageState extends State<ChildInformationPage> {
  late final GlobalKey<FormState> _formKey;
  late final TextEditingController _userName,dateInput;
  String? _name,_date,_sex;
    final ValueNotifier<int> _tabIndexIconButton =ValueNotifier(0);

  List<IconData> get _listIconTabToggle => [
        FontAwesomeIcons.child,
        FontAwesomeIcons.childDress,
      ];

  List<String> get _listGenderEmpty => ["male", "female"];

  @override
  void initState() {
    _formKey = GlobalKey<FormState>();
    _userName = TextEditingController();
    dateInput=TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _userName.dispose();
    dateInput.dispose();
    super.dispose();
  }
  void addChildInformation(){
    if (_formKey.currentState!.validate()) {
      _date=dateInput.text;
      debugPrint("$_name   $_date  ${_tabIndexIconButton.value}");
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Form(
              key: _formKey,
              child: Center(
                child: Column(
                 // mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                     Padding(
                       padding: const EdgeInsets.all(16.0),
                       child: Text(
                        'Let\'s verify your child information ',
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                         fontWeight: FontWeight.bold
                        ),
                        ),
                     ),
                      const SizedBox(height: 5.0),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Text(
                        'We will use this information to give age appropriate recommendations',
                        style: Theme.of(context).textTheme.titleMedium!.copyWith(
                         color: AppColors.grey,
                        ),
                        textAlign: TextAlign.center,
                        ),
                      ),
                      const SizedBox(height: 40.0),
                      SizedBox(
                        width: MediaQuery.sizeOf(context).width*0.8,
                        child: TextFormField(
                          
                          controller: _userName,
                          onChanged: (value) => _name = value,
                          textInputAction: TextInputAction.next,
                          onEditingComplete: () {
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your child Name';
                            }else {
                              return null;
                            }
                          },
                          decoration: InputDecoration(
                            labelText: "Name",
                            labelStyle: const TextStyle(color: AppColors.grey), 
                            prefixIcon: const Padding(
                              padding:  EdgeInsets.only(left: 20, right:5 ),
                              child:  Icon(PhosphorIcons.baby_bold),
                            ),
                            prefixIconColor: AppColors.black,
                            
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
                      ),
                      
                      const SizedBox(height: 20.0),
                
                       SizedBox(
                        width: MediaQuery.sizeOf(context).width*0.8,
                        child: TextFormField(
                          
                          controller: dateInput,
                          onChanged: (value) => _date = value,
                          textInputAction: TextInputAction.done,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your child Birthday';
                            }else {
                              return null;
                            }
                          },
                          decoration: InputDecoration(
                            labelText: "Birthday",
                            labelStyle: const TextStyle(color: AppColors.grey), 
                            prefixIcon: const Padding(
                              padding:  EdgeInsets.only(left: 20, right:5 ),
                              child:  Icon(Icons.calendar_today),
                            ),
                            prefixIconColor: AppColors.black,
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
                          readOnly: true,
                          onTap: () async {
                            DateTime? pickedDate = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(1950),
                                lastDate: DateTime(2100),
                                );
                                
                            if (pickedDate != null) {
                              String formattedDate =DateFormat('yyyy-MM-dd').format(pickedDate);
                              setState(() {
                                dateInput.text =formattedDate; //set output date to TextField value.
                              });
                            } else {}
                          },
                        ),
                      ),
                
                      const SizedBox(height: 40.0),
                
                      Padding(
                         padding: const EdgeInsets.all(16),
                         child: ValueListenableBuilder(
                           valueListenable: _tabIndexIconButton,
                           builder: (context, currentIndex, _) {
                             return FlutterToggleTab(
                               width: 50,
                               borderRadius: 8,
                               selectedIndex: currentIndex,
                               selectedTextStyle: const TextStyle(
                                 color: Colors.white,
                                 fontSize: 18,
                                 fontWeight: FontWeight.w600,
                               ),
                               unSelectedTextStyle: const TextStyle(
                                 color: Colors.grey,
                                 fontSize: 14,
                                 fontWeight: FontWeight.w400,
                               ),
                               selectedBackgroundColors: [ currentIndex==0?AppColors.blueCategory:AppColors.pinkCategory],
                               labels: _listGenderEmpty,
                               icons: _listIconTabToggle,
                               iconSize: 35,
                               selectedLabelIndex: (index) {
                                 _tabIndexIconButton.value = index;
                               },
                             );
                           },
                         ),
                       ),
                 
                      //const SizedBox(height: 40.0),
                       Spacer(),
                      SizedBox(
                        width: MediaQuery.sizeOf(context).width*0.6,
                        height: MediaQuery.sizeOf(context).height*0.08,
                        child: ElevatedButton(
                                onPressed: (){
                                  //Navigator.of(context, rootNavigator: true).pushNamed(AppRoutes.testPage);
                                addChildInformation();
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.primary,
                                  foregroundColor: AppColors.white,
                                ),
                                child: Text(
                                  "Save and add child",
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium!
                                        .copyWith(
                                            color: AppColors.white,
                                            fontWeight: FontWeight.w600
                                        )
                                ),
                        ),
                      ),
                      
                      Container(
                         width: double.infinity,
                        height: MediaQuery.sizeOf(context).height*0.14,
                      child: Image.asset(
                          'assets/images/cloud2.png',
                          fit: BoxFit.fill,
                      ),           
                      ),
                      
                  ],
                ),
              ),
              )
    );
  }
}