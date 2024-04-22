import 'package:blood_donation_app/ui/color_schemes.g.dart';
import 'package:blood_donation_app/ui/controller/questions_controller.dart';
import 'package:blood_donation_app/ui/donor/slider_controller.dart';
import 'package:blood_donation_app/ui/utils/dynamic_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/radio_button_controller.dart';

class HealthScreening extends StatelessWidget {
  HealthScreening({super.key});

  RadioButtonController radioButtonController =
      Get.put(RadioButtonController());
  SliderController sliderController = Get.put(SliderController());
  QuestionController questionController = Get.put(QuestionController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(
        onWillPop: ()async{
          //save the current question index when user clicks back button
          await questionController.savedQuestionIndex();
          return true;
        },
        child: Stack(
          children: [
            Container(
              color: lightColorScheme.primary,
              child: Column(
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        icon: const Icon(
                          Icons.arrow_back_ios_new_rounded,
                          color: Colors.white,
                        ),
                      ),
                      const Spacer(),
                      const Text(
                        'Health Screening',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Inter',
                          color: Colors.white,
                        ),
                      ),
                      const Spacer(),
                      const Spacer(),
                    ],
                  ),
                ],
              ),
            ),
            Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 90),
                  child: Container(
                    height: double.infinity,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(24),
                        topRight: Radius.circular(24),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 15,
                      ),
                      child: Column(
                        children: [
                          Obx(
                            () => LinearProgressIndicator(
                              value: questionController.progress,
                              valueColor: AlwaysStoppedAnimation(
                                  lightColorScheme.primary),
                              backgroundColor: lightColorScheme.secondary,
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(5),
                              minHeight: 4,
                              // max: 100,
                              // min: 0,
                              // onChanged: (value) {
                              //   sliderController.updateSlider(value);
                              // },
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Obx(
                            () => Text(
                              questionController.getCurrentQuestion(),
                              style: const TextStyle(
                                fontFamily: 'Inter',
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          Obx(
                            () => Container(
                              height: 56,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(
                                    color: radioButtonController.borderColor(1),
                                    width: 1.5),
                                // color: radioButtonController
                                //     .backgroundColorOfContainer(1),
                              ),
                              child: RadioListTile(
                                value: 1,
                                title: Text(
                                  'Yes',
                                  style: TextStyle(
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: radioButtonController.textColor(1),
                                  ),
                                ),
                                groupValue:
                                    radioButtonController.selectedVale.value,
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
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(
                                    color: radioButtonController.borderColor(2),
                                    width: 1.5),
                                // color: radioButtonController
                                //     .backgroundColorOfContainer(1),
                              ),
                              child: RadioListTile(
                                value: 2,
                                title: Text(
                                  'No',
                                  style: TextStyle(
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: radioButtonController.textColor(2),
                                  ),
                                ),
                                groupValue:
                                    radioButtonController.selectedVale.value,
                                onChanged: (value) =>
                                    radioButtonController.onSelectValue(value!),
                              ),
                            ),
                          ),
                          const Spacer(),
                          DynamicButton(
                            onPressed: () {
                              radioButtonController.resetSelectedButton();
                              questionController.goToNextQuestion();
                            },
                            buttonText: 'Next',
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
