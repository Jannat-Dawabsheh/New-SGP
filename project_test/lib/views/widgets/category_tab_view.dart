import 'package:flutter/material.dart';
import 'package:project_test/model/categories_model.dart';
import 'package:project_test/utils/app_colors.dart';
import 'package:project_test/utils/app_routes.dart';


class CategoryTabView extends StatefulWidget {
  const CategoryTabView({super.key});

  @override
  State<CategoryTabView> createState() => _CategoryTabViewState();
}

class _CategoryTabViewState extends State<CategoryTabView> {
  List<CategoryItem>categoryList=categories;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
        child: Column(
            children: [
              GridView.builder(
                   gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisSpacing: 10,
                      //crossAxisSpacing: 2,
                      ),
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: categoryList.length,
                      itemBuilder: (context,index)=>

                         LayoutBuilder(
                           builder: (context, Constraints) {
                             return InkWell(
                              onTap: (){
                                Navigator.of(context, rootNavigator: true).pushNamed(categories[index].route);
                                
                              },
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 80,
                                    height: 80,
                                     decoration: BoxDecoration(
                                      color: categories[index].color,
                                      borderRadius: BorderRadius.circular(64.0),
                                     ),
                                     child: Padding(
                                       padding: const EdgeInsets.symmetric(vertical:16.0),
                                       child: Image.asset(
                                              categories[index].icon,
                                              ),        
                                     ),
                                  ),
                                  const SizedBox(height: 5,),
                                  Text(
                                    categories[index].name,
                                    style: Theme.of(context)
                                          .textTheme
                                          .titleSmall!
                                          .copyWith(
                                            fontWeight: FontWeight.w700
                                          ),
                                    ),
                                ],
                              ),
                        );
                           }
                         ),
                      
                ),
            ],
          ),
      );
      
  }
}
