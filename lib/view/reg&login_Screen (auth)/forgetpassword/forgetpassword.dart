
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/controller/auth/forgetpassword_controller.dart';
import 'package:graduation_project/core/services/colors.dart';
import 'package:graduation_project/view/reg&login_Screen%20(auth)/forgetpassword/verifycode.dart';

import '../../widget/auth/custombuttonauth.dart';
import '../../widget/auth/customtextbodyauth.dart';
import '../../widget/auth/customtextformauth.dart';
import '../../widget/auth/customtexttitleauth.dart';
import '../signIn.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ForgetPasswordControllerImp controller =
        Get.put(ForgetPasswordControllerImp());
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
        child: Form(
          key: controller.formstate,
          child: ListView(children: [
            const SizedBox(height: 20),
            CustomTextTitleAuth(text: "27".tr),
            const SizedBox(height: 30),
            CustomTextBodyAuth(
                // please Enter Your Email Address To Recive A verification code
                text: "29".tr),
            const SizedBox(height: 50),
            CustomTextFormAuth(
              isNumber: false,
              valid: (val) {},
              mycontroller: controller.email,
              hinttext: "12".tr,
              iconData: Icons.email_outlined,
              labeltext: "18".tr,
              // mycontroller: ,
            ),
            CustomButtomAuth(
                text: "30".tr,
                onPressed: () {

                    Get.to(VerfiyCode());

                }),
            const SizedBox(height: 40),
          ]),
        ),
      ),
    );
  }
}
