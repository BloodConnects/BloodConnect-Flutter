import 'package:blood_donation_app/ui/color_schemes.g.dart';
import 'package:flutter/material.dart';

Widget DynamicOutlineButton({
  required VoidCallback onPressed,
  required String buttonText,
  double? height,
  double? width,
  BorderRadiusGeometry? borderRadius,
  TextStyle? textStyle,
}) {
  return ElevatedButton(
    onPressed: () {},
    style: const ButtonStyle(
      backgroundColor: MaterialStatePropertyAll(Colors.white),
      side: MaterialStatePropertyAll(
        BorderSide(
          color: Colors.black,
          width: 1,
        ),
      ),
    ),
    child: const Text(
      'Ignore',
      style: TextStyle(
        color: Colors.black,
        fontFamily: 'Inter',
      ),
    ),
  );
}
