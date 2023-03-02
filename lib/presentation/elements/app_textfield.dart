import 'package:flutter/material.dart';

import '../../configurations/frontend_configs.dart';

class AppTextField extends StatelessWidget {
  AppTextField({Key? key, required this.text, required this.keyBoardType, required this.controller})
      : super(key: key);
  final String text;
  final TextInputType keyBoardType;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 49,
      child: TextFormField(
        keyboardType: keyBoardType,
        controller: controller,
        decoration: InputDecoration(
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
      ),
    );
  }
}
