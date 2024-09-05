// ignore_for_file: use_build_context_synchronously, file_names
import 'package:all_in_one_student/constant.dart';
import 'package:all_in_one_student/screens/login.dart';
import 'package:all_in_one_student/screens/offers.dart';
import 'package:all_in_one_student/screens/qr.dart';
import 'package:all_in_one_student/screens/theUser.dart';
import 'package:all_in_one_student/services/apiService.dart';
import 'package:all_in_one_student/services/save.dart';
import 'package:all_in_one_student/widget/AppButton.dart';
import 'package:all_in_one_student/widget/appBarLogo.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static String id = "/Home";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    setState(() {});
    animationController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );
    animationController.forward();
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  code = "";
                  pass = "";
                  SaveService.clearUser();
                  Navigator.pop(context);
                  Navigator.of(context).push(goRoute(x: const LoginScreen()));
                },
                icon: const Icon(
                  Icons.login,
                  color: pColor,
                ))
          ],
          centerTitle: true,
          backgroundColor: Colors.white,
          title: const Text(
            "All In One",
            style: TextStyle(
                fontSize: 30, fontWeight: FontWeight.bold, color: pColor),
          ),
        ),
        body: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/bg2.png"),
                fit: BoxFit.fill,
              ),
            ),
            child: Center(
                child: Column(
              children: [
                AppBarLogo(animationController: animationController),
                const Spacer(
                  flex: 1,
                ),
                AppButton(
                  title: "Your Data",
                  fun: () async {
                    try {
                      if (ApiService.token == null) {
                        massege("wait...", cColor, context);
                        int res = await ApiService.userLogin(code, pass);
                        if (res == 200) {
                          Navigator.of(context)
                              .push(goRoute(x: const TheUser()));
                        } else if (res == 401) {
                          massege("Check your data", Colors.red, context);
                        } else {
                          massege("Check your connection", Colors.red, context);
                        }
                      } else {
                        Navigator.of(context).push(goRoute(x: const TheUser()));
                      }
                    } catch (e) {
                      massege("Check your connection", Colors.red, context);
                    }
                  },
                ),
                const Spacer(
                  flex: 1,
                ),
                AppButton(
                  title: "Offers",
                  fun: () {
                    Navigator.of(context)
                        .push(goRoute(x: const OffersScreen()));
                  },
                ),
                const Spacer(
                  flex: 1,
                ),
                AppButton(
                  title: "QR Code",
                  fun: () {
                    Navigator.of(context).push(goRoute(x: const QrScreen()));
                  },
                ),
                const Spacer(
                  flex: 1,
                ),
              ],
            ))));
  }
}
