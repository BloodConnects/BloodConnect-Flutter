import 'package:blood_donation_app/screens/edit_profille_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        titleTextStyle: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          fontFamily: 'Inter',
          color: Colors.black
        ),
        centerTitle: false,
        // actions: const [
        //   Padding(
        //     padding: EdgeInsets.symmetric(horizontal: 15),
        //     child: CircleAvatar(
        //       radius: 20,
        //       backgroundImage: NetworkImage(
        //         'https://images.unsplash.com/photo-1648295194728-cb01f46ff985?q=80&w=449&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
        //       ),
        //     ),
        //   )
        // ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Center(
                child: CircleAvatar(
                  radius: 70,
                  backgroundImage: NetworkImage(
                      'https://images.unsplash.com/photo-1648295194728-cb01f46ff985?q=80&w=449&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Center(
                child: Text(
                  'User Full Name',
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: const Color.fromARGB(255, 219, 218, 218)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 0),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 12, right: 12, top: 12, bottom: 6),
                          child: GestureDetector(
                            onTap: (){
                              Get.to(EditProfileScreen());
                            },
                            child: Container(
                              color: Colors.transparent,
                              child: const Row(
                                children: [
                                  Icon(
                                    Icons.edit,
                                    color: Colors.black,
                                  ),
                                  SizedBox(
                                    width: 12,
                                  ),
                                  Text(
                                    'Edit Profile',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: 'Inter',
                                      fontSize: 16
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        const Divider(color: Colors.white,thickness: 1.5),
                        Padding(
                          padding: const EdgeInsets.only(left: 12, right: 12, top: 6, bottom: 6),
                          child: GestureDetector(
                            onTap: (){

                            },
                            child: Container(
                              color: Colors.transparent,
                              child: const Row(
                                children: [
                                  Icon(
                                    Icons.share,
                                    color: Colors.black,
                                  ),
                                  SizedBox(
                                    width: 12,
                                  ),
                                  Text(
                                    'Social Sharing',
                                    style: TextStyle(
                                      fontFamily: 'Inter',
                                      color: Colors.black,
                                      fontSize: 16
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        const Divider(color: Colors.white,thickness: 1.5),
                        Padding(
                          padding: const EdgeInsets.only(left: 12, right: 12, top: 6, bottom: 6),
                          child: GestureDetector(
                            onTap: (){

                            },
                            child: Container(
                              color: Colors.transparent,
                              child: const Row(
                                children: [
                                  Icon(
                                    Icons.history,
                                    color: Colors.black,
                                  ),
                                  SizedBox(
                                    width: 12,
                                  ),
                                  Text(
                                    'History',
                                    style: TextStyle(
                                      fontFamily: 'Inter',
                                      color: Colors.black,
                                      fontSize: 16
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        const Divider(color: Colors.white,thickness: 1.5),
                        Padding(
                          padding: const EdgeInsets.only(left: 12, right: 12, top: 6, bottom: 6),
                          child: GestureDetector(
                            onTap: (){

                            },
                            child: Container(
                              color: Colors.transparent,
                              child: const Row(
                                children: [
                                  Icon(
                                    Icons.medical_services_outlined,
                                    color: Colors.black,
                                  ),
                                  SizedBox(
                                    width: 12,
                                  ),
                                  Text(
                                    'Medical Records',
                                    style: TextStyle(
                                      fontFamily: 'Inter',
                                      color: Colors.black,
                                      fontSize: 16
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        const Divider(color: Colors.white,thickness: 1.5),
                        Padding(
                          padding: const EdgeInsets.only(left: 12, right: 12, top: 6, bottom: 6),
                          child: GestureDetector(
                            onTap: (){

                            },
                            child: Container(
                              color: Colors.transparent,
                              child: const Row(
                                children: [
                                  Icon(
                                    Icons.settings,
                                    color: Colors.black,
                                  ),
                                  SizedBox(
                                    width: 12,
                                  ),
                                  Text(
                                    'Setting',
                                    style: TextStyle(
                                      fontFamily: 'Inter',
                                      color: Colors.black,
                                      fontSize: 16
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        const Divider(color: Colors.white,thickness: 1.5),
                        Padding(
                          padding: const EdgeInsets.only(left: 12, right: 12, top: 6, bottom: 6),
                          child: GestureDetector(
                            onTap: (){

                            },
                            child: Container(
                              color: Colors.transparent,
                              child: const Row(
                                children: [
                                  Icon(
                                    Icons.feedback_outlined,
                                    color: Colors.black,
                                  ),
                                  SizedBox(
                                    width: 12,
                                  ),
                                  Text(
                                    'Feedback',
                                    style: TextStyle(
                                      fontFamily: 'Inter',
                                      color: Colors.black,
                                      fontSize: 16
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        const Divider(color: Colors.white,thickness: 1.5),
                        Padding(
                          padding: const EdgeInsets.only(left: 12, right: 12, top: 6, bottom: 6),
                          child: GestureDetector(
                            onTap: (){

                            },
                            child: Container(
                              color: Colors.transparent,
                              child: const Row(
                                children: [
                                  Icon(
                                    Icons.help_center_outlined,
                                    color: Colors.black,
                                  ),
                                  SizedBox(
                                    width: 12,
                                  ),
                                  Text(
                                    'Help',
                                    style: TextStyle(
                                      fontFamily: 'Inter',
                                      color: Colors.black,
                                      fontSize: 16
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        const Divider(color: Colors.white,thickness: 1.5),
                        Padding(
                          padding: const EdgeInsets.only(left: 12, right: 12, bottom: 12, top: 6),
                          child: GestureDetector(
                            onTap: (){

                            },
                            child: Container(
                              color: Colors.transparent,
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.logout,
                                    color: Colors.red[900],
                                  ),
                                  const SizedBox(
                                    width: 12,
                                  ),
                                  Text(
                                    'Log out',
                                    style: TextStyle(
                                      fontFamily: 'Inter',
                                      color: Colors.red[900],
                                      fontSize: 16
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
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
}
