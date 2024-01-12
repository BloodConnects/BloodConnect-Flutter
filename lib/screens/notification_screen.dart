import 'package:blood_donation_app/screens/dynamic_gesture_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationScreenController extends GetxController {
  final RxBool _requestedIsButtonPressed = false.obs;
  final RxBool _articlesButtonPressed = false.obs;
  final RxBool _eventButtonPressed = false.obs;

  RxBool get requestedIsButtonPressed => _requestedIsButtonPressed;
  RxBool get articlesButtonPressed => _articlesButtonPressed;
  RxBool get eventButtonPressed => _eventButtonPressed;

  void toggleRequestedButton() {
    _requestedIsButtonPressed.toggle();
    _articlesButtonPressed.value = false;
    _eventButtonPressed.value = false;
  }

  void toggleArticlesButton() {
    _requestedIsButtonPressed.value = false;
    _articlesButtonPressed.toggle();
    _eventButtonPressed.value = false;
  }

  void toggleEventButton() {
    _requestedIsButtonPressed.value = false;
    _articlesButtonPressed.value = false;
    _eventButtonPressed.toggle();
  }
}

class NotificationScreen extends StatelessWidget {
  final NotificationScreenController controller =
      NotificationScreenController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Updates',
        ),
        titleTextStyle: const TextStyle(
          color: Colors.black,
          fontSize: 18,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w500,
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: CircleAvatar(
              radius: 20,
              backgroundImage: NetworkImage(
                  'https://images.unsplash.com/photo-1648295194728-cb01f46ff985?q=80&w=449&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
            ),
          )
        ],
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    controller.toggleRequestedButton();
                  },
                  child: DynamicButton(
                    isButtonPressed: controller.requestedIsButtonPressed,
                    buttonText: 'Requests',
                    pressedColor: Colors.red,
                    unpressedColor: Colors.white,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                GestureDetector(
                  onTap: () {
                    controller.toggleArticlesButton();
                  },
                  child: DynamicButton(
                    isButtonPressed: controller.articlesButtonPressed,
                    buttonText: 'Articles',
                    pressedColor: Colors.red,
                    unpressedColor: Colors.white,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                GestureDetector(
                  onTap: () {
                    controller.toggleEventButton();
                  },
                  child: DynamicButton(
                    isButtonPressed: controller.eventButtonPressed,
                    buttonText: 'Events',
                    pressedColor: Colors.red,
                    unpressedColor: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
