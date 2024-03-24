import 'package:flutter/material.dart';
import 'package:project_test/utils/app_routes.dart';
import 'package:project_test/views/pages/activity_page.dart';
import 'package:project_test/views/pages/diary_page.dart';
import 'package:project_test/views/pages/food_page.dart';
import 'package:project_test/views/pages/growth_page.dart';
import 'package:project_test/views/pages/home_page.dart';
import 'package:project_test/views/pages/login_page.dart';
import 'package:project_test/views/pages/medicine_page.dart';
import 'package:project_test/views/pages/photo_page.dart';
import 'package:project_test/views/pages/signup_page.dart';
import 'package:project_test/views/pages/sleep_page.dart';
import 'package:project_test/views/widgets/custom_buttom_navbar.dart';


class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      
      case AppRoutes.signup:
        return MaterialPageRoute(
          builder: (_) => const SignupPage(),
          settings: settings,
        );
      
        case AppRoutes.login:
        return MaterialPageRoute(
          builder: (_) => const LoginPage(),
          settings: settings,
        );

        case AppRoutes.home:
        return MaterialPageRoute(
          builder: (_) => const CustomBottomNavbar(),//HomePage(),
          settings: settings,
        );

        case AppRoutes.sleep:
        return MaterialPageRoute(
          builder: (_) => const SleepPage(),
          settings: settings,
        );

        case AppRoutes.food:
        return MaterialPageRoute(
          builder: (_) => const FoodPage(),
          settings: settings,
        );

        case AppRoutes.activity:
        return MaterialPageRoute(
          builder: (_) => const ActivityPage(),
          settings: settings,
        );

        case AppRoutes.growth:
        return MaterialPageRoute(
          builder: (_) => const GrowthPage(),
          settings: settings,
        );

        case AppRoutes.medicine:
        return MaterialPageRoute(
          builder: (_) => const MedicinePage(),
          settings: settings,
        );

        case AppRoutes.photo:
        return MaterialPageRoute(
          builder: (_) => const PhotoPage(),
          settings: settings,
        );

        case AppRoutes.diary:
        return MaterialPageRoute(
          builder: (_) => const DiaryPage(),
          settings: settings,
        );


      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(
              child: Text('Error Page!'),
            ),
          ),
          settings: settings,
        );
    }
  }
}
