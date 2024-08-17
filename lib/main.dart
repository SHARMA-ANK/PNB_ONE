import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:pnb_one/constant/colors.dart';
import 'package:pnb_one/features/home/screens/homeScreen.dart';
import 'package:pnb_one/features/login/screens/loginScreen.dart';
import 'package:pnb_one/features/login/services/loginService.dart';
import 'package:pnb_one/features/splashScreen/splashScreen.dart';
import 'package:pnb_one/models/user.dart';
import 'package:pnb_one/utils/routes/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'PnbOne',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryTextTheme: TextTheme(
            bodyMedium: TextStyle(color: primaryWhite),
          ),
          actionIconTheme: ActionIconThemeData(
            backButtonIconBuilder: (context) {
              return const Icon(Icons.arrow_back_ios_rounded);
            },
          ),
          fontFamily: 'Sniglet',
          useMaterial3: true,
          textTheme: TextTheme(),
          scaffoldBackgroundColor: primaryBlack),
      initialRoute: Routes.splashScreen,
      getPages: Routes.pages,
    );
  }
}
