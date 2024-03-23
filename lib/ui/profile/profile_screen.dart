import 'package:blood_donation_app/ui/auth/opening_screen.dart';
import 'package:blood_donation_app/controller/avatar_controller.dart';
import 'package:blood_donation_app/dynamic_widgets/custom_profile_clickable_widget.dart';
import 'package:blood_donation_app/share_preference/share_preference_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'edit_profille_screen.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  AvatarController avatarController = Get.put(AvatarController());

  // List<Map<String, dynamic>> avatarList2 = [
  //   {
  //     'image': 'Assets/Images/avatars_1.jpg',
  //     'value': 0,
  //   },
  //   {
  //     'image': 'Assets/Images/avatars_2.jpg',
  //     'value': 1,
  //   },
  //   {
  //     'image': 'Assets/Images/avatars_3.jpg',
  //     'value': 2,
  //   },
  //   {
  //     'image': 'Assets/Images/avatars_4.jpg',
  //     'value': 3,
  //   },
  //   {
  //     'image': 'Assets/Images/avatars_5.jpg',
  //     'value': 4,
  //   },
  //   {
  //     'image': 'Assets/Images/avatars_6.jpg',
  //     'value': 5,
  //   },
  //   {
  //     'image': 'Assets/Images/avatars_7.jpg',
  //     'value': 6,
  //   },
  //   {
  //     'image': 'Assets/Images/avatars_8.jpg',
  //     'value': 7,
  //   },
  //   {
  //     'image': 'Assets/Images/avatars_9.jpg',
  //     'value': 8,
  //   },
  //   {
  //     'image': 'Assets/Images/avatars_10.jpg',
  //     'value': 9,
  //   },
  //   {
  //     'image': 'Assets/Images/avatars_11.jpg',
  //     'value': 10,
  //   },
  //   {
  //     'image': 'Assets/Images/avatars_12.jpg',
  //     'value': 11,
  //   },
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        titleTextStyle: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            fontFamily: 'Inter',
            color: Colors.black),
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Center(
              //   child: GestureDetector(
              //     onTap: () {
              //       showModalBottomSheet(
              //         context: context,
              //         builder: (context) {
              //           return SingleChildScrollView(
              //             child: Padding(
              //               padding: const EdgeInsets.only(
              //                   top: 15, bottom: 5, left: 15, right: 15),
              //               child: Column(
              //                 children: [
              //                   SizedBox(
              //                     height: 300,
              //                     width: double.infinity,
              //                     child: Expanded(
              //                       child: GridView.builder(
              //                         shrinkWrap: true,
              //                         itemCount: avatarList2.length,
              //                         gridDelegate:
              //                             const SliverGridDelegateWithFixedCrossAxisCount(
              //                           crossAxisCount: 3,
              //                           crossAxisSpacing: 10.0,
              //                           mainAxisSpacing: 10.0,
              //                         ),
              //                         itemBuilder: (context, index) {
              //                           return GestureDetector(
              //                             onTap: () {
              //                               avatarController
              //                                       .selectedIndex.value =
              //                                   avatarList2[index]['value'];
              //                             },
              //                             child: avatarSelector(
              //                               avatarList2[index]['image'],
              //                               avatarList2[index]['value'],
              //                             ),
              //                           );
              //                         },
              //                       ),
              //                     ),
              //                   ),
              //                 ],
              //               ),
              //             ),
              //           );
              //         },
              //       );
              //     },
              //     child: Obx(
              const CircleAvatar(
                radius: 70,
                backgroundImage: NetworkImage(
                  'https://firebasestorage.googleapis.com/v0/b/confab-3868.appspot.com/o/Profile%20Pictures%2FAsset%2023.png?alt=media&token=5eddaf21-4e66-40e5-8a7a-938d13ee43d5',
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Center(
                child: FutureBuilder<String>(
                    future: getUserFullName(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const CircularProgressIndicator();
                      } else if (snapshot.hasData) {
                        return Text(
                          snapshot.data as String,
                          style: const TextStyle(
                            fontSize: 18,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        );
                      } else if (!snapshot.hasData) {
                        print('snapshot does not have data');
                      }
                      return const Text('error');
                    }),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  // color: Provider.of<ThemeProvider>(context).themeData.colorScheme.primaryContainer,
                  color: const Color.fromARGB(255, 219, 218, 218),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 0),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 6,
                        ),
                        CustomClickableWidget(
                          onTap: () {
                            Get.to(EditProfileScreen());
                          },
                          icon: Icons.edit,
                          text: 'Edit Profile',
                        ),
                        const Divider(color: Colors.white, thickness: 1.5),
                        CustomClickableWidget(
                          onTap: () {},
                          icon: Icons.share,
                          text: 'Social Sharing',
                        ),
                        const Divider(color: Colors.white, thickness: 1.5),
                        CustomClickableWidget(
                          onTap: () {},
                          icon: Icons.history,
                          text: 'History',
                        ),
                        const Divider(color: Colors.white, thickness: 1.5),
                        CustomClickableWidget(
                          onTap: () {},
                          icon: Icons.medical_services_outlined,
                          text: 'Medical Records',
                        ),
                        const Divider(color: Colors.white, thickness: 1.5),
                        CustomClickableWidget(
                          onTap: () {},
                          icon: Icons.settings,
                          text: 'Settings',
                        ),
                        const Divider(color: Colors.white, thickness: 1.5),
                        CustomClickableWidget(
                          onTap: () {},
                          icon: Icons.feedback_outlined,
                          text: 'Feedback',
                        ),
                        const Divider(color: Colors.white, thickness: 1.5),
                        CustomClickableWidget(
                          onTap: () {},
                          icon: Icons.help_center_outlined,
                          text: 'Help',
                        ),
                        const Divider(color: Colors.white, thickness: 1.5),
                        CustomClickableWidget(
                          onTap: () async {
                            var pref = await SharedPreferences.getInstance();
                            pref.remove(SharePreferenceService.isSignIn);
                            pref.remove(SharePreferenceService.userModel);
                            Get.offAll(OpeningScreen());
                          },
                          icon: Icons.logout,
                          text: 'Log out',
                          textColor: Colors.red,
                          iconColor: Colors.red,
                        ),
                        const SizedBox(
                          height: 6,
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<String> getUserFullName() async {
    var user = await SharePreferenceService().getUserModel();
    return user?.fullName ?? '';
  }
}
