import 'package:blood_donation_app/controller/controller.dart';
import 'package:blood_donation_app/screens/profile_screen.dart';
import 'package:blood_donation_app/screens/explore_screen.dart';
import 'package:blood_donation_app/screens/home.dart';
import 'package:blood_donation_app/screens/notification_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Controller controller = Get.put(Controller());

    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: controller.pageController,
        onPageChanged: controller.onTabChanged,
        children: [
           Home(),
          const ExploreScreen(),
          NotificationScreen(),
          const ProfileScreen()
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black,
        onTap: controller.navigationTapped,
        // onTap: (index) {
        //   controller.onChangendex(index);
        //   _navigateToScreens(index);
        // },
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              // color: controller.currentTab == 0 ? Colors.black : Colors.grey,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.explore,
              // color: controller.currentTab == 1 ? Colors.black : Colors.grey,
            ),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.notifications,
              // color: controller.currentTab == 2 ? Colors.black : Colors.grey,
            ),
            label: 'Updates',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              // color: controller.currentTab == 3 ? Colors.black : Colors.grey,
            ),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
