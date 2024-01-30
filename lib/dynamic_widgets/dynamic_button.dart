import 'package:flutter/material.dart';

Widget DynamicButton({
  required VoidCallback onPressed,
  required String buttonText,
  double? height,
  double? width,
  Color? backgroundColor,
  BorderRadiusGeometry? borderRadius,
  TextStyle? textStyle,
}) {
  return SizedBox(
    height: height ?? 45,
    width: width ?? double.infinity,
    child: ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: backgroundColor != null
            ? MaterialStateProperty.all(backgroundColor)
            : null,
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: borderRadius ?? BorderRadius.circular(8),
          ),
        ),
      ),
      child: Text(
        buttonText,
        style: textStyle ?? const TextStyle(
          fontFamily: 'Inter',
          fontSize: 18,
          color: Colors.white,
        ),
      ),
    ),
  );
}
