import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpdatesChip extends StatelessWidget {
  final VoidCallback onTap;
  final RxBool isButtonChecked;
  final String buttonText;
  final Color pressedColor;
  final Color unpressedColor;

  const UpdatesChip({
    super.key,
    required this.onTap,
    required this.isButtonChecked,
    required this.buttonText,
    required this.pressedColor,
    required this.unpressedColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap, // Call the provided onTap function
      child: Obx(
        () => Container(
          height: 35,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            border: isButtonChecked.value
                ? Border.all(color: Colors.transparent)
                : Border.all(color: Colors.black),
            color: isButtonChecked.value ? pressedColor : unpressedColor,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
            child: Center(
              child: Text(
                buttonText,
                style: TextStyle(
                  color: isButtonChecked.value ? Colors.white : Colors.black,
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
