import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:project_test/utils/app_colors.dart';
import 'package:project_test/views/widgets/category_tab_view.dart';
import 'package:project_test/views/widgets/home_tab_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>with TickerProviderStateMixin {
late final TabController _tabController;
   
   @override
  void initState() {
    _tabController=TabController(length: 2, vsync: this);
    super.initState();
  }
  //late String email;

  @override
  Widget build(BuildContext context) {
  // final token=ModalRoute.of(context)?.settings.arguments.toString();
  // Map<String,dynamic>jwtDecodedToken=JwtDecoder.decode(token!);
  //  email=jwtDecodedToken['email'];
    return  Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
         children:[ 
              //  TextField(
              //     decoration: InputDecoration(
              //       prefixIcon: const Icon(Icons.search, color: AppColors.grey,),
              //       hintText:'Search ...',
              //       hintStyle:  TextStyle(
              //         color: AppColors.grey4,
              //       ),
                    
              //       fillColor: AppColors.grey2,
              //       filled: true,
              //       border: OutlineInputBorder(
              //         borderRadius: BorderRadius.circular(8.0),
              //         borderSide: BorderSide.none,
              //         ),
              //     ),
                  
              //   ),
               //SizedBox(height:16),
               TabBar(
              controller: _tabController,
              unselectedLabelColor: AppColors.grey,
              indicatorColor: AppColors.primary,
              tabs:const [
               Tab(
                text: 'Home',
               ),
                Tab(
                text: 'Category',
               ),
            ]        
            ),
            const SizedBox(height: 24,),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children:[
                  HomeTabView(),
                  const CategoryTabView(),
                ],
              ),
            ),

        
         ],
        ),
      );
    
  }
}