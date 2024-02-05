import 'package:blood_donation_app/api/api_fuctions/delete_user.dart';
import 'package:blood_donation_app/api/api_fuctions/update_user.dart';
import 'package:blood_donation_app/api/model/userModel.dart';
import 'package:blood_donation_app/dynamic_widgets/dynamic_button.dart';
import 'package:blood_donation_app/dynamic_widgets/dynamic_text_field.dart';
import 'package:blood_donation_app/enum_classes/blood_group.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../api/api_controller/editing_controller.dart';
import '../../controller/avatar_controller.dart';
import '../../dynamic_widgets/avatar_selector.dart';
import '../../enum_classes/gender.dart';

class EditProfileScreen extends StatelessWidget {
  List<Map<String, dynamic>> genderList = [
    {'name': 'Male', 'image': 'Assets/Images/male.png', 'value': Gender.Male},
    {
      'name': 'Female',
      'image': 'Assets/Images/female.png',
      'value': Gender.Female
    },
    {
      'name': 'Other',
      'image': 'Assets/Images/other.png',
      'value': Gender.Other
    },
  ];
  var editingController = Get.put(EditingController());

  TextEditingController nameController = TextEditingController();
  TextEditingController mobileNumberController = TextEditingController();
  TextEditingController datOfBirthController = TextEditingController();
  TextEditingController emailAddressController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();

  List<Map<String, dynamic>> avatarList2 = [
    {
      'image':
          'https://images.unsplash.com/photo-1648295194728-cb01f46ff985?q=80&w=449&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      'value': 1,
    },
    {
      'image':
          'https://images.unsplash.com/photo-1648295194728-cb01f46ff985?q=80&w=449&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      'value': 2,
    },
    {
      'image':
          'https://images.unsplash.com/photo-1648295194728-cb01f46ff985?q=80&w=449&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      'value': 3,
    },
    {
      'image':
          'https://images.unsplash.com/photo-1648295194728-cb01f46ff985?q=80&w=449&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      'value': 4,
    },
    {
      'image':
          'https://images.unsplash.com/photo-1648295194728-cb01f46ff985?q=80&w=449&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      'value': 5,
    },
    {
      'image':
          'https://images.unsplash.com/photo-1648295194728-cb01f46ff985?q=80&w=449&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      'value': 6,
    },
    {
      'image':
          'https://images.unsplash.com/photo-1648295194728-cb01f46ff985?q=80&w=449&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      'value': 7,
    },
    {
      'image':
          'https://images.unsplash.com/photo-1648295194728-cb01f46ff985?q=80&w=449&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      'value': 8,
    },
    {
      'image':
          'https://images.unsplash.com/photo-1648295194728-cb01f46ff985?q=80&w=449&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      'value': 9,
    },
    {
      'image':
          'https://images.unsplash.com/photo-1648295194728-cb01f46ff985?q=80&w=449&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      'value': 10,
    },
    {
      'image':
          'https://images.unsplash.com/photo-1648295194728-cb01f46ff985?q=80&w=449&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      'value': 11,
    },
    {
      'image':
          'https://images.unsplash.com/photo-1648295194728-cb01f46ff985?q=80&w=449&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      'value': 12,
    },
  ];

