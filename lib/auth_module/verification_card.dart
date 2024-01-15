import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Widget VerificationCard({
  required BuildContext context,
  double width = 48.0,
  TextEditingController? textEditingController,
  TextInputType keyboardType = TextInputType.number,
}) 

{
  return Container(
    width: width,
    decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(12),        
      ),
    ),
    child: Align(
      alignment: Alignment.center,
      child: TextFormField(
        onChanged: (value) {
          if(value.length == 1){
            FocusScope.of(context).nextFocus();
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
