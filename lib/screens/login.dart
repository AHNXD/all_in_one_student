// ignore_for_file: use_build_context_synchronously

import 'package:all_in_one_student/constant.dart';
import 'package:all_in_one_student/screens/Home.dart';
import 'package:all_in_one_student/services/apiService.dart';
import 'package:all_in_one_student/services/save.dart';
import 'package:all_in_one_student/widget/appBarLogo.dart';
import 'package:all_in_one_student/widget/textField.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  static String id = "/Login";
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    setState(() {});
    animationController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );
    animationController.forward();
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  GlobalKey<FormState> formKey = GlobalKey();
  bool _isloading = false;

  Future<void> login() async {
    await Future.delayed(const Duration(milliseconds: 1000), () async {
      try {
        await SaveService.retrieveUser();

        if (code != "") {
          _isloading = true;
          setState(() {});
          int res = await ApiService.userLogin(code, pass);
          if (res == 200) {
            _isloading = false;
            setState(() {});
            Navigator.pop(context);
            Navigator.of(context).push(goRoute(x: const HomeScreen()));
            massege("Welcome", Colors.green, context);
          } else if (res == 401) {
            _isloading = false;
            setState(() {});
            massege("Check your data", Colors.red, context);
          } else {
            _isloading = false;
            setState(() {});
            Navigator.pop(context);
            Navigator.of(context).push(goRoute(x: const HomeScreen()));
            massege("Check your connection", Colors.red, context);
          }
        } else {
          massege("You have to login", cColor, context);
        }
      } catch (e) {
        _isloading = false;
        setState(() {});
        Navigator.pop(context);
        Navigator.of(context).push(goRoute(x: const HomeScreen()));
        massege("Check your connection", Colors.red, context);
      }
      _isloading = false;
      setState(() {});
    });
  }

  _LoginScreenState() {
    login();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: const Text(
          "All In One",
          style: TextStyle(
              fontSize: 30, fontWeight: FontWeight.bold, color: pColor),
        ),
      ),
      body: _isloading
          ? const Center(
              child: CircularProgressIndicator(
                color: cColor,
                backgroundColor: pColor,
              ),
            )
          : Form(
              key: formKey,
              child: Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/bg2.png"),
                      fit: BoxFit.fill,
                    ),
                  ),
                  child: Center(
                    child: ListView(
                      children: [
                        AppBarLogo(animationController: animationController),
                        const SizedBox(
                          height: 100,
                        ),
                        const Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Text(
                            "Sign in :",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        CustomTextField(
                          setData: (data) {
                            code = data;
                          },
                          title: "ID",
                          hint: "Enter Your ID",
                          icon: Icons.code,
                          type: TextInputType.number,
                          action: TextInputAction.next,
                        ),
                        CustomTextField(
                          setData: (data) {
                            pass = data;
                          },
                          title: "Password",
                          hint: "Enter Your Password",
                          icon: Icons.password,
                          type: TextInputType.text,
                          action: TextInputAction.done,
                          sec: true,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: SizedBox(
                            height: 50,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    side: const BorderSide(
                                        color: cColor, width: 5),
                                    backgroundColor: Colors.white),
                                onPressed: () async {
                                  if (formKey.currentState!.validate()) {
                                    setState(() {
                                      _isloading = true;
                                    });
                                    try {
                                      int res = await ApiService.userLogin(
                                          code, pass);
                                      if (res == 200) {
                                        await SaveService.saveUser();
                                        Navigator.pop(context);
                                        Navigator.of(context).push(
                                            goRoute(x: const HomeScreen()));
                                        massege(
                                            "Welcome", Colors.green, context);
                                      } else {
                                        massege("Check your data", Colors.red,
                                            context);
                                      }
                                    } catch (e) {
                                      massege(
                                          "There Was an error, Check your connection",
                                          Colors.red,
                                          context);
                                    }
                                    setState(() {
                                      _isloading = false;
                                    });
                                  }
                                },
                                child: const Text(
                                  "Sign in",
                                  style: TextStyle(color: pColor),
                                )),
                          ),
                        ),
                      ],
                    ),
                  )),
            ),
    );
  }
}
