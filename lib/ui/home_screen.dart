import 'package:blood_donation_app/controller/controller.dart';
import 'package:blood_donation_app/controller/map_controller.dart';
import 'package:blood_donation_app/ui/profile/profile_screen.dart';
import 'package:blood_donation_app/ui/updates/notification_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'explore/explore_screen.dart';
import 'home/home.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  var markers = <Marker>[].obs;
  MapController mapController = Get.put(MapController());
  Controller controller = Get.put(Controller());

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
        unselectedItemColor: Colors.grey,
        onTap: controller.navigationTapped,
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
