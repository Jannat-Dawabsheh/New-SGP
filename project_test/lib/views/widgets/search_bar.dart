import 'package:flutter/material.dart';
import 'package:project_test/utils/app_colors.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({super.key});

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {
    return 
    // TextField(
    //     decoration: InputDecoration(
    //        fillColor: Colors.amber,
    //         border: OutlineInputBorder(
    //         borderSide:
    //             BorderSide(width: 3,), 
    //             borderRadius: BorderRadius.circular(20.0),
    //          ),
    //         prefixIcon: const Icon(Icons.search, color: Colors.grey,),
    //         hintText:'Search',
    //                 hintStyle: const TextStyle(
    //                   color: Colors.grey,
    //                 ),
    //       ),
    //     );
     TextField(
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.search, color: AppColors.grey,),
                    hintText:'Search ...',
                    hintStyle: const TextStyle(
                      color: AppColors.grey,
                    ),
                    
                    fillColor: AppColors.white,
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide.none,
                      ),
                  ),
                  
                );
    // Container(
    //   decoration: BoxDecoration(
    //     color: Colors.transparent,
    //       borderRadius: BorderRadius.circular(20),
    //       border: Border.all(color: Colors.grey[400]!, width: 1),
    //   ),
    //   child: const Padding(
    //     padding:  EdgeInsets.symmetric(horizontal: 16, vertical: 2),
    //     child: Row(
    //       children: [
    //         Icon(Icons.search),
    //         SizedBox(width: 8,),
    //         Expanded(
    //           child: TextField(
    //             decoration: InputDecoration(
    //               hintText: "Search smething...",
    //               border: InputBorder.none,
    //             ),
    //           ),
    //         ),
    //          //Icon(PhosphorIcons.sliders_horizontal),
      
    //       ],
      
      
    //     ),
    //   ),
    // );
    
    //  Container(
    //   padding: const EdgeInsets.all(32),
    //   child: const TextField(
    //     decoration: InputDecoration(
    //       labelText: 'Search',
    //       hintText:'Search' ,
    //       border: OutlineInputBorder(),
    //       prefixIcon: Icon(Icons.search),
    //     ),
    //   ),
    // );
  }
}