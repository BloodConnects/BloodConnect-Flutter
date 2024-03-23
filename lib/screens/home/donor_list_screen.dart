import 'package:blood_donation_app/api/api_fuctions/donor_list.dart';
import 'package:blood_donation_app/custom_cards/custom_donor_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DonorListScreen extends StatelessWidget {
  DonorListScreen({super.key});

  DonorListController donorListController = Get.put(DonorListController());

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
          'Donor List',
          style: TextStyle(
            fontFamily: 'Inter',
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
      body: Obx(() {
        if (donorListController.donor.isEmpty) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: ListView(
              children: const [
                SizedBox(
                  height: 15,
                ),
                CustomDonorContainer(
                  userName: 'Priyanka Fulwari',
                  address:
                      'Krupashankar Joshi Marg, Mithakhali, Navrangpura, Ahmedabad, Gujarat 380009',
                  distanceInfo: '10 Kilometers far',
                  healthInfo: 'Can donate blood upto 1 litre',
                  lastDonationDate: '20 december, 2023',
                  imageUrl:
                      'https://firebasestorage.googleapis.com/v0/b/confab-3868.appspot.com/o/Profile%20Pictures%2FAsset%204.png?alt=media&token=e9a1b8e7-99a1-4125-baca-b60a58f0bd9f',
                ),
                CustomDonorContainer(
                  userName: 'Kaushal Rathod',
                  address: ' New Chamunda Society, Godrej Garden City, Chandkheda, Ahmedabad, Gujarat 382470',
                  distanceInfo: '18 Kilometers far',
                  healthInfo: 'Can donate blood upto 1 litre',
                  lastDonationDate: '5 january, 2024',
                  imageUrl:
                  'https://firebasestorage.googleapis.com/v0/b/confab-3868.appspot.com/o/Profile%20Pictures%2FAsset%205.png?alt=media&token=bed1249f-1b24-4233-a9f7-b58aeb6f8f4a',
                ),
                CustomDonorContainer(
                  userName: 'Jaypalsinh Barad',
                  address:
                  'Aryavart Bunglows, Kalikund, Dholka, Gujarat - 382225',
                  distanceInfo: '30 Kilometers far',
                  healthInfo: 'Can donate blood upto 0.5 litre',
                  lastDonationDate: '18 October, 2023',
                  imageUrl:
                      'https://firebasestorage.googleapis.com/v0/b/confab-3868.appspot.com/o/Profile%20Pictures%2FAsset%2016.png?alt=media&token=4ed4b1cf-c496-4c24-8844-ec84a7c587cd',
                )
                // ListView.builder(
                //   physics: const NeverScrollableScrollPhysics(),
                //   shrinkWrap: true,
                //   itemCount: donorListController.donor.length,
                //   itemBuilder: (context, index) {
                //     var details = donorListController.donor[index];
                //     return CustomDonorContainer(
                //       userName: details.fullName.toString(),
                //       address: details.locationKey.toString(),
                //       distanceInfo: details.mobileNumber.toString(),
                //       healthInfo: details.mailAddress.toString(),
                //       lastDonationDate: details.birthDate.toString(),
                //       imageUrl: details.profilePictureUrl.toString(),
                //     );
                //   },
                // ),
              ],
            ),
          );
        }
      }),
    );
  }
}
