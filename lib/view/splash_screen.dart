import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm/view_model/services/splash_services.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashServices splashScreen = SplashServices();

  @override
  void initState() {
    splashScreen.isLogin();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.teal,
        body: Center(
          child: Text(
            "splash_text".tr,
            style: const TextStyle(fontSize: 22, color: Colors.white),
          ),
        ));
  }
}
