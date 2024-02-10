import 'package:blood_donation_app/dynamic_widgets/dynamic_button.dart';
import 'package:blood_donation_app/screens/home/donor_list_screen.dart';
import 'package:blood_donation_app/screens/explore/maps.dart';
import 'package:blood_donation_app/controller/slider_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../api/model/blood_group_model.dart';
import '../../controller/map_controller.dart';

class FindDonorScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();
    final SliderController sliderController = Get.put(SliderController());
    MapController mapController = Get.put(MapController());


    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 15, right: 15, top: 30),
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    alignment: Alignment.topLeft,
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.black,
                    ),
                  ),
                  const Text(
                    'Find Donor Screen',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  )
                ],
              ),
              Container(
                height: 255,
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
                child: Stack(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Text(
                        'Blood Type',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 14,
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 10, right: 10, top: 5, bottom: 10),
                      child: GetBuilder<DonorController>(
                        init: DonorController(),
                        builder: (controller) => GridView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: 8,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4,
                            mainAxisSpacing: 8,
                            crossAxisSpacing: 8,
                            mainAxisExtent: 95,
                          ),
                          itemBuilder: (context, index) {
                            BloodGroupModel bloodGroups = bloodGroupList[index];
                            return Obx(
                              () => GestureDetector(
                                onTap: () {
                                  controller.toggleSelection(index);
                                },
                                child: Container(
                                  height: 50,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: controller.isSelected(index)
                                        ? Colors.redAccent[100]
                                        : Colors.grey[300],
                                  ),
                                  child: Center(
                                    child: SvgPicture.asset(
                                      bloodGroups.image,
                                      height: 50,
                                      width: 50,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
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
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Location',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Inter',
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Container(
                        height: 40,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.grey[400],
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: TextField(
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            prefixIcon: Icon(
                              Icons.search,
                              color: Colors.white,
                            ),
                            hintStyle: TextStyle(
                                fontFamily: 'Inter', color: Colors.white),
                            hintText: 'Search Location',
                          ),
                          controller: searchController,
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Container(
                        height: 200,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: MapScreen(mapController),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        'Full Address \nWith Zip Code and State',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 12,
                          color: Colors.black,
                        ),
                      ),
                      const Divider(),
                      const Text(
                        'Distance',
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w700),
                      ),
                      Obx(
                        () => Slider(
                          value: sliderController.sliderValue.value,
                          divisions: 10,
                          label:
                              sliderController.sliderValue.round().toString(),
                          onChanged: (value) {
                            sliderController.updateSlider(value);
                          },
                          activeColor: Colors.red,
                          min: 10,
                          max: 100,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              DynamicButton(
                onPressed: () {
                  Get.to(const DonorListScreen());
                },
                buttonText: 'Continue',
              ),
              const SizedBox(
                height: 8,
              )
            ],
          ),
        ),
      ),
    );
  }

  List<BloodGroupModel> bloodGroupList = [
    BloodGroupModel(image: 'Assets/Images/o nagative.svg'),
    BloodGroupModel(image: 'Assets/Images/o positive.svg'),
    BloodGroupModel(image: 'Assets/Images/a negative.svg'),
    BloodGroupModel(image: 'Assets/Images/A positive.svg'),
    BloodGroupModel(image: 'Assets/Images/b nagative.svg'),
    BloodGroupModel(image: 'Assets/Images/b positive.svg'),
    BloodGroupModel(image: 'Assets/Images/ab nagative.svg'),
    BloodGroupModel(image: 'Assets/Images/ab positive.svg'),
  ];
}

class DonorController extends GetxController {
  RxList<bool> isSelectedList = List.generate(8, (index) => false).obs;

  bool isSelected(int index) {
    return isSelectedList[index];
  }

  void toggleSelection(int index) {
    for (int i = 0; i < isSelectedList.length; i++) {
      isSelectedList[i] = (i == index);
    }
  }
}
