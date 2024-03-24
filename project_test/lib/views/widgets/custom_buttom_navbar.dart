import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:project_test/views/pages/appointment_page.dart';
import 'package:project_test/views/pages/article_page.dart';
import 'package:project_test/views/pages/chat_page.dart';
import 'package:project_test/views/pages/child_page.dart';
import 'package:project_test/views/pages/home_page.dart';
import 'package:project_test/views/pages/profile_page.dart';
import '../../utils/app_routes.dart';

class CustomBottomNavbar extends StatefulWidget {
  const CustomBottomNavbar({super.key});

  @override
  State<CustomBottomNavbar> createState() => _CustomBottomNavbarState();
}

class _CustomBottomNavbarState extends State<CustomBottomNavbar> {
  late final PersistentTabController _controller;
  int _currentIndex = 0;
  @override
  void initState() {
    _controller = PersistentTabController();
    _controller.addListener(() {
      setState(() {
        _currentIndex = _controller.index;
      });
    });
    

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  List<Widget> _buildScreens() {
    return [
      
       const HomePage(),
       const AppointmentPage(),
       const ArticlePage(),
       const ChildPage(),
       const ChatPage(),
       const ProfilePage(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(Icons.home),
        title: "home",
        activeColorPrimary: Theme.of(context).primaryColor,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.calendar_month_outlined),
        title: "Appointment",
        activeColorPrimary: Theme.of(context).primaryColor,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.article),
        title: "Articles",
        activeColorPrimary: Theme.of(context).primaryColor,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(PhosphorIcons.baby_bold),//Icon(Icons.child_care),
        title: "Add Child",
        activeColorPrimary: Theme.of(context).primaryColor,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.chat_rounded),
        title: "chatting",
        activeColorPrimary: Theme.of(context).primaryColor,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.person),
        title: "Profile",
        activeColorPrimary: Theme.of(context).primaryColor,
        inactiveColorPrimary: Colors.grey,
      ),
      
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsetsDirectional.only(start: 16),
          child: CircleAvatar(
            radius: 20,
            backgroundImage: CachedNetworkImageProvider(
                   "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSaizazwQtqYtxIz6-5scSWz97PERGqBBDpZA&usqp=CAU"),
           ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome Back,',
              style: Theme.of(context)
                  .textTheme
                  .labelLarge!
                  .copyWith(color: Colors.grey),
                  
            ),
            Text(
              'Jannat', // from database ....
              style: Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .copyWith(fontWeight: FontWeight.w700),
            ),
          ],
        ),
        actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(Icons.notifications_none_sharp)),
            IconButton(
                onPressed: () {},
                icon: const Icon(Icons.search)),
          ],
      ),
     
      body: PersistentTabView(
        context,
        controller: _controller,
        screens: _buildScreens(),
        items: _navBarsItems(),
        confineInSafeArea:
            true, // Default is true. // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
        decoration: NavBarDecoration(
          borderRadius: BorderRadius.circular(10.0),
          colorBehindNavBar: Colors.white,
        ),
        popAllScreensOnTapOfSelectedTab: true,
        popActionScreens: PopActionScreensType.all,
        itemAnimationProperties: const ItemAnimationProperties(
          // Navigation Bar's items animation properties.
          duration: Duration(milliseconds: 200),
          curve: Curves.ease,
        ),
        screenTransitionAnimation: const ScreenTransitionAnimation(
          // Screen transition animation on change of selected tab.
          animateTabTransition: true,
          curve: Curves.ease,
          duration: Duration(milliseconds: 200),
        ),
        navBarStyle:
            NavBarStyle.style1, // Choose the nav bar style with this property.
      ),
    );
  }
}
