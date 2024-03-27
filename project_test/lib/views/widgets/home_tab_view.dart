import 'package:flutter/material.dart';
import 'package:project_test/utils/app_colors.dart';


class HomeTabView extends StatelessWidget {
  const HomeTabView({super.key});

  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(
            child: Column(
              children: [
                            
               Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Upcoming Appointment',
                    style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(fontWeight: FontWeight.bold),
                    ),
                  TextButton(
                    onPressed: (){}, 
                    child: const Text('See All'),
                    ),
                ],
               ),
                const SizedBox(height: 5,),
               Stack(
                alignment: Alignment.bottomRight,
                 children: [
                   ClipRRect(
                      borderRadius: BorderRadius.circular(16.0),
                      child: Image.asset(
                         'assets/images/home.jpg',
                         height: 150,
                         width: double.infinity,
                         fit: BoxFit.fill,
                      ),
                     ),
                     Padding(
                       padding: const EdgeInsets.all(16.0),
                       child: Column(
                         children: [
                          Row(
                            children: [
                              Text(
                                'Typhoid Conjugate Vaccine',
                                style: Theme.of(context)
                                        .textTheme
                                        .titleMedium!
                                        .copyWith(fontWeight: FontWeight.bold, color: Color.fromARGB(255, 79, 6, 91)),
                              )
                            ],
                          ),
                          const SizedBox(height: 30,),
                           Row(
                             children: [
                               Container(
                                height:50,
                                width: 150,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16.0),
                                  color: const Color.fromARGB(255, 79, 6, 91).withOpacity(0.3),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      Image.asset(
                                         'assets/images/calendar.png',
                                         height: 25,
                                         width: 25,
                                      ),
                                      const SizedBox(width: 5,),
                                      Text(
                                        'Mar 30,2024',
                                        style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium!
                                              .copyWith(fontWeight: FontWeight.bold, color: AppColors.white),
                                        )
                                    ],
                                  ),
                                ),
                               ),
                               const SizedBox(width: 10,),
                               Container(
                                height:50,
                                width: 130,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16.0),
                                  color: const Color.fromARGB(255, 79, 6, 91).withOpacity(0.3),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      Image.asset(
                                         'assets/images/alarm-clock.png',
                                         height: 30,
                                         width: 30,
                                      ),
                                      const SizedBox(width: 5,),
                                      Text(
                                        '05:00 PM',
                                        style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium!
                                              .copyWith(fontWeight: FontWeight.bold, color: AppColors.white),
                                        )
                                    ],
                                  ),
                                ),
                              
                               ),
                             ],
                           ),
                         ],
                       ),
                     ),
                     
                 ],
               ),
              
                
              ],
            ),
          );
        


  }
}

