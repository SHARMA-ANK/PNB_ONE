import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:pnb_one/features/login/screens/loginScreen.dart';

class Routes {
  static const String loginScreen = '/';

  static var pages = [
    GetPage(name: loginScreen, page: () => LoginScreen()),
  ];
}
