import 'package:blood_donation_app/api/api_fuctions/donor_list.dart';
import 'package:blood_donation_app/ui/home/blood_request_type__dialog.dart';
import 'package:blood_donation_app/custom_cards/dynamic_info_widget.dart';
import 'package:blood_donation_app/dynamic_widgets/dynamic_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserProfileScreen extends StatelessWidget {
  UserProfileScreen({super.key});

  DonorListController donorListController = Get.put(DonorListController());

  int index = 0;

  Future<String> getFullName() async{
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
            Center(
              child: Text(
                'Jaypalsinh Barad',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  fontFamily: 'Inter',
                ),
              ),
            ),
            // Center(
            //   child: FutureBuilder<String>(
            //     future: getFullName(),
            //     builder: (context, snapshot){
            //       if(snapshot.connectionState == ConnectionState.waiting){
            //         return const CircularProgressIndicator();
            //       }else{
            //         return Text(
            //           '${snapshot.data}',
            //           style: const TextStyle(
            //             fontSize: 20,
            //             fontFamily: 'Inter',
            //             fontWeight: FontWeight.bold,
            //             color: Colors.black,
            //           ),
            //         );
            //       }
            //     }
            //   ),
            // ),
            const SizedBox(
              height: 20,
            ),
            DynamicButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return const CustomDialogBox();
                  },
                );
              },
              width: 200,
              borderRadius: BorderRadius.circular(22),
              buttonText: 'Blood Request',
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.grey[300],
              ),
              child: Obx(
                () => Column(
                  children: [
                    DynamicInfoWidget(
                      title: 'Mobile Number',
                      subtitle: getMobileNumber(),
                    ),
                    DynamicInfoWidget(
                      title: 'Email Address',
                      // subtitle: getEmailAddress(),
                      subtitle: 'jaypalsinhbarad@gmail.com',
                    ),
                    DynamicInfoWidget(
                      title: 'Age',
                      // subtitle: getBirthData(),
                      subtitle: '20',
                    ),
                    DynamicInfoWidget(
                      title: 'Blood Group',
                      // subtitle: getBloodGroup(),
                      subtitle: 'O negative',
                    ),
                    DynamicInfoWidget(
                      title: 'Address',
                      // subtitle: getAddress(),
                      subtitle: 'Aryavart Bunglows, Kalikund, Dholka, Gujarat - 382225',
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
