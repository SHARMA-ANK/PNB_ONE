import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:pnb_one/features/login/services/loginService.dart';
import 'package:pnb_one/models/user.dart';
import 'package:pnb_one/utils/routes/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigate();
  }

  Future<void> _navigate() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('accessToken');
    if (token != null) {
      LoginServices loginServices = LoginServices();
      UserModel? user = await loginServices.validateUser(token);
      print(user);
      if (user != null) {
        Get.offAllNamed(Routes.homeScreen, arguments: user);
      } else {
        Get.offAllNamed(Routes.loginScreen);
      }
    } else {
      Get.offAllNamed(Routes.loginScreen);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
