import 'package:flutter/material.dart';

import '../../configurations/frontend_configs.dart';

class AppTextField extends StatelessWidget {
  AppTextField(
      {Key? key,
      required this.text,
      required this.keyBoardType,
      required this.controller,
      this.maxLines = 1})
      : super(key: key);
  final String text;
  final TextInputType keyBoardType;
  final TextEditingController controller;
  int maxLines;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyBoardType,
      controller: controller,
      maxLines: maxLines,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.only(top:18,left:18),
        hintText: text,
        hintStyle: TextStyle(
            color: FrontendConfigs.kAuthIconColor,
            fontSize: 14,
            letterSpacing: 1.5,
            fontWeight: FontWeight.w400),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide.none),
        fillColor: FrontendConfigs.kAuthFieldColor,
        filled: true,
      ),
    );
  }
}
