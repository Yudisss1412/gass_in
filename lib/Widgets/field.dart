import 'package:flutter/material.dart';

import '../constant.dart';

class Field extends StatelessWidget {
  bool? textCenter;
  Widget? suffix;
  bool? isPassword;
  final String hintText;
  TextEditingController? controller;
  String? Function(String?)? validator;
  Field({
    super.key,
    required this.hintText, this.isPassword, this.suffix, this.textCenter, this.controller, this.validator
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(color: grey1, borderRadius: BorderRadius.circular(8)),
      child: TextFormField(
        validator: validator,
        controller: controller,

        //ketika isPassword bernilai null, maka akan diberikan nilai false
        obscureText: isPassword ??= false,
        textAlign: textCenter == null ? TextAlign.center : TextAlign.start,
        decoration: InputDecoration(
          suffixIcon: suffix,
          enabledBorder: const UnderlineInputBorder(borderSide: BorderSide(color: underlineGreen)),
          hintText: hintText,
          hintStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: textGrey,
          ),
        ),
      ),
    );
  }
}
