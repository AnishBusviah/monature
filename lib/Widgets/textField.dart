import 'package:flutter/material.dart';

class InputTextField extends StatelessWidget {
  final String displayText;
  final double textFieldWidth;
  final double textFieldHeight;
  TextEditingController controller;

  InputTextField(
      {Key? key, required this.controller, required this.displayText, required this.textFieldWidth, required this.textFieldHeight})
      : super(key: key) {}

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: textFieldWidth * MediaQuery.of(context).size.width,
        height: textFieldHeight * MediaQuery.of(context).size.height,
        child: TextField(
          controller: controller,
          decoration: InputDecoration(contentPadding: EdgeInsets.only(top: 5, left: 10),
              hintText: displayText,
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
        ));
  }
}
