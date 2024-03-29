import 'package:flutter/material.dart';

Widget DynamicTextField({
  required TextEditingController controller,
  required TextInputType keyboardType,
  required String labelText,
  required String hintText,
  VoidCallback? ontap,
  bool enable = true,
  Color borderColor = Colors.black,
  Widget? prefixIcon,
}) {
  return TextField(
    controller: controller,
    keyboardType: keyboardType,
    onTap: ontap,
    decoration: InputDecoration(
      labelText: labelText,
      enabled: enable,
      hintText: hintText,
      prefixIcon: prefixIcon,
      hintStyle: const TextStyle(
        fontFamily: 'Inter',
      ),
      border: OutlineInputBorder(
        borderSide: BorderSide(
          color: borderColor,
        ),
      ),
    ),
  );
}
