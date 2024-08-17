import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pnb_one/constant/colors.dart';
import 'package:pnb_one/features/login/controller/controller.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginController loginController = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    Size mq = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          minimum: EdgeInsets.only(top: mq.height * 0.1),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                alignment: Alignment.center,
                child: Image.asset(
                  "assets/images/pnbOne.png",
                  width: mq.width * 0.4,
                  height: mq.height * 0.3,
                ),
              ),
              SizedBox(
                height: 35,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Login",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: primaryWhite,
                          fontSize: 20),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Welcome To The PNB ONE App",
                      style: TextStyle(color: primaryWhite, fontSize: 15),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "User ID",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: primaryWhite,
                          fontSize: 15),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextField(
                      style: TextStyle(color: primaryWhite),
                      controller: loginController.userIdController,
                      decoration: InputDecoration(
                        hintText:
                            "By Default Customer ID or User Id", // Placeholder text
                        hintStyle: TextStyle(color: Colors.grey),
                        filled: true,
                        fillColor: secondaryBlack,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                          borderSide:
                              BorderSide(color: Colors.black, width: 1.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                          borderSide:
                              BorderSide(color: Colors.black, width: 1.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                          borderSide:
                              BorderSide(color: Colors.blue, width: 2.0),
                        ),
                      ),
                    ),
                    //TexttField
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "Password",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: primaryWhite,
                          fontSize: 15),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Obx(
                      () => TextField(
                        textAlign: TextAlign.start,
                        style: TextStyle(color: primaryWhite),
                        controller: loginController.passwordController,
                        obscureText: loginController.obscureText.value,
                        decoration: InputDecoration(
                          hintText: "Enter your password",
                          hintStyle: TextStyle(color: Colors.grey),
                          filled: true,
                          fillColor: primaryGrey,
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.0)),
                            borderSide:
                                BorderSide(color: Colors.black, width: 1.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.0)),
                            borderSide:
                                BorderSide(color: Colors.black, width: 1.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.0)),
                            borderSide:
                                BorderSide(color: Colors.blue, width: 2.0),
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(
                              loginController.obscureText.value
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: Colors.grey,
                            ),
                            onPressed: () {
                              loginController.obscureText.value =
                                  !loginController.obscureText.value;
                            },
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    //TextField

                    Obx(
                      () => Row(
                        children: [
                          Checkbox(
                            value: loginController.isChecked.value,
                            onChanged: (bool? value) {
                              loginController.isChecked.value = value ?? false;
                              print(
                                  "Keep Me Signed In: ${loginController.isChecked.value}");
                            },
                          ),
                          Text(
                            "Keep Me Signed In",
                            style: TextStyle(color: primaryWhite, fontSize: 15),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: double
                          .infinity, // Makes the button take the full width of the screen
                      child: ElevatedButton(
                        onPressed: () {
                          if (loginController.userIdController.text.isEmpty) {
                            Get.snackbar(
                              "Error", // Title
                              "User ID cannot be empty", // Message
                              snackPosition: SnackPosition
                                  .BOTTOM, // Position of the snackbar
                              backgroundColor: Colors.red, // Background color
                              colorText: Colors.white, // Text color
                              duration: Duration(
                                  seconds: 2), // Duration to show the snackbar
                            );
                          } else if (loginController
                              .passwordController.text.isEmpty) {
                            Get.snackbar(
                              "Error", // Title
                              "Password cannot be empty", // Message
                              snackPosition: SnackPosition
                                  .BOTTOM, // Position of the snackbar
                              backgroundColor: Colors.red, // Background color
                              colorText: Colors.white, // Text color
                              duration: Duration(
                                  seconds: 2), // Duration to show the snackbar
                            );
                          } else {
                            loginController.login();
                          }
                        },
                        child: Text(
                          "Login",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: primaryWhite,
                              fontSize: 20),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              Colors.blue[800], // Set the background color
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
