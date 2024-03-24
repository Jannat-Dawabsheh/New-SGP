import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:project_test/utils/app_colors.dart';
import 'package:project_test/utils/app_routes.dart';

class CategoryItem{
  final String id;
  final String name;
  final String icon;
  final Color color;
  final String route;

  CategoryItem( {
    required this.id, 
    required this.name, 
    required this.icon, 
    required this.color, 
    required this.route,
   
    });

    CategoryItem copyWith({bool? isFavorite}){
      return CategoryItem(
        id: id,
       name: name, 
       icon: icon, 
       color: color, 
       route: route, 
       );
    }

}
    List<CategoryItem> categories=[
      CategoryItem(id: '1', name: "Sleep", icon: 'assets/images/sleeping-baby.png', color: AppColors.purpleCategory, route: AppRoutes.sleep, ),
      CategoryItem(id: '2', name: "Food", icon: 'assets/images/feeding.png',  color: AppColors.purpleCategory, route: AppRoutes.food, ),
      CategoryItem(id: '3', name: "Activity", icon: 'assets/images/squares.png', color: AppColors.purpleCategory, route: AppRoutes.activity, ),
      CategoryItem(id: '4', name: "Growth", icon: 'assets/images/baby.png', color: AppColors.purpleCategory, route: AppRoutes.growth, ),
      CategoryItem(id: '5', name: "Medicine", icon: 'assets/images/syrup.png', color: AppColors.purpleCategory, route: AppRoutes.medicine, ),
      CategoryItem(id: '6', name: "Photo", icon: 'assets/images/picture.png', color: AppColors.purpleCategory, route: AppRoutes.photo, ),
      CategoryItem(id: '7', name: "Diary", icon: 'assets/images/diary.png', color: AppColors.purpleCategory, route: AppRoutes.diary, ),

    ];