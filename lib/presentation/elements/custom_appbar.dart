import 'package:flutter/material.dart';
customAppBar(
  BuildContext context, {
  String? text,
  bool showText = false,
}) {
  return AppBar(
    centerTitle: true,
    leading:
    IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
            size:20,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
    title: showText
        ? Text(
            text!,
            style: const TextStyle(
                color:Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.w500),
          )
        : const SizedBox(),
    backgroundColor: Colors.transparent,
    elevation: 0,
  );
}
