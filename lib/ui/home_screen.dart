import 'package:blood_donation_app/ui/home_controller.dart';
import 'package:blood_donation_app/ui/profile/profile_screen.dart';
import 'package:blood_donation_app/ui/updates/notification_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'explore/explore_screen.dart';
import 'home/home.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var markers = <Marker>[].obs;

  HomeController controller = Get.put(HomeController());

  int selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    controller.currentTab.update((val) {
      selectedTab = val ?? 0;
    });

    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: controller.pageController,
        onPageChanged: controller.onTabChanged,
        children: [
          const Home(),
          ExploreScreen(),
          NotificationScreen(),
          ProfileScreen()
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: true,
        showUnselectedLabels: true,
        currentIndex: controller.currentTab.value,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        onTap: (tab){
          controller.onTabChanged(tab);
          setState(() {

          });
        },
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.explore,
            ),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.notifications,
            ),
            label: 'Updates',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
            ),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
