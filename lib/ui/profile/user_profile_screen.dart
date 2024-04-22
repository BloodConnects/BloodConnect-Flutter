import 'package:blood_donation_app/ui/color_schemes.g.dart';
import 'package:blood_donation_app/ui/home/blood_request_type_dialog.dart';
import 'package:blood_donation_app/ui/utils/dynamic_info_widget.dart';
import 'package:blood_donation_app/ui/utils/dynamic_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/api/api_fuctions/donor_list.dart';

class UserProfileScreen extends StatelessWidget {
  UserProfileScreen({super.key});

  DonorListController donorListController = Get.put(DonorListController());

  int index = 0;

  Future<String> getFullName() async {
    var detail = donorListController.donor[index];
    return detail.fullName.toString() ?? '';
  }

  String getMobileNumber() {
    var detail = donorListController.donor[index];
    return detail.mobileNumber.toString();
  }

  String getEmailAddress() {
    var detail = donorListController.donor[index];
    return detail.mailAddress.toString();
  }

  String getBirthData() {
    var detail = donorListController.donor[index];
    return detail.birthDate.toString();
  }

  String getBloodGroup() {
    var detail = donorListController.donor[index];
    return detail.bloodGroup.toString();
  }

  String getAddress() {
    var detail = donorListController.donor[index];
    return detail.locationKey.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(5.0),
          child: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new_rounded),
            onPressed: () {
              Get.back();
            },
          ),
        ),
        centerTitle: true,
        title: const Text(
          'User Profile',
          style: TextStyle(
            fontFamily: 'Inter',
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Column(
          children: [
            const Center(
              child: CircleAvatar(
                radius: 70,
                backgroundImage: NetworkImage(
                  'https://firebasestorage.googleapis.com/v0/b/confab-3868.appspot.com/o/Profile%20Pictures%2FAsset%2016.png?alt=media&token=4ed4b1cf-c496-4c24-8844-ec84a7c587cd',
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Center(
              child: Text(
                'Jaypalsinh Barad',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  fontFamily: 'Inter',
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                SizedBox(
                  height: 45,
                  width: 130,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(
                        Colors.white,
                      ),
                      side: MaterialStatePropertyAll(
                        BorderSide(
                          color: Colors.black,
                          width: 1,
                        ),
                      ),
                    ),
                    child: const Text(
                      'Chat',
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Inter',
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                Expanded(
                  child: SizedBox(
                    height: 45,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(
                          lightColorScheme.primary,
                        ),
                        side: const MaterialStatePropertyAll(
                          BorderSide(
                            color: Colors.white,
                          ),
                        ),
                      ),
                      child: const Text(
                        'Blood Request',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Inter',
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.grey[300],
                boxShadow: const [
                  BoxShadow(
                    color: Colors.grey,
                    offset: Offset(1.0, 2.0),
                    blurRadius: 2.5,
                    spreadRadius: 2.0,
                  )
                ],
              ),
              child: const Column(
                children: [
                  DynamicInfoWidget(
                    title: 'Age',
                    subtitle: '20',
                  ),
                  DynamicInfoWidget(
                    title: 'Blood Group',
                    subtitle: 'O negative',
                  ),
                  DynamicInfoWidget(
                    title: 'Gender',
                    subtitle: 'Male',
                  ),
                  DynamicInfoWidget(
                    title: 'Address',
                    subtitle:
                        'Aryavart Bunglows, Kalikund, Dholka, Gujarat - 382225',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
