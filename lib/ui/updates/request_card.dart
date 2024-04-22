import 'package:blood_donation_app/ui/updates/request_profile_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class RequestCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final FontWeight titleFontWeight;
  final FontWeight subTitleFontWeight;

  const RequestCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.titleFontWeight,
    required this.subTitleFontWeight,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: (){
            Get.to(RequestProfileScreen());
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: const Color.fromRGBO(224, 224, 224, 1),
              boxShadow: const [
                BoxShadow(
                  color: Colors.grey,
                  offset: Offset(1.0, 2.0),
                  blurRadius: 2.5,
                  spreadRadius: 1.0,
                )
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 27,
                    backgroundImage: NetworkImage(
                      'https://images.unsplash.com/photo-1584085727732-b61e464863e3?q=80&w=1887&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontFamily: 'Inter',
                            fontWeight: titleFontWeight,
                          ),
                        ),
                        const SizedBox(
                          height: 2,
                        ),
                        Text(
                          subtitle,
                          style: TextStyle(
                              fontWeight: subTitleFontWeight,
                              fontFamily: 'Inter',
                              color: Colors.black,
                              fontSize: 13),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        )
      ],
    );
  }
}
