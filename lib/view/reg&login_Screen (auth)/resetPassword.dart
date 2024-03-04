import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:graduation_project/core/services/colors.dart';
import 'package:graduation_project/view/reg&login_Screen%20(auth)/signIn.dart';

import '../widget/widgets screen (all widgets).dart';

class resetPassword extends StatefulWidget {

  State<resetPassword> createState() => _resetPasswordState();
}
ShowPasswordClass controller = Get.put(ShowPasswordClass());

class _resetPasswordState extends State<resetPassword> {
  var PasswordController1 = TextEditingController();
  var PasswordController2 = TextEditingController();
  bool isPassword = true ;

  var FormKey = GlobalKey<FormState>();
  Widget build(BuildContext context) {
    final isDark=Theme.of(context).brightness==Brightness.dark;
    dynamic fontcolor=isDark?Colors.white:Colors.black;
    return Scaffold(
      body: Form(key: FormKey,
        child: Padding(
          padding: const EdgeInsets.all(17.0),
          child: SingleChildScrollView( physics: BouncingScrollPhysics(),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 50.0,) ,
   WelcomeMessageInRegisterScreen(mainTitle: "Reset Password".tr ,
       welcomeMessage: "New Password ".tr  ,detailTitle: "Please Enter a New Password".tr),
                  SizedBox(height: 30.0,) ,
                  GetBuilder<ShowPasswordClass>(builder: (controller) {
                    return TextFormFieldScreen(
                        obsureText: controller.isshowPassword,
                        controller: PasswordController1,
                        keyboardType: TextInputType.name,
                        label: "Enter New Password".tr,
                        prefix: Icons.lock,
                        validator: (value) {
                          return ValidatorScreen(value!, 5, 90, "password");
                        },
                        suffixIcon:controller.isshowPassword?Icons
                            .visibility_outlined : Icons
                            .visibility_off_outlined,
                        onPressed:(){controller.showPassword();});
                  }),
                  SizedBox(height: 20.0,),
                  GetBuilder<ShowPasswordClass>(builder: (controller) {
                    return TextFormFieldScreen(
                        obsureText: controller.isshowPassword,
                        controller: PasswordController2,
                        keyboardType: TextInputType.name,
                        label: "Re Enter New Password".tr,
                        prefix: Icons.lock,
                        validator: (value) {
                          if (value != PasswordController1.text) {
                            return 'Passwords do not match';
                          }
                          return ValidatorScreen(value!, 5, 90, "password");

                        },
                        suffixIcon:controller.isshowPassword?Icons
                            .visibility_outlined : Icons
                            .visibility_off_outlined,
                        onPressed:(){controller.showPassword();});
                  }),

SizedBox(height: 20,),

                  TextButton(onPressed: () {

                    if (FormKey.currentState!.validate()) {
        // Submit the form and reset the password
        String newPassword = PasswordController1.text;
        // TODO: Implement the password reset logic
           Get.off(SignInAsNurse());
         }

     else {  Get.snackbar('The 2 passwords not the same ', colorText: Colors.white ,'Re Enter Your Password' , titleText: Text('The 2 passwords not the same' , style: TextStyle(fontSize: 22.0, color: Colors.white , fontWeight: FontWeight.bold),),
                    backgroundColor: mainColor, duration: Duration(seconds: 5),
                    padding: EdgeInsets.only(top: 20.0 , bottom: 40 ,left: 30 , right: 30.0  ) );}
   // else {print("not fdklfmsdlkvmalk mlsdk msdkl amdkl mlskd m") ;}


                  }, child: Container(width: double.infinity, height:50.0 ,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10) ,
                          color: mainColor ),
                      child: Row( mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.login_outlined , color: Colors.white),
                          SizedBox(width: 8.0,),
                          Text('Save'.tr,style: TextStyle(color: Colors.white , fontSize: 23 , fontWeight: FontWeight.bold),),
                        ],
                      ))),



                ]),
          ),
        ),
      ),



    );
  }
}
