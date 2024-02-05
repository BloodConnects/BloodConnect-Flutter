import 'package:blood_donation_app/custom_cards/card.dart';
import 'package:blood_donation_app/custom_cards/custom_search_bar.dart';
import 'package:blood_donation_app/screens/home/find_donor_screen.dart';
import 'package:blood_donation_app/screens/home/health_screening.dart';
import 'package:blood_donation_app/screens/profile/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../../controller/mycontroller.dart';
import '../../custom_cards/custom_dialog_box.dart';
import '../../share_preference/share_preference_service.dart';

class Home extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final MyController mycontroller = Get.put(MyController());

    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          child: FutureBuilder<String>(
              future: getUserFullName(),
              builder: (context, snapshot){
                if(snapshot.connectionState == ConnectionState.waiting){
                  return const CircularProgressIndicator();
                }else{
                  return Text(
                    'Hello \n${snapshot.data}',
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontFamily: 'Inter',
                    ),
                  );
                }
              }
          ),
        ),
        // backgroundColor: Colors.red[400],
        // elevation: 3,
        leadingWidth: 180,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: CircleAvatar(
              backgroundColor: const Color.fromARGB(255, 221, 220, 220),
              child: IconButton(
                onPressed: () {
                  Get.to(ProfileScreen());
                },
                icon: const Icon(
                  Icons.person,
                  // color: Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Container(
        color: Colors.white,
        height: double.infinity,
        width: double.infinity,
        child: ListView(
          children: [
            SizedBox(
              height: 200,
              child: Expanded(
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: CarouselSlider(
                        items: [
                          Container(
                            width: double.infinity,
                            decoration: const BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(12),
                                ),
                                color: Color.fromARGB(255, 222, 222, 222)),
                            child: const Text('page 2'),
                          ),
                          Container(
                            width: double.infinity,
                            decoration: const BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(12),
                                ),
                                color: Color.fromARGB(255, 222, 222, 222)),
                            child: const Text('page 2'),
                          ),
                          Container(
                            width: double.infinity,
                            decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12)),
                                color: Color.fromARGB(255, 222, 222, 222)),
                            child: const Text('page 3'),
                          ),
                        ],
                        options: CarouselOptions(
                          height: 200,
                          aspectRatio: 16 / 9,
                          viewportFraction: 0.8,
                          initialPage: 0,
                          enableInfiniteScroll: true,
                          reverse: false,
                          autoPlay: true,
                          autoPlayInterval: const Duration(seconds: 3),
                          autoPlayAnimationDuration:
                              const Duration(milliseconds: 800),
                          autoPlayCurve: Curves.fastOutSlowIn,
                          enlargeCenterPage: true,
                          scrollDirection: Axis.horizontal,
                          onPageChanged: (index, reason) {
                            mycontroller.currentPage = index;
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 6),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.612,
                width: double.infinity,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)),
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color.fromRGBO(248, 98, 98, 1),
                      Color.fromRGBO(247, 30, 30, 1),
                    ],
                  ),
                ),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Your Donation Details',
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: CustomContainer(
                                title: 'Find \nDonor',
                                icon: Icons.medical_services,
                                ontap: () {
                                  Get.to(FindDonorScreen());
                                },
                              ),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            Expanded(
                              child: CustomContainer(
                                title: 'Health \nScreening',
                                icon: Icons.health_and_safety_sharp,
                                ontap: () {
                                  Get.to(HealthScreening());
                                },
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: CustomContainer(
                                title: 'Emergency \nCases',
                                icon: Icons.heart_broken,
                                ontap: () {},
                              ),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            Expanded(
                              child: CustomContainer(
                                title: 'Donation \nTips',
                                icon: Icons.tips_and_updates,
                                ontap: () {},
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 18,
                        ),
                        const Text(
                          'Your Requests',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Inter',
                              color: Colors.white),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: CustomContainer(
                                title: 'Blood \nRequests',
                                icon: Icons.healing_outlined,
                                ontap: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      return const CustomDialogBox();
                                    },
                                  );
                                },
                              ),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            Expanded(
                              child: CustomContainer(
                                title: 'Appointment\nSchedule',
                                icon: Icons.schedule,
                                ontap: () {},
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 18,
                        ),
                        const Text(
                          'Need Assistance?',
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Container(
                          height: 100,
                          width: double.infinity,
                          decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12)),
                              boxShadow: [
                                BoxShadow(
                                    offset: Offset(0.5, 0.5),
                                    blurRadius: 1,
                                    color: Colors.black)
                              ],
                              color: Colors.white),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                            child: Row(
                              children: [
                                const Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 12),
                                  child: Text(
                                    'We will support you \n24 / 7',
                                    maxLines: 2,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontFamily: 'Inter',
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                                const Spacer(),
                                ClipRRect(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(8)),
                                  child: Expanded(
                                    child: Image.asset(
                                      'Assets/Images/support.png',
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<String> getUserFullName()async {
    var user =  await SharePreferenceService().getUserModel();
    return user.fullName ?? '';
  }
}
