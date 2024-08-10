import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:pnb_one/constant/colors.dart';
import 'package:pnb_one/utils/routes/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'PnbOne',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primaryTextTheme:
                TextTheme(bodyMedium: TextStyle(color: primaryWhite)),
            actionIconTheme: ActionIconThemeData(
              backButtonIconBuilder: (context) {
                return const Icon(Icons.arrow_back_ios_rounded);
              },
            ),
            fontFamily: 'Sniglet',
            useMaterial3: true,
            textTheme: TextTheme(),
            scaffoldBackgroundColor: primaryBlack),
        getPages: Routes.pages,
        initialRoute: Routes.loginScreen);
  }
}
