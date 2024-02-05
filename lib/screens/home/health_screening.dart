import 'package:blood_donation_app/controller/radio_button_controller.dart';
import 'package:blood_donation_app/dynamic_widgets/dynamic_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HealthScreening extends StatelessWidget {
  HealthScreening({super.key});

  RadioButtonController radioButtonController =
      Get.put(RadioButtonController());

  @override
  Widget build(BuildContext context) {
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
          'Health Screening',
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
            const Text(
              'What spell is used to summon objects to the caster?',
              style: TextStyle(
                fontSize: 22,
                fontFamily: 'Inter',
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Obx(
              () => Container(
                height: 56,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: Colors.black38),
                  color: radioButtonController.backgroundColorOfContainer(1),
                ),
                child: RadioListTile(
                  value: 1,
                  title: Text(
                    'Some Text Value',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: radioButtonController.textColor(1),
                    ),
                  ),
                  groupValue: radioButtonController.selectedVale.value,
                  onChanged: (value) =>
                      radioButtonController.onSelectValue(value!),
                ),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Obx(
              () => Container(
                height: 56,
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black38),
                  borderRadius: BorderRadius.circular(5),
                  color: radioButtonController.backgroundColorOfContainer(2),
                ),
                child: RadioListTile(
                  value: 2,
                  title: Text(
                    'Some Text Value',
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.bold,
                      color: radioButtonController.textColor(2),
                    ),
                  ),
                  groupValue: radioButtonController.selectedVale.value,
                  onChanged: (value) =>
                      radioButtonController.onSelectValue(value!),
                ),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Obx(
              () => Container(
                height: 56,
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black38),
                  borderRadius: BorderRadius.circular(5),
                  color: radioButtonController.backgroundColorOfContainer(3),
                ),
                child: RadioListTile(
                  value: 3,
                  title: Text(
                    'Some Text Value',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: radioButtonController.textColor(3),
                    ),
                  ),
                  groupValue: radioButtonController.selectedVale.value,
                  onChanged: (value) =>
                      radioButtonController.onSelectValue(value!),
                ),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Obx(
              () => Container(
                height: 56,
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black38),
                  borderRadius: BorderRadius.circular(5),
                  color: radioButtonController.backgroundColorOfContainer(4),
                ),
                child: RadioListTile(
                  value: 4,
                  title: Text(
                    'Some Text Value',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: radioButtonController.textColor(4),
                    ),
                  ),
                  groupValue: radioButtonController.selectedVale.value,
                  onChanged: (value) =>
                      radioButtonController.onSelectValue(value!),
                ),
              ),
            ),
            const Spacer(),
            DynamicButton(
              onPressed: () {},
              buttonText: 'Next',
            ),
          ],
        ),
      ),
    );
  }
}
