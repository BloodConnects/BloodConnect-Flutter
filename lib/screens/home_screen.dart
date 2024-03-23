import 'package:blood_donation_app/api/model/LocationModel.dart';
import 'package:blood_donation_app/controller/controller.dart';
import 'package:blood_donation_app/controller/location_controller.dart';
import 'package:blood_donation_app/controller/map_controller.dart';
import 'package:blood_donation_app/screens/profile/profile_screen.dart';
import 'package:blood_donation_app/screens/explore/explore_screen.dart';
import 'package:blood_donation_app/screens/home/home.dart';
import 'package:blood_donation_app/screens/updates/notification_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  var markers = <Marker>[].obs;
  MapController mapController = Get.put(MapController());
  Controller controller = Get.put(Controller());

  // LocationController locationController = Get.put(LocationController());

  @override
  Widget build(BuildContext context) {
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
