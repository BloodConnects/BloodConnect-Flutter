import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DynamicGestureButton extends StatelessWidget {
  final VoidCallback ontap;
  final RxBool isButtonPressed;
  final String buttonText;
  final Color pressedColor;
  final Color unpressedColor;

  const DynamicGestureButton({
    super.key,
    required this.ontap,
    required this.isButtonPressed,
    required this.buttonText,
    required this.pressedColor,
    required this.unpressedColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap, // Call the provided onTap function
      child: Obx(
        () => Container(
          height: 35,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            border: isButtonPressed.value
                ? Border.all(color: Colors.transparent)
                : Border.all(color: Colors.black),
            color: isButtonPressed.value ? pressedColor : unpressedColor,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
            child: Center(
              child: Text(
                buttonText,
                style: TextStyle(
                  color: isButtonPressed.value ? Colors.white : Colors.black,
                  fontFamily: 'Inter',
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
