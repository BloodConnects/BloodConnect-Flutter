import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DynamicButton extends StatelessWidget {
  final RxBool isButtonPressed;
  final String buttonText;
  final Color pressedColor;
  final Color unpressedColor;

  DynamicButton({
    required this.isButtonPressed,
    required this.buttonText,
    required this.pressedColor,
    required this.unpressedColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        isButtonPressed.toggle();
      },
      child: Obx(
        () => Container(
          height: 30,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: isButtonPressed.value
                ? Border.all(color: Colors.transparent)
                : Border.all(color: Colors.black),
            color: isButtonPressed.value ? pressedColor : unpressedColor,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
            child: Text(
              buttonText,
              style: TextStyle(
                color: isButtonPressed.value ? Colors.white : Colors.black,
                fontFamily: 'Inter'
              ),
            ),
          ),
        ),
      ),
    );
  }
}
