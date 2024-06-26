import 'package:blood_donation_app/data/api/model/userModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../profile/user_profile_screen.dart';

class DonorListContainer extends StatelessWidget {
  final UserModel donor;

  const DonorListContainer({
    Key? key,
    required this.donor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              color: Colors.transparent,
              // height: 200,
              width: 35,
            ),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  Get.to(UserProfileScreen(donor: donor));
                },
                child: Container(
                  height: 170,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.grey[200],
                  ),
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Positioned(
                        top: 30,
                        left: -35,
                        child: CircleAvatar(
                          radius: 40,
                          backgroundImage: NetworkImage(donor.profilePictureUrl.toString()),
                        ),
                      ),
                      Positioned(
                        left: 52,
                        top: 8,
                        right: 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              donor.fullName.toString(),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Inter',
                                fontSize: 18,
                              ),
                            ),
                            Text(
                              donor.location?.city?.toString()??"",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontSize: 14,
                                fontFamily: 'Inter',
                              ),
                            ),
                            Text(
                              "distanceInfo",
                              maxLines: 1,
                              style: const TextStyle(
                                fontFamily: 'Inter',
                                fontSize: 14,
                              ),
                            ),
                            Text(
                              "healthInfo",
                              maxLines: 1,
                              style: const TextStyle(
                                fontSize: 14,
                                fontFamily: 'Inter',
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
                              bottomRight: Radius.circular(12),
                            ),
                            color: Colors.grey[300],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(
                              left: 52,
                              top: 4,
                              bottom: 4,
                              right: 10,
                            ),
                            child: Text(
                              "lastDonationDate",
                              style: const TextStyle(
                                fontFamily: 'Inter',
                                fontSize: 14,
                              ),
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
