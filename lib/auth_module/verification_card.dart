import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class VerificationCard extends StatelessWidget {
  final BuildContext context;
  final TextEditingController? textEditingController;
  final FocusNode? focusNode;
  final VoidCallback? onFilled;

  VerificationCard({
    required this.context,
    this.textEditingController,
    this.focusNode,
    this.onFilled,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 48.0,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
      child: Align(
        alignment: Alignment.center,
        child: TextFormField(
          onChanged: (value) {
            if (value.length == 1) {
              FocusScope.of(context).nextFocus();
            }
            else if(value.length != 1){
              FocusScope.of(context).previousFocus();
            }
            if (onFilled != null && value.isNotEmpty) {
              onFilled!();
            }
          },
          controller: textEditingController,
          keyboardType: TextInputType.number,
          textAlign: TextAlign.center,
          inputFormatters: [
            LengthLimitingTextInputFormatter(1),
            FilteringTextInputFormatter.digitsOnly,
          ],
          decoration: const InputDecoration(
            border: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
          ),
        ),
      ),
    );
  }
}