import 'package:blood_donation_app/screens/profile/user_profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomDonorContainer extends StatelessWidget {
  const CustomDonorContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              color: Colors.transparent,
              height: 200,
              width: 35,
            ),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  Get.to(const UserProfileScreen());
                },
                child: Container(
                  height: 210,
                  // width: MediaQuery.of(context).size.width * 0.829,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.grey[200],
                  ),
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      const Positioned(
                        top: 56,
                        left: -35,
                        child: CircleAvatar(
                          radius: 40,
                          backgroundImage: NetworkImage(
                            'https://images.unsplash.com/photo-1662695090012-24ccea960995?q=80&w=1887&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                          ),
                        ),
                      ),
                      const Positioned(
                        left: 52,
                        top: 8,
                        right: 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 280,
                              child: Text(
                                'Fulwariya Priya,,,,,,,,,,nka Omprakash',
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Inter',
                                  fontSize: 18,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 280,
                              child: Text(
                                'Science city Approach, Sola Bridge, Ghatlodia, Ahmedaabad, Gujarat - 380061',
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: 'Inter',
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 280,
                              child: Text(
                                'Distance Information,,,,,,,,,,,,,,,,,,,,,,,,,,,,,, of User',
                                maxLines: 2,
                                style: TextStyle(
                                  fontFamily: 'Inter',
                                  fontSize: 14,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 280,
                              child: Text(
                                'He is a healthy person according to our............... parameters ',
                                maxLines: 2,
                                style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: 'Inter',
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.829,
                          height: 30,
                          decoration: BoxDecoration(
                              borderRadius: const BorderRadius.only(
                                  bottomLeft: Radius.circular(12),
                                  bottomRight: Radius.circular(12)),
                              color: Colors.grey[300]),
                          child: const Padding(
                            padding: EdgeInsets.only(
                                left: 52, top: 4, bottom: 4, right: 10),
                            child: Text(
                              'User last donation date',
                              style:
                                  TextStyle(fontFamily: 'Inter', fontSize: 14),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        )
      ],
    );
  }
}
