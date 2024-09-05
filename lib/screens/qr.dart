import 'package:all_in_one_student/constant.dart';
import 'package:all_in_one_student/widget/appBarLogo.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrScreen extends StatefulWidget {
  const QrScreen({super.key});
  static String id = "/QR";

  @override
  State<QrScreen> createState() => _QrScreenState();
}

class _QrScreenState extends State<QrScreen>
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
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: pColor,
              size: 30,
            )),
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
          child: ListView(
            children: [
              AppBarLogo(animationController: animationController),
              const SizedBox(
                height: 50,
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                    decoration: BoxDecoration(
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black45,
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                        color: Colors.white,
                        border: Border.all(color: cColor, width: 5),
                        borderRadius: BorderRadius.circular(15)),
                    child: QrImageView(
                      errorStateBuilder: (cxt, err) {
                        return const Center(
                          child: Text(
                            'Uh oh! Something went wrong...',
                            textAlign: TextAlign.center,
                          ),
                        );
                      },
                      semanticsLabel: data.isEmpty ? code : data[0]["code"],
                      dataModuleStyle: const QrDataModuleStyle(
                        color: Colors.black,
                      ),
                      eyeStyle: const QrEyeStyle(color: Colors.black),
                      data: data.isEmpty ? code : data[0]["code"],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Center(
                child: Container(
                  alignment: Alignment.center,
                  height: 50,
                  width: MediaQuery.sizeOf(context).width * 0.75,
                  decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black45,
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                      color: Colors.white,
                      border: Border.all(color: cColor, width: 5),
                      borderRadius: BorderRadius.circular(15)),
                  child: Text(
                    data.isEmpty ? code : data[0]["code"],
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
