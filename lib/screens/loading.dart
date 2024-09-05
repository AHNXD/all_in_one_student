// ignore_for_file: use_build_context_synchronously, no_logic_in_create_state

import 'package:all_in_one_student/constant.dart';
import 'package:all_in_one_student/screens/login.dart';
import 'package:all_in_one_student/services/save.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class LoadingScreen extends StatefulWidget {
  static String id = "/load";
  BuildContext context;
  LoadingScreen(this.context, {super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState(context);
}

class _LoadingScreenState extends State<LoadingScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late final Animation<double> _scaleAnimation =
      CurvedAnimation(parent: animationController, curve: Curves.fastOutSlowIn);
  void next(BuildContext context) async {
    try {
      await SaveService.retrieveUser();
      await Future.delayed(const Duration(milliseconds: 1000), () async {
        Navigator.pop(context);
        Navigator.of(context).push(goRoute(x: const LoginScreen()));
      });
    } catch (e) {
      massege("There was an error, Check your connection", Colors.red, context);
    }
  }

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );
    animationController.forward();
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  _LoadingScreenState(BuildContext context) {
    next(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: pColor,
      body: Center(
        child: ScaleTransition(
          scale: _scaleAnimation,
          child: Padding(
            padding: const EdgeInsets.all(60.0),
            child: Image.asset("assets/images/logo.png"),
          ),
        ),
      ),
    );
  }
}
