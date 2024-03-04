import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/core/services/colors.dart';
import 'package:graduation_project/view/reg&login_Screen%20(auth)/signIn.dart';
import 'package:http/http.dart' as http;
import 'package:get/get_core/src/get_main.dart';
import '../BNBar_Screens/doctorDetailsOfProfile.dart';
import '../widget/widgets screen (all widgets).dart';

ShowPasswordClass controller = Get.put(ShowPasswordClass());

class SignUpAsNurse extends StatefulWidget {
  State<SignUpAsNurse> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<SignUpAsNurse> {
  var FormKeySignUp = GlobalKey<FormState>();
  final FormKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController1 = TextEditingController();
  final TextEditingController passwordController2 = TextEditingController();

  Future<void> _register() async {
    final response = await http.post(
      //  Uri.parse('http://127.0.0.1:8000/api/auth/register'),
      Uri.parse("https://care-for-you-v1.000webhostapp.com/api/auth/register"),
      body: jsonEncode({
        'email': emailController.text.trim(),
        'password': passwordController2.text.trim(),
        'name': usernameController.text.trim()
      }),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      // Registration successful, redirect to home screen
      Get.off(doctorDetailsOfProfile());
    } else {
      // Registration failed, show error message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Registration failed'),
        ),
      );
    }
  }

  Widget build(BuildContext context) {
    final isDark=Theme.of(context).brightness==Brightness.dark;
    dynamic fontcolor=isDark?grayColor:mainColor;

  return Scaffold(
      appBar: PreferredSize(
          child: AppBar(
            backgroundColor: mainColor,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image(
                    image: AssetImage("assets/images/logoWhite.png"),
                    height: 60,
                    color: Colors.grey[300]),
                Spacer(),
                Stack(
                  fit: StackFit.passthrough,
                  children: [
                    CircleAvatar(
                      child: IconButton(
                          onPressed: () {
                            Get.to(SignInAsNurse());
                          },
                          icon: Icon(Icons.login_sharp)),
                      backgroundColor: Colors.grey[300],
                    ),
                  ],
                ),
              ],
            ),
          ),
          preferredSize: Size.fromHeight(70)),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
        child: Form(
          key: FormKeySignUp,
          child: ListView(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                      child: Text(
                    "Care For You.",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: mainColor),
                  )),
                  SizedBox(
                    height: 20,
                  ),
                  Center(
                      child: Text(
                    "Sign Up".tr,
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: mainColor),
                  )),
                  SizedBox(
                    height: 20,
                  ),
                  Center(
                      child: Text(
                    "Nursing , Care , Help".tr,
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: mainColor),
                  )),
                ],
              ),
              SizedBox(
                height: 50,
              ),
              TextFormFieldScreen(
                controller: usernameController,
                keyboardType: TextInputType.name,
                label: "Enter Your name".tr,
                prefix: Icons.email,
                validator: (value) {
                  return ValidatorScreen(value!, 2, 90, "usernameController");
                },
              ),
              SizedBox(height: 10),
              TextFormFieldScreen(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                label: "Enter Your Email".tr,
                prefix: Icons.email,
                validator: (value) {
                  return ValidatorScreen(value!, 5, 90, "email");
                },
              ),
              SizedBox(
                height: 20.0,
              ),
              GetBuilder<ShowPasswordClass>(builder: (controller) {
                return TextFormFieldScreen(
                    obsureText: controller.isshowPassword,
                    controller: passwordController1,
                    keyboardType: TextInputType.name,
                    label: "Enter New Password".tr,
                    prefix: Icons.lock,
                    validator: (value) {
                      return ValidatorScreen(
                          value!, 6, 90, "passwordController1");
                    },
                    suffixIcon: controller.isshowPassword
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined,
                    onPressed: () {
                      controller.showPassword();
                    });
              }),
              SizedBox(
                height: 20.0,
              ),
              GetBuilder<ShowPasswordClass>(builder: (controller) {
                return TextFormFieldScreen(
                    obsureText: controller.isshowPassword,
                    controller: passwordController2,
                    keyboardType: TextInputType.name,
                    label: "Re Enter New Password".tr,
                    prefix: Icons.lock,
                    validator: (value) {
                      if (value != passwordController1.text) {
                        return 'Passwords do not match';
                      }
                      return ValidatorScreen(
                          value!, 6, 90, "passwordController1");
                    },
                    suffixIcon: controller.isshowPassword
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined,
                    onPressed: () {
                      controller.showPassword();
                    });
              }),
              SizedBox(
                height: 30.0,
              ),
              MaterialButtonScreen(
                titleOfButton: "Sign Up".tr,
                widthOfButton: double.infinity,
                fontSize: 24,
                fontWeight: FontWeight.normal,
                colorOfButton: mainColor,
                onPressed: () {
                  if (FormKeySignUp.currentState!.validate()) {
                    FormKeySignUp.currentState!.save();
                    _register();
                    //    Get.to(doctorDetailsOfProfile());
                  }},),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Do you have any accout?".tr,style: TextStyle(color: fontcolor)),
                  TextButton(
                    child: Text(
                      "Sign in".tr,
                      style: TextStyle(
                        color: mainColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                      textAlign: TextAlign.end,
                    ),
                    onPressed: () {
                      Get.to(SignInAsNurse());
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
