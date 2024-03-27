import 'package:flutter/material.dart';
import 'package:project_test/utils/app_colors.dart';
import 'package:project_test/utils/app_routes.dart';

class ChildPage extends StatefulWidget {
  const ChildPage({super.key});

  @override
  State<ChildPage> createState() => _ChildPageState();
}

class _ChildPageState extends State<ChildPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
                'assets/images/sleep.jpg',
                width: MediaQuery.sizeOf(context).width*0.4,
            ),
            const SizedBox(height: 20,),
            Text(
              'Create a profile for your baby to start tracking their daily activities',
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: AppColors.grey,
              
              ),
              textAlign: TextAlign.center,
            ),
             const SizedBox(height: 20,),
             SizedBox(
                width: 300,
                height: 50,
                child: ElevatedButton(
                        onPressed: (){
                          Navigator.of(context, rootNavigator: true).pushNamed(AppRoutes.ChildInformation);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primary,
                          foregroundColor: AppColors.white,
                        ),
                        child: Text(
                          "Add child",
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
                     
          ],
        ),
      ),
    );
  }
}