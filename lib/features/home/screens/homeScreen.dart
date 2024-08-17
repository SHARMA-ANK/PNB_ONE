import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:pnb_one/constant/colors.dart';
import 'package:pnb_one/features/home/controller/controller.dart';
import 'package:pnb_one/features/home/widgets/IconLabel.dart';
import 'package:pnb_one/features/home/widgets/smallCard.dart';
import 'package:pnb_one/features/login/controller/controller.dart';
import 'package:pnb_one/utils/routes/routes.dart';

import '../../../models/user.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Constructor to receive the UserModel

  final HomeScreenController homeScreenController =
      Get.put(HomeScreenController());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    homeScreenController.balance.value =
        homeScreenController.user.balance.toInt();
  }

  // void refresh(){

  // }
  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: primaryBlack,
        leading: Padding(
          padding: const EdgeInsets.only(right: 10),
          child: CircleAvatar(
            child: Image.asset("assets/images/pnbOne.png"),
            backgroundColor: primaryGrey,
            radius: 25,
          ),
        ),
        title: Column(
          children: [
            Text(
              "Hi, ${homeScreenController.user.name}",
              style: TextStyle(
                  fontSize: 14,
                  color: primaryWhite,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              "Welcome Back",
              style: TextStyle(fontSize: 14, color: primaryWhite),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: CircleAvatar(
              child: Image.asset("assets/images/pnbOne.png"),
              backgroundColor: primaryGrey,
              radius: 25,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: CircleAvatar(
              child: Icon(
                Icons.chat_outlined,
                color: primaryWhite,
              ),
              backgroundColor: primaryGrey,
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15),
        child: Column(
          children: [
            Row(
              children: [
                Column(
                  children: [
                    Text(
                      "Your Balance",
                      style: TextStyle(color: primaryWhite, fontSize: 18),
                    ),
                    Obx(() => Text(
                          homeScreenController.obscureBalance.value
                              ? "₹${homeScreenController.balance.value}"
                              : "****",
                          style: TextStyle(color: primaryWhite, fontSize: 22),
                        ))
                  ],
                ),
                Spacer(),
                GestureDetector(
                    onTap: () {
                      bool x = homeScreenController.obscureBalance.value;
                      homeScreenController.obscureBalance.value = !x;
                    },
                    child: Obx(
                      () => Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(
                              homeScreenController.obscureBalance.value
                                  ? Icons.remove_red_eye
                                  : Icons.visibility_off,
                              color: Colors.blue[800],
                            ),
                          ),
                          Text(
                            "Hide",
                            style: TextStyle(color: Colors.blue[800]),
                          )
                        ],
                      ),
                    ))
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              children: [
                GestureDetector(
                  onTap: () async {
                    await homeScreenController.scanBarcode();
                    Get.toNamed(Routes.paymentScreen,
                        arguments: homeScreenController.barcode.value);
                  },
                  child: Container(
                    width: (mq.width - 30) / 2,
                    height: (mq.height * 0.2),
                    child: Card(
                      elevation: 1,
                      color: primaryGrey,
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              "assets/images/qrCode.png",
                              height: 30,
                              width: 30,
                            ),
                            Text(
                              "Scan",
                              style: TextStyle(color: primaryWhite),
                            ),
                            Text(
                              "QR Code",
                              style: TextStyle(color: primaryWhite),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Column(
                  children: [
                    GestureDetector(
                      onTap: () => Get.toNamed(Routes.paymentScreen),
                      child: Container(
                        width: (mq.width - 30) / 2,
                        height: (mq.height * 0.1) - 5,
                        child: Smallcard(
                            text1: "Pay",
                            text2: "Contacts",
                            icon: Icons.contacts),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    GestureDetector(
                      onTap: () => Get.toNamed(Routes.paymentScreen),
                      child: Container(
                        width: (mq.width - 30) / 2,
                        height: (mq.height * 0.1) - 5,
                        child: Smallcard(
                            text1: "Pay",
                            text2: "Bank/UPI",
                            icon: Icons.school),
                      ),
                    ),
                  ],
                )
              ],
            ),
            Container(
              height: mq.height * 0.2,
              alignment: Alignment.center,
              child: Card(
                color: primaryGrey,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      IconLabel(
                        text1: "Mobile",
                        text2: "Recharge",
                        icon: Icons.phone_android,
                      ),
                      IconLabel(
                        text1: "Loan",
                        text2: "Repayment",
                        icon: Icons.wallet_membership,
                      ),
                      IconLabel(
                        text1: "Electricity",
                        text2: "Bill",
                        icon: Icons.electrical_services,
                      ),
                      IconLabel(
                        text1: "More",
                        text2: "Services",
                        icon: Icons.more_horiz,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomSheet: Container(
        decoration: BoxDecoration(
            color: primaryGrey,
            border: Border.all(width: 1),
            borderRadius: BorderRadius.circular(20)),
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        height: mq.height * 0.3,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  "Transactions",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: primaryWhite),
                ),
                Spacer(),
                Text(
                  "View Details",
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.blue,
                  size: 16,
                ),
              ],
            ),
            SizedBox(height: 10),
            Container(
              height: mq.height * 0.2,
              child: ListView(
                children: [
                  ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.green,
                      child: Icon(
                        Icons.arrow_upward,
                        color: Colors.white,
                      ),
                    ),
                    title: Text(
                      "Credit",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: primaryWhite,
                      ),
                    ),
                    subtitle: Text(
                      "Payment Received",
                    ),
                    trailing: Text(
                      "+\$500",
                      style: TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.red,
                      child: Icon(
                        Icons.arrow_downward,
                        color: Colors.white,
                      ),
                    ),
                    title: Text(
                      "Debit",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: primaryWhite,
                      ),
                    ),
                    subtitle: Text(
                      "Payment Sent",
                    ),
                    trailing: Text(
                      "-\$200",
                      style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
