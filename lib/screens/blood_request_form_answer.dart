import 'package:blood_donation_app/controller/mycontroller.dart';
import 'package:blood_donation_app/custom_cards/dynamic_info_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BloodRequestFormAnswer extends StatelessWidget {
  const BloodRequestFormAnswer({super.key});

  @override
  Widget build(BuildContext context) {
    MyController myController = Get.put(MyController());

    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(5.0),
          child: CircleAvatar(
            radius: 12,
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
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: ListView(
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
                    subtitle: 'Priyanka Fulwari',
                    radius: 0,
                  ),
                  DynamicInfoWidget(
                    title: 'Gender',
                    subtitle: 'Female',
                    radius: 0,
                  ),
                  DynamicInfoWidget(
                    title: 'Blood Group',
                    subtitle: 'O+',
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
                    activeColor: Colors.red,
                    side: const BorderSide(color: Colors.black),
                    value: myController.isCheckBoxClicked.value,
                    onChanged: (value) {
                      myController.toggleCheckBoxClicked();
                    },
                  ),
                ),
                const SizedBox(
                  width: 315,
                  child: Text(
                    'I Agree with the terms & conditions for blood request',
                    maxLines: 2,
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            SizedBox(
              height: 45,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                  backgroundColor: const MaterialStatePropertyAll(Colors.red),
                  shape: MaterialStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                child: const Text(
                  'Continue',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextButton(
                onPressed: () {},
                child: Text(
                  'Edit Detail',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
