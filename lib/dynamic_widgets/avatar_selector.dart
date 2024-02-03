import 'package:blood_donation_app/controller/avatar_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget AvatarSelector(String imageUrl, int selectedIndex){
  AvatarController avatarController = Get.put(AvatarController());

  return Stack(
    children: [
      Obx(() {
          return Column(
            children: [
              Container(
                width: 110,
                height: 110,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(imageUrl),
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                      avatarController.selectedIndex.value == selectedIndex
                          ? Colors.red.withOpacity(0.5)
                          : Colors.transparent,
                      BlendMode.darken,
                    ),
                  ),
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: avatarController.selectedIndex.value == selectedIndex
                        ? Colors.red
                        : Colors.white12,
                  ),
                ),
                child: Visibility(
                  visible: avatarController.selectedIndex.value == selectedIndex,
                  child: const Icon(
                    Icons.check,
                    size: 40,
                    color: Colors.red,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    ],
  );
}