import 'package:blood_donation_app/ui/home/banner_controller.dart';
import 'package:blood_donation_app/ui/utils/dynamic_info_widget.dart';
import 'package:blood_donation_app/ui/utils/dynamic_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'confirm_screen.dart';

class BloodRequestFormAnswer extends StatelessWidget {
  const BloodRequestFormAnswer({super.key});

  @override
  Widget build(BuildContext context) {
    BannerController myController = Get.put(BannerController());

    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(5.0),
          child: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new_rounded),
            onPressed: (){
              Get.back();
            },
          ),
        ),
        centerTitle: true,
        title: const Text(
          'Blood Request',
          style: TextStyle(
            fontFamily: 'Inter',
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(12),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      offset: Offset(1.0, 2.0),
                      blurRadius: 2,
                      spreadRadius: 1.0,
                    )
                  ],
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    DynamicInfoWidget(
                      title: 'Full Name',
                      subtitle: 'Priyanka Fulwari',
                      radius: 0,
                    ),
                    // const Divider(endIndent: 10, indent: 10,),
                    DynamicInfoWidget(
                      title: 'Mobile Number',
                      subtitle: '+91 1234567890',
                      radius: 0,
                    ),
                    DynamicInfoWidget(
                      title: 'Email Address',
                      subtitle: 'xyz@gmail.com',
                      radius: 0,
                    ),
                    DynamicInfoWidget(
                      title: 'Location',
                      subtitle: 'Ahmedabad',
                      radius: 0,
                    ),
                    DynamicInfoWidget(
                      title: 'Gender',
                      subtitle: 'Female',
                      radius: 0,
                    ),
                    DynamicInfoWidget(
                      title: 'Blood Group',
                      subtitle: 'O Positive',
                      radius: 0,
                    ),
                    DynamicInfoWidget(
                      title: 'Blood Units',
                      subtitle: '500 ml',
                      radius: 0,
                    ),
                    DynamicInfoWidget(
                      title: 'Urgency',
                      subtitle: 'High',
                      radius: 0,
                    ),
                    DynamicInfoWidget(
                      title: 'Reason',
                      subtitle: 'Accident',
                      radius: 0,
                    ),
                    DynamicInfoWidget(
                      title: 'Notes',
                      subtitle: 'Some notes',
                      radius: 0,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Obx(
                    () => Checkbox(
                      activeColor: Colors.red[900],
                      side: const BorderSide(color: Colors.black),
                      value: myController.isCheckBoxClicked.value,
                      onChanged: (value) {
                        myController.toggleCheckBoxClicked();
                      },
                    ),
                  ),
                  const Expanded(
                    child: Text(
                      'I Agree with the terms & conditions for blood request',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              DynamicButton(
                onPressed: () {
                  Get.to(const ConfirmScreen());
                },
                buttonText: 'Continue',
              ),
              const SizedBox(
                height: 10,
              ),
              TextButton(
                onPressed: () {
                  Get.back();
                },
                child: const Text(
                  'Edit Detail',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
