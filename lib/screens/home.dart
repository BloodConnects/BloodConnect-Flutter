import 'package:blood_donation_app/screens/card.dart';
import 'package:blood_donation_app/screens/custom_search_bar.dart';
import 'package:blood_donation_app/screens/mycontroller.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Home extends StatelessWidget {
  const Home({Key? key});

  @override
  Widget build(BuildContext context) {
    MyController mycontroller = Get.put(MyController());

    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
          child: Text(
            'Hello \nThere!',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontFamily: 'Inter',
            ),
          ),
        ),
        backgroundColor: Colors.red[400],
        elevation: 3,
        leadingWidth: 150,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
            child: CircleAvatar(
              backgroundColor: const Color.fromARGB(255, 221, 220, 220),
              child: IconButton(
                onPressed: () {
                  showSearch(context: context, delegate: CustomSearchBar());
                },
                icon: const Icon(
                  Icons.search,
                  color: Colors.black,
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
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 200,
                child: Expanded(
                  child: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: CarouselSlider(
                          items: [
                            Container(
                              width: double.infinity,
                              decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(12),
                                  ),
                                  color: Color.fromARGB(255, 222, 222, 222)),
                              child: const Text('page 1',),
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
                            autoPlayInterval: Duration(seconds: 3),
                            autoPlayAnimationDuration:
                                Duration(milliseconds: 800),
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
                padding: const EdgeInsets.only(top: 10),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.7,
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
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Text(
                              'Your Donation Details',
                              style: TextStyle(
                                  fontSize: 17,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomContainer(
                                title: 'Add \nDonation',
                                icon: Icons.medical_services,
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              CustomContainer(
                                title: 'Health \nScreening',
                                icon: Icons.health_and_safety_sharp,
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomContainer(
                                  title: 'Emergency \n Cases',
                                  icon: Icons.heart_broken),
                              SizedBox(
                                width: 8,
                              ),
                              CustomContainer(
                                  title: 'Donation \n Tips',
                                  icon: Icons.tips_and_updates)
                            ],
                          ),
                          const SizedBox(
                            height: 18,
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Text(
                              'Your Requests',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'Inter',
                                  color: Colors.white),
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomContainer(
                                  title: 'Blood \nRequests',
                                  icon: Icons.healing_outlined),
                              SizedBox(
                                width: 8,
                              ),
                              CustomContainer(
                                title: 'Appointment\nSchedule',
                                icon: Icons.schedule,
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
                                        EdgeInsets.symmetric(horizontal: 15),
                                    child: Text(
                                      'We will support you\n24 * 7',
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
      ),
    );
  }
}
