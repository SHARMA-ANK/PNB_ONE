import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pnb_one/constant/colors.dart';
import 'package:pnb_one/features/Account/controllers/accountController.dart';
import 'package:pnb_one/features/Account/widgets/highlightedButton.dart';
import 'package:pnb_one/features/Account/widgets/iconButton.dart';
import 'package:pnb_one/features/home/controller/controller.dart';
import 'package:pnb_one/utils/routes/routes.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  Accountcontroller accountcontroller = Get.put(Accountcontroller());
  HomeScreenController homeScreenController = Get.put(HomeScreenController());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    accountcontroller.setAccountDetails(Get.arguments);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Highlightedbutton(text: "Savings"),
                  Highlightedbutton(text: "Deposits")
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "Account Details",
                style: TextStyle(
                  color: primaryWhite,
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Obx(() => Card(
                    color: primaryGrey,
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                "Account Number",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Spacer(),
                              Text(
                                accountcontroller.obscureDetails.value
                                    ? accountcontroller.accountNumber.value
                                    : "*********",
                                style: TextStyle(
                                  color: primaryWhite,
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Row(
                            children: [
                              Text(
                                "Account Holder Name",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Spacer(),
                              Text(
                                accountcontroller.obscureDetails.value
                                    ? "${accountcontroller.accountName.value}"
                                    : "*********",
                                style: TextStyle(
                                  color: primaryWhite,
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            "Account Balance",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            accountcontroller.obscureDetails.value
                                ? "₹ ${accountcontroller.accountBalance.value}"
                                : "******",
                            style: TextStyle(
                              color: primaryWhite,
                              fontSize: 30,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Iconbutton(
                                  text: "Hide",
                                  callback: () {
                                    accountcontroller.obscureDetails.value =
                                        !accountcontroller.obscureDetails.value;
                                  }),
                              Spacer(),
                              Iconbutton(
                                text: "Add Money",
                                callback: () {},
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  )),
              SizedBox(
                height: 5,
              ),
              Card(
                color: primaryGrey,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                  child: Row(
                    children: [
                      Text(
                        "UPI ID: ",
                        style: TextStyle(
                            color: primaryWhite,
                            fontSize: 15,
                            fontWeight: FontWeight.w500),
                      ),
                      Spacer(),
                      Text(
                        "johndoe@upi",
                        style: TextStyle(color: Colors.grey, fontSize: 15),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Card(
                color: primaryGrey,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                  child: Row(
                    children: [
                      Text(
                        "Account Activity",
                        style: TextStyle(
                            color: primaryWhite,
                            fontSize: 15,
                            fontWeight: FontWeight.w500),
                      ),
                      Spacer(),
                      GestureDetector(
                          onTap: () {
                            Get.toNamed(Routes.transactionDetailsScreen,
                                arguments:
                                    homeScreenController.transactionList.value);
                          },
                          child: Icon(Icons.arrow_forward_ios,
                              color: Colors.blue[800])),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
