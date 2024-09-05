// ignore_for_file: file_names, must_be_immutable

import 'package:all_in_one_student/constant.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  String? title;
  String? hint;
  IconData? icon;
  TextInputAction? action;
  TextInputType? type;
  Function(String) setData;
  bool sec;
  CustomTextField(
      {super.key,
      required this.setData,
      required this.title,
      required this.hint,
      required this.icon,
      required this.type,
      required this.action,
      this.sec = false});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextFormField(
        obscureText: sec,
        validator: (data) {
          if (data!.isEmpty) return 'You have to enter a value';
          return null;
        },
        onChanged: setData,
        style: const TextStyle(color: pColor),
        textInputAction: action,
        keyboardType: type,
        decoration: InputDecoration(
          prefixIcon: Icon(
            icon,
            color: Colors.orange,
          ),
          fillColor: Colors.white,
          filled: true,
          isDense: true,
          errorStyle: const TextStyle(fontWeight: FontWeight.bold),
          errorBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(50)),
              borderSide: BorderSide(color: Colors.red, width: 5)),
          focusedErrorBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(50)),
              borderSide: BorderSide(color: Colors.red, width: 5)),
          focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(50)),
              borderSide: BorderSide(color: Colors.orange, width: 5)),
          enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(50)),
              borderSide: BorderSide(color: pColor, width: 5)),
          hintText: hint,
          hintStyle: const TextStyle(
            color: cColor,
          ),
        ),
      ),
    );
  }
}
