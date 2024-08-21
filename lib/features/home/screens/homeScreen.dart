import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:pnb_one/constant/colors.dart';
import 'package:pnb_one/features/Account/screens/accountScreen.dart';
import 'package:pnb_one/features/Menu/screens/menuScreen.dart';
import 'package:pnb_one/features/home/controller/controller.dart';
import 'package:pnb_one/features/home/widgets/IconLabel.dart';
import 'package:pnb_one/features/home/widgets/smallCard.dart';
import 'package:pnb_one/features/home/widgets/transactionTile.dart';
import 'package:pnb_one/features/login/controller/controller.dart';
import 'package:pnb_one/features/settings/screen/settingScreen.dart';
import 'package:pnb_one/models/transactionList.dart';
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
    getTransactions();
    homeScreenController.balance.value =
        homeScreenController.user.balance.toInt();
  }

  List<Widget> pages = [
    AccountScreen(),
    MenuScreen(),
    Settingscreen(),
  ];
  void getTransactions() async {
    homeScreenController.transactionList.value =
        await homeScreenController.getTransactions();
  }

  void refresh() {
    getTransactions();
    homeScreenController.balance.value =
        homeScreenController.user.balance.toInt();
  }

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size;
    return Obx(() => Scaffold(
        backgroundColor: primaryBlack,
        appBar: homeScreenController.currentPage.value == 0
            ? AppBar(
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
              )
            : AppBar(
                backgroundColor: primaryGrey,
                centerTitle: true,
                foregroundColor: primaryWhite,
                title: Text("${homeScreenController.currentPageTitle.value}"),
              ),
        body: homeScreenController.currentPage.value == 0
            ? Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Column(
                            children: [
                              Text(
                                "Your Balance",
                                style: TextStyle(
                                    color: primaryWhite, fontSize: 18),
                              ),
                              Obx(() => Text(
                                    homeScreenController.obscureBalance.value
                                        ? "₹${homeScreenController.balance.value}"
                                        : "****",
                                    style: TextStyle(
                                        color: primaryWhite, fontSize: 22),
                                  ))
                            ],
                          ),
                          Spacer(),
                          GestureDetector(
                              onTap: () {
                                bool x =
                                    homeScreenController.obscureBalance.value;
                                homeScreenController.obscureBalance.value = !x;
                              },
                              child: Obx(
                                () => Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Icon(
                                        homeScreenController
                                                .obscureBalance.value
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
                                  arguments:
                                      homeScreenController.barcode.value);
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
              )
            : pages[homeScreenController.currentPage.value - 1],
        bottomSheet: homeScreenController.currentPage.value == 0
            ? Container(
                decoration: BoxDecoration(
                    color: primaryGrey,
                    // border: Border.(width: 1),
                    borderRadius: BorderRadius.circular(20)),
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                height: mq.height * 0.3,
                child: Obx(
                  () => Column(
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
                          GestureDetector(
                            onTap: () {
                              Get.toNamed(Routes.transactionDetailsScreen,
                                  arguments: homeScreenController
                                      .transactionList.value);
                            },
                            child: Text(
                              "View Details",
                              style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                              ),
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
                      homeScreenController
                              .transactionList.value!.transactions.isEmpty
                          ? Center(
                              child: Text("No Recent Transactions",
                                  style: TextStyle(color: primaryWhite)),
                            )
                          : Container(
                              height: mq.height * 0.2,
                              child: ListView.builder(
                                itemCount: min(
                                    homeScreenController.transactionList.value!
                                        .transactions.length,
                                    2),
                                itemBuilder: (context, index) =>
                                    TransactionTile(
                                        transaction: homeScreenController
                                            .transactionList
                                            .value!
                                            .transactions[index]),
                              ),
                            ),
                    ],
                  ),
                ))
            : null,
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Color.fromARGB(255, 197, 75, 4),
          unselectedItemColor: Colors.grey,
          currentIndex: homeScreenController.currentPage.value,
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  color: homeScreenController.currentPage.value == 0
                      ? Color.fromARGB(255, 197, 75, 4)
                      : Colors.grey,
                ),
                label: "Home",
                tooltip: "Home"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.account_balance,
                  color: homeScreenController.currentPage.value == 1
                      ? Color.fromARGB(255, 197, 75, 4)
                      : Colors.grey,
                ),
                label: "Account",
                tooltip: "Account"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.person,
                  color: homeScreenController.currentPage.value == 2
                      ? Color.fromARGB(255, 197, 75, 4)
                      : Colors.grey,
                ),
                label: "Account",
                tooltip: "Account"),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.settings,
                color: homeScreenController.currentPage.value == 3
                    ? Color.fromARGB(255, 197, 75, 4)
                    : Colors.grey,
              ),
              label: "Settings",
            )
          ],
          onTap: (index) {
            homeScreenController.currentPage.value = index;
            switch (index) {
              case 0:
                homeScreenController.currentPageTitle.value = "Home";
                break;
              case 1:
                homeScreenController.currentPageTitle.value = "Account";
                break;
              case 2:
                homeScreenController.currentPageTitle.value = "Menu";
                break;
              case 3:
                homeScreenController.currentPageTitle.value = "Settings";
                break;
            }
          },
        )));
  }
}
