import 'package:blood_donation_app/color_schemes.g.dart';
import 'package:flutter/material.dart';

Widget DynamicButton({
  required VoidCallback onPressed,
  required String buttonText,
  double? height,
  double? width,
  BorderRadiusGeometry? borderRadius,
  TextStyle? textStyle,
}) {
  return SizedBox(
    height: height ?? 45,
    width: width ?? double.infinity,
    child: ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: lightColorScheme.primary,
        // backgroundColor: Colors.red,
        shape: RoundedRectangleBorder(
          borderRadius: borderRadius ?? BorderRadius.circular(8),
        ),
      ),
      child: Text(
        buttonText,
        style: textStyle ??
            const TextStyle(
              fontFamily: 'Inter',
              fontSize: 18,
              color: Colors.white,
            ),
      ),
    ),
  );
}
