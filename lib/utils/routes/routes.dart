import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:pnb_one/features/Account/screens/accountScreen.dart';
import 'package:pnb_one/features/Menu/screens/menuScreen.dart';
import 'package:pnb_one/features/home/screens/homeScreen.dart';
import 'package:pnb_one/features/login/screens/loginScreen.dart';
import 'package:pnb_one/features/payment/screens/paymentScreen.dart';
import 'package:pnb_one/features/settings/screen/settingScreen.dart';
import 'package:pnb_one/features/splashScreen/splashScreen.dart';
import 'package:pnb_one/features/transactionDetails/screens/transactionDetailScreen.dart';

class Routes {
  static const String splashScreen = '/';

  static const String loginScreen = '/login';
  static const String homeScreen = '/home';
  static const String paymentScreen = '/payment';
  static const String transactionDetailsScreen = '/transactionDetails';
  static const String menuScreen = '/menu';
  static const String profileScreen = '/profile';
  static const String settingsScreen = '/settings';

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
    GetPage(
      name: transactionDetailsScreen,
      page: () => TransactionDetailsScreen(),
      transition: Transition.leftToRight,
    ),
    GetPage(
      name: menuScreen,
      page: () => MenuScreen(),
      transition: Transition.leftToRight,
    ),
    GetPage(
      name: profileScreen,
      page: () => AccountScreen(),
      transition: Transition.leftToRight,
    ),
    GetPage(
      name: settingsScreen,
      page: () => Settingscreen(),
      transition: Transition.leftToRight,
    ),
  ];
}
