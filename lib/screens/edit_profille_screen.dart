import 'package:blood_donation_app/controller/mycontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditProfileScreen extends StatelessWidget {
  List<Map<String, String>> genderList = [
    {'name': 'Male', 'image': 'Assets/Images/male.png'},
    {'name': 'Female', 'image': 'Assets/Images/female.png'},
    {'name': 'Other', 'image': 'Assets/Images/other.png'},
  ];
  RxString selectedGender = ''.obs;

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController mobileNumberController = TextEditingController();
    TextEditingController emailAddressController = TextEditingController();
    TextEditingController weightController = TextEditingController();
    TextEditingController heightController = TextEditingController();
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
              const Center(
                child: CircleAvatar(
                  radius: 70,
                  backgroundImage: NetworkImage(
                    'https://images.unsplash.com/photo-1648295194728-cb01f46ff985?q=80&w=449&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
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
                      TextField(
                        controller: nameController,
                        keyboardType: TextInputType.text,
                        decoration: const InputDecoration(
                          labelText: 'Full Name',
                          hintText: 'Enter Full Name',
                          hintStyle: TextStyle(
                            fontFamily: 'Inter',
                            color: Colors.black,
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextField(
                        controller: mobileNumberController,
                        keyboardType: TextInputType.phone,
                        decoration: const InputDecoration(
                          labelText: 'Mobile Number',
                          hintText: 'Enter Mobile Number',
                          hintStyle: TextStyle(
                            fontFamily: 'Inter',
                            color: Colors.black,
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextField(
                        controller: emailAddressController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                          labelText: 'Email Address',
                          hintText: 'Enter Email Address',
                          hintStyle: TextStyle(
                            fontFamily: 'Inter',
                            color: Colors.black,
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Obx(() {
                        return DropdownButtonFormField<String>(
                          value: myController.selectedBloodGroup.value,
                          items: const [
                            'A positive',
                            'A negative',
                            'B positive',
                            'B negative',
                            'O positive ',
                            'O negative',
                            'AB positive',
                            'AB negative'
                          ].map((String value) {
                            return DropdownMenuItem(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (newValue) {
                            myController.onSelectedBloodGroup(newValue!);
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
                                      selectedGender.value = gender['name']!;
                                    },
                                    child: genderWidget(
                                      gender['image']!,
                                      gender['name']!,
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
                      const TextField(
                        decoration: InputDecoration(
                          labelText: 'Date Of Birth',
                          hintText: 'Enter Date Of Birth',
                          hintStyle: TextStyle(
                            fontFamily: 'Inter',
                            color: Colors.black,
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextField(
                        controller: weightController,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          labelText: 'Weight',
                          hintText: 'Enter Weight',
                          hintStyle: TextStyle(
                            fontFamily: 'Inter',
                            color: Colors.black,
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextField(
                        controller: heightController,
                        keyboardType: TextInputType.none,
                        decoration: const InputDecoration(
                          labelText: 'Height',
                          hintText: 'Enter Height',
                          hintStyle: TextStyle(
                            fontFamily: 'Inter',
                            color: Colors.black,
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: 45,
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ButtonStyle(
                            backgroundColor:
                                const MaterialStatePropertyAll(Colors.red),
                            shape: MaterialStatePropertyAll(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          ),
                          child: const Text(
                            'Save',
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextButton(
                onPressed: () {},
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

  Widget genderWidget(String imageUrl, String genderType) {
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
                        selectedGender.value == genderType
                            ? Colors.red.withOpacity(0.3)
                            : Colors.transparent,
                        BlendMode.darken,
                      ),
                    ),
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: selectedGender.value == genderType
                          ? Colors.red
                          : Colors.white12,
                    ),
                  ),
                  child: Visibility(
                    visible: selectedGender.value == genderType,
                    child: const Icon(
                      Icons.check,
                      size: 40,
                      color: Colors.red,
                    ),
                  ),
                ),
                Text(
                  genderType,
                  style: const TextStyle(
                      fontFamily: 'Inter', fontSize: 14, color: Colors.black),
                )
              ],
            );
          },
        ),
      ],
    );
  }
}
