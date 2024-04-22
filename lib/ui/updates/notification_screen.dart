import 'package:blood_donation_app/ui/updates/article_card.dart';
import 'package:blood_donation_app/ui/updates/events_card.dart';
import 'package:blood_donation_app/ui/updates/request_card.dart';
import 'package:blood_donation_app/ui/updates/updates_chip.dart';
import 'package:blood_donation_app/ui/utils/dynamic_info_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../color_schemes.g.dart';
import 'updates_controller.dart';

class NotificationScreen extends StatelessWidget {
  NotificationScreen({super.key});

  final UpdatesController controller = Get.put(UpdatesController());

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
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              child: PageView(
                controller: controller.pageController,
                onPageChanged: controller.onTabChanged,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  //requests section
                  SingleChildScrollView(
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
                              return const RequestCard(
                                title:
                                    'Jaypalsinh requested for B+ Blood from Dholka, Ahmedabad.',
                                subtitle: 'Requested 10 min ago',
                                titleFontWeight: FontWeight.bold,
                                subTitleFontWeight: FontWeight.normal,
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),

                  //article section
                  SingleChildScrollView(
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
                              return const ArticleCard(
                                title:
                                    'Meta to label AI-generated content instead of removing it',
                                description:
                                    'The Internet Society supports and promotes the development of the Internet as a global technical ',
                                postindTime: '10 minutes ago',
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),

                  //events section
                  SingleChildScrollView(
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
                              return const EventsCard(
                                month: 'may',
                                day: '21',
                                title:
                                    'Blood Donation Camp for precaustions, and effects after donation blood',
                                time: '12:00 PM - 2:00 PM',
                              );
                            },
                          ),
                        ],
                      ),
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
