import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  VoidCallback onPressed;
  String btnLabel;
  double width;
  double height;
  Color ?color;
  Color ?textColor;
  Color ?borderColor;
  bool showIcon;

  AppButton(
      {super.key, required this.onPressed,
      required this.btnLabel,
      this.showIcon = false,
      this.color,
        this.textColor=Colors.white,
      this.borderColor,
      this.width = double.infinity,
      this.height = 51});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          primary:color ?? const Color(0xff000000),
          fixedSize: Size(width, height),
          shape: RoundedRectangleBorder(
            side: const BorderSide(color:Color(0xff000000)),
            borderRadius: BorderRadius.circular(6),
          )),
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            btnLabel,
            style:  TextStyle(
              color:textColor!,
              fontWeight: FontWeight.w500,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
