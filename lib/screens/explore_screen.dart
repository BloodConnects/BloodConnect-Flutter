import 'package:blood_donation_app/screens/mycontroller.dart';
import 'package:blood_donation_app/screens/user_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    MyController myController = Get.put(MyController());
    TextEditingController search = TextEditingController();

    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.cyan,
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 35,),
              child: SizedBox(
                height: 42,
                width: double.infinity,
                child: TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(22)),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: Color.fromARGB(255, 222, 221, 221),
                    prefixIcon: Icon(Icons.search),
                    hintText: 'Search',
                    hintStyle: TextStyle(),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, top: 85),
              child: Container(
                height: 220,
                width: double.infinity,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(12),
                  ),
                  color: Color.fromARGB(255, 222, 221, 221),
                ),
                child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 1),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Ahmedabad',
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Inter',
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            'Gujarat, India',
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Inter',
                              fontSize: 12,
                            ),
                          ),
                          Divider(
                            indent: 0,
                            endIndent: 5,
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: Row(
                    children: [
                      buildUserCard(
                        name: 'Priyanka Fulwari',
                        bloodType: 'A positive',
                        gender: 'Female',
                        location: 'Ahmedabad, Gujarat',
                        imagePath: 'Assets/Images/images.jpeg',
                        onContactPressed: () {},
                      ),
                      const SizedBox(width: 10),
                      buildUserCard(
                        name: 'Priyanka Fulwari',
                        bloodType: 'A positive',
                        gender: 'Female',
                        location: 'Ahmedabad, Gujarat',
                        imagePath: 'Assets/Images/images.jpeg',
                        onContactPressed: () {},
                      ),
                      const SizedBox(width: 10),
                      buildUserCard(
                        name: 'Priyanka Fulwari',
                        bloodType: 'A positive',
                        gender: 'Female',
                        location: 'Ahmedabad, Gujarat',
                        imagePath: 'Assets/Images/images.jpeg',
                        onContactPressed: () {},
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
