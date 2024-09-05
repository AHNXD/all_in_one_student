import 'package:flutter/material.dart';

Route goRoute({required var x}) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => x,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, 1.0);
      const end = Offset.zero;
      const curve = Curves.fastEaseInToSlowEaseOut;

      final tween = Tween(begin: begin, end: end);
      final curvedAnimation = CurvedAnimation(
        parent: animation,
        curve: curve,
      );
      return SlideTransition(
        position: tween.animate(curvedAnimation),
        child: child,
      );
    },
  );
}

void massege(String error, Color c, BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    backgroundColor: c,
    content: Center(child: Text(error)),
    duration: const Duration(seconds: 2),
  ));
}

List<Map<String, String>> offers = [
  {"title": "", "tName": "", "price": "Soon", "note": ""},
];

String code = "";
String pass = "";
List data = [];
const Color pColor = Color(0xFF015498);
const Color cColor = Colors.orange;
