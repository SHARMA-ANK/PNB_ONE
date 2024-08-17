import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:pnb_one/features/home/screens/homeScreen.dart';
import 'package:pnb_one/features/login/screens/loginScreen.dart';
import 'package:pnb_one/features/payment/screens/paymentScreen.dart';
import 'package:pnb_one/features/splashScreen/splashScreen.dart';

class Routes {
  static const String splashScreen = '/';

  static const String loginScreen = '/login';
  static const String homeScreen = '/home';
  static const String paymentScreen = '/payment';

  static var pages = [
    GetPage(name: splashScreen, page: () => SplashScreen()),
    GetPage(name: loginScreen, page: () => LoginScreen()),
    GetPage(
      name: homeScreen,
      page: () => HomeScreen(),
      transition: Transition.fadeIn,
      // Pass arguments using Get.parameters, or access them using Get.arguments in HomeScreen
    ),
    GetPage(
      name: paymentScreen,
      page: () => PaymentScreen(),
      transition: Transition.fadeIn,
      // Pass arguments using Get.parameters, or access them using Get.arguments in HomeScreen
    ),
  ];
}
