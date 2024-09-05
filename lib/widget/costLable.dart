// ignore_for_file: file_names

import 'package:all_in_one_student/constant.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustLable extends StatelessWidget {
  CustLable(
      {required this.lead, required this.tail, required this.go, super.key});
  String lead;
  String tail;
  Function() go;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          padding: const EdgeInsets.all(16),
          height: 100,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(60),
              border: Border.all(color: pColor, width: 5)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(children: [
              Text(
                lead,
                style:
                    const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              const Spacer(
                flex: 1,
              ),
              Text(
                tail,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              const Spacer(
                flex: 1,
              ),
            ]),
          )),
    );
  }
}
