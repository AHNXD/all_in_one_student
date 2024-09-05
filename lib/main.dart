import 'package:all_in_one_student/screens/Home.dart';
import 'package:all_in_one_student/screens/history.dart';
import 'package:all_in_one_student/screens/loading.dart';
import 'package:all_in_one_student/screens/login.dart';
import 'package:all_in_one_student/screens/offers.dart';
import 'package:all_in_one_student/screens/qr.dart';
import 'package:all_in_one_student/screens/theUser.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: "All In One",
    debugShowCheckedModeBanner: false,
    initialRoute: LoadingScreen.id,
    routes: {
      LoadingScreen.id: (context) => LoadingScreen(context),
      HomeScreen.id: (context) => const HomeScreen(),
      TheUser.id: (context) => const TheUser(),
      HistoryScreen.id: (context) => const HistoryScreen(),
      OffersScreen.id: (context) => const OffersScreen(),
      LoginScreen.id: (context) => const LoginScreen(),
      QrScreen.id: (context) => const QrScreen()
    },
  ));
}
