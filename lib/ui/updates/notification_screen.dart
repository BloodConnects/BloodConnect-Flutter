import 'package:blood_donation_app/ui/updates/updates_chip.dart';
import 'package:blood_donation_app/ui/utils/dynamic_info_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../color_schemes.g.dart';
import 'updates_controller.dart';

class NotificationScreen extends StatelessWidget {
  NotificationScreen({super.key});

  final UpdatesController controller =
      Get.put(UpdatesController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Updates',
        ),
        titleTextStyle: const TextStyle(
          color: Colors.black,
          fontSize: 18,
          fontFamily: 'Inter',
          fontWeight: FontWeight.bold,
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: CircleAvatar(
              radius: 20,
              backgroundImage: NetworkImage(
                  'https://images.unsplash.com/photo-1648295194728-cb01f46ff985?q=80&w=449&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
            ),
          )
        ],
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                UpdatesChip(
                  isButtonChecked: controller.requestedIsButtonPressed,
                  buttonText: 'Requests',
                  pressedColor: Colors.red,
                  unpressedColor: Colors.white,
                  onTap: () {
                    controller.toggleRequestedButton();
                    controller.navigationTapped(0);
                  },
                ),
                const SizedBox(
                  width: 10,
                ),
                UpdatesChip(
                  isButtonChecked: controller.articlesButtonPressed,
                  buttonText: 'Articles',
                  pressedColor: Colors.red,
                  unpressedColor: Colors.white,
                  onTap: () {
                    controller.toggleArticlesButton();
                    controller.navigationTapped(1);
                  },
                ),
                const SizedBox(
                  width: 10,
                ),
                UpdatesChip(
                  isButtonChecked: controller.eventButtonPressed,
                  buttonText: 'Events',
                  pressedColor: Colors.red,
                  unpressedColor: Colors.white,
                  onTap: () {
                    controller.toggleEventButton();
                    controller.navigationTapped(2);
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              child: PageView(
                controller: controller.pageController,
                onPageChanged: controller.onTabChanged,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  Container(
                    height: double.infinity,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.grey[300],
                    ),
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 5, vertical: 0),
                        child: Column(
                          children: [
                            ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: 10,
                              itemBuilder: (context, index) {
                                return const DynamicInfoWidget(
                                  title:
                                      'Jaypalsinh requested for B+ Blood from Dholka, Ahmedabad.',
                                  fontWeight1: FontWeight.bold,
                                  subtitle: 'Requested 10 min ago',
                                  fontWeight2: FontWeight.normal,
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: double.infinity,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.grey[300],
                    ),
                    child: const Column(
                      children: [
                        Text(
                          'Page 2 Content',
                          style: TextStyle(
                            fontSize: 25,
                            fontFamily: 'Inter',
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: double.infinity,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.grey[300],
                    ),
                    child: const Column(
                      children: [
                        Text(
                          'Page 3 Content',
                          style: TextStyle(
                            fontSize: 25,
                            fontFamily: 'Inter',
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
