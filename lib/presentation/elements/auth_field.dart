import 'package:flutter/material.dart';

import '../../configurations/frontend_configs.dart';

class CustomTextField extends StatefulWidget {
  CustomTextField({
    Key? key,
    this.controller,
    required this.icon,
    required this.text,
    this.isSecure = false,
    this.isPassword = false,
    required this.onTap,
    required this.keyBoardType,
  }) : super(key: key);
  final IconData icon;
  final String text;
  bool isSecure;
  final TextInputType keyBoardType;

  bool isPassword;
  TextEditingController? controller;
  final VoidCallback onTap;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 49,
      child: TextFormField(
        keyboardType: widget.keyBoardType,
        controller: widget.controller,
        obscureText: widget.isSecure,
        decoration: InputDecoration(
          hintText: widget.text,
          hintStyle: TextStyle(
              color: FrontendConfigs.kAuthIconColor,
              fontSize: 14,
              letterSpacing: 1.5,
              fontWeight: FontWeight.w400),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide.none),
          fillColor: FrontendConfigs.kAuthFieldColor,
          suffixIcon: widget.isPassword
              ? InkWell(
                  onTap: () {
                    setState(() {
                      widget.isSecure = !widget.isSecure;
                    });
                    return widget.onTap();
                  },
                  child: widget.isSecure
                      ? Icon(Icons.visibility_off_outlined,
                          color: FrontendConfigs.kAuthIconColor, size: 20)
                      : Icon(
                          Icons.remove_red_eye_outlined,
                          color: FrontendConfigs.kAuthIconColor,
                          size: 20,
                        ))
              : null,
          filled: true,
          prefixIcon: Icon(widget.icon),
        ),
      ),
    );
  }
}