  AvatarController avatarController = Get.put(AvatarController());

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
          'Edit Profile',
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
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Column(
            children: [
              Center(
                child: GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 15, bottom: 5, left: 15, right: 15),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 300,
                                  width: double.infinity,
                                  child: Expanded(
                                    child: GridView.builder(
                                      shrinkWrap: true,
                                      itemCount: avatarList2.length,
                                      gridDelegate:
                                          const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 3,
                                        crossAxisSpacing: 10.0,
                                        mainAxisSpacing: 10.0,
                                      ),
                                      itemBuilder: (context, index) {
                                        return GestureDetector(
                                          onTap: () {
                                            avatarController
                                                    .selectedIndex.value =
                                                avatarList2[index]['value'];
                                          },
                                          child: AvatarSelector(
                                            avatarList2[index]['image'],
                                            avatarList2[index]['value'],
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                  child: CircleAvatar(
                    radius: 70,
                    backgroundImage:
                        NetworkImage(editingController.profilePicture.value),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
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
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      DynamicTextField(
                        controller: editingController.nameController,
                        keyboardType: TextInputType.text,
                        labelText: 'Full Name',
                        hintText: 'Enter Full Name',
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      DynamicTextField(
                        controller: editingController.mobileController,
                        keyboardType: TextInputType.phone,
                        labelText: 'Mobile Number',
                        hintText: 'Enter Mobile Number',
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      DynamicTextField(
                        controller: editingController.emailAddressController,
                        keyboardType: TextInputType.emailAddress,
                        labelText: 'Email Address',
                        hintText: 'Enter Email Address',
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Obx(() {
                        return DropdownButtonFormField<BloodGroup>(
                          value: editingController.selectedBlood.value,
                          items: const [
                            BloodGroup.oPositive,
                            BloodGroup.oNegative,
                            BloodGroup.abPositive,
                            BloodGroup.abNegative,
                            BloodGroup.aPositive,
                            BloodGroup.aNegative,
                            BloodGroup.bNegative,
                            BloodGroup.bPositive,
                            BloodGroup.unknown,
                          ].map((BloodGroup value) {
                            return DropdownMenuItem(
                              value: value,
                              child: Text(value.toDisplayText()),
                            );
                          }).toList(),
                          onChanged: (newValue) {
                            editingController.onSelected(newValue!);
                          },
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                            ),
                            hintText: 'Select Blood Group',
                            prefixIcon: Icon(Icons.bloodtype_rounded),
                          ),
                        );
                      }),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        'Gender',
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Inter',
                            fontSize: 16),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: SizedBox(
                          width: double.infinity,
                          child: Wrap(
                            spacing: 8,
                            children: genderList
                                .map(
                                  (gender) => GestureDetector(
                                    onTap: () {
                                      editingController
                                          .onSelectedGender(gender['value']);
                                    },
                                    child: genderWidget(
                                      gender['image']!,
                                      gender['value']!,
                                    ),
                                  ),
                                )
                                .toList(),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      DynamicTextField(
                        controller: editingController.birthDateController,
                        keyboardType: TextInputType.text,
                        labelText: 'Date Of Birth',
                        hintText: 'Enter Date Of Birth',
                        ontap: () async {
                          var currentDate = DateFormat('yyyy-MM-dd').parse(editingController.birthDateController.text);
                          var newDateTime = await showDatePicker(
                            context: context,
                            initialDate: currentDate,
                            firstDate: DateTime(1950),
                            lastDate: DateTime(2025),
                          );
                          if (newDateTime != null) {
                            print(newDateTime);
                            String formattedDate =
                                DateFormat('yyyy-MM-dd').format(newDateTime);
                            editingController.birthDateController.text =
                                formattedDate;
                            editingController.update();
                          } else {
                            print('date is not selected');
                          }
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      DynamicTextField(
                        controller: editingController.weightController,
                        keyboardType: TextInputType.text,
                        labelText: 'Weight',
                        hintText: 'Enter Weight',
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      DynamicTextField(
                        controller: editingController.heightController,
                        keyboardType: TextInputType.text,
                        labelText: 'Height',
                        hintText: 'Enter Height',
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      DynamicButton(
                        onPressed: () {
                          UpdateUser().updateUserData(
                            UserModel(
                              uid: editingController.userModel.uid,
                              fullName: editingController.nameController.text,
                              mobileNumber:
                                  editingController.mobileController.text,
                              mailAddress:
                                  editingController.emailAddressController.text,
                              bloodGroup: editingController.selectedBlood.value,
                              gender: editingController.selectedGender.value,
                              birthDate: DateTime.parse(editingController
                                      .birthDateController.text)
                                  .millisecondsSinceEpoch,
                              weight: double.parse(editingController
                                  .weightController.text
                                  .toString()),
                              profilePictureUrl:
                                  editingController.profilePicture.value,
                              height: double.parse(editingController
                                  .heightController.text
                                  .toString()),
                              userToken: editingController.userModel.userToken,
                            ),
                          );
                        },
                        buttonText: 'Save',
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextButton(
                onPressed: () {
                  DeleteUser().deletAccount();
                },
                child: const Text(
                  'Delete Account',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget genderWidget(String imageUrl, Gender genderType) {
    return Stack(
      children: [
        Obx(
          () {
            return Column(
              children: [
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(imageUrl),
                      fit: BoxFit.cover,
                      colorFilter: ColorFilter.mode(
                        editingController.selectedGender.value == genderType
                            ? Colors.red.withOpacity(0.3)
                            : Colors.transparent,
                        BlendMode.darken,
                      ),
                    ),
                    shape: BoxShape.circle,
                    border: Border.all(
                      color:
                          editingController.selectedGender.value == genderType
                              ? Colors.red
                              : Colors.white12,
                    ),
                  ),
                  child: Visibility(
                    visible:
                        editingController.selectedGender.value == genderType,
                    child: const Icon(
                      Icons.check,
                      size: 40,
                      color: Colors.red,
                    ),
                  ),
                ),
                Text(
                  genderType.toDisplayText(),
                  style: const TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 14,
                    color: Colors.black,
                  ),
                )
              ],
            );
          },
        ),
      ],
    );
  }
}