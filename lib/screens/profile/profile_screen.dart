import 'package:blood_donation_app/auth_screens/opening_screen.dart';
import 'package:blood_donation_app/controller/avatar_controller.dart';
import 'package:blood_donation_app/dynamic_widgets/avatar_selector.dart';
import 'package:blood_donation_app/dynamic_widgets/custom_profile_clickable_widget.dart';
import 'package:blood_donation_app/screens/profile/edit_profille_screen.dart';
import 'package:blood_donation_app/share_preference/share_preference_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  AvatarController avatarController = Get.put(AvatarController());
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
                  child: const CircleAvatar(
                    radius: 70,
                    backgroundImage: NetworkImage(
                        'https://images.unsplash.com/photo-1648295194728-cb01f46ff985?q=80&w=449&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
                  ),
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
                        print('snapshot does not have dataa');
                      }
                      return Text('error');
                    }),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
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
    return user.fullName ?? '';
  }
}
