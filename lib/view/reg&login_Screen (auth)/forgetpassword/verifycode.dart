
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:graduation_project/controller/auth/verifycode_controller.dart';
import 'package:graduation_project/core/services/colors.dart';

import '../../widget/auth/customtextbodyauth.dart';
import '../../widget/auth/customtexttitleauth.dart';
import '../resetPassword.dart';
import '../signIn.dart';

class VerfiyCode extends StatelessWidget {
  const VerfiyCode({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    VerifyCodeControllerImp controller = Get.put(VerifyCodeControllerImp());
    final isDark=Theme.of(context).brightness==Brightness.dark;
    dynamic fontcolor=isDark?Colors.white:Colors.black;

    return Scaffold(
      appBar:PreferredSize(child:AppBar
      ( backgroundColor:mainColor,
      title: Row(mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image(image: AssetImage("assets/images/logoWhite.png"), height: 60 ,color: Colors.grey[300]) ,
          Spacer(),
          Stack( fit: StackFit.passthrough,
            children: [
              CircleAvatar(child:IconButton(onPressed: () {
                Get.to(SignInAsNurse());
              }, icon:Icon(Icons.login_sharp) ), backgroundColor: Colors.grey[300],) ,

            ],
          ),
        ],) ,


    ),   preferredSize: Size.fromHeight(70)),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
        child: ListView(children: [
          const SizedBox(height: 20),
          const CustomTextTitleAuth(text: "Check code"),
          const SizedBox(height: 10),
          const CustomTextBodyAuth(
              text:
                  "Please Enter The Digit Code Sent To wael@gmail.com"),
          const SizedBox(height: 15),
            OtpTextField(
textStyle: TextStyle(color: fontcolor),
              fieldWidth: 50.0,
                borderRadius: BorderRadius.circular(20),
                numberOfFields: 5,
                borderColor:mainColor,
                //set to true to show as box or false to show as dash
                showFieldAsBox: true,
                //runs when a code is typed in
                onCodeChanged: (String code) {
                  //handle validation or checks here
                },
                //runs when every textfield is filled
                onSubmit: (String verificationCode) {
               Get.to( resetPassword() );
                }, // end onSubmit
              ),
          const SizedBox(height: 40),
        ]),
      ),
    );
  }
}
