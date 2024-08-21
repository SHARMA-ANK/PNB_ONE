import 'package:get/get.dart';
import 'package:pnb_one/models/user.dart';

class Accountcontroller extends GetxController {
  RxString accountType = "Savings".obs;
  RxString accountNumber = "********".obs;
  RxString accountBalance = "*****".obs;
  RxString accountName = "********".obs;
  RxBool obscureDetails = false.obs;
  void setAccountDetails(UserModel user) {
    accountNumber.value = user.accountNo;
    accountBalance.value = user.balance.toString();
    accountName.value = user.name;
  }
}
