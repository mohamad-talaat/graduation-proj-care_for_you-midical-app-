import 'dart:convert';

import 'package:graduation_project/core/services/colors.dart';
import 'package:graduation_project/view/reg&login_Screen%20(auth)/signUp.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../BNBar_Screens/all about BNAVBAR screens.dart';
import '../widget/widgets screen (all widgets).dart';
import 'forgetpassword/forgetpassword.dart';


class SignInAsNurse extends StatefulWidget {
  @override
  State<SignInAsNurse> createState() => _SignInState();
}

class _SignInState extends State<SignInAsNurse> {
  ShowPasswordClass controller = Get.put(ShowPasswordClass());

  Widget build(BuildContext context) {
    final FormKey = GlobalKey<FormState>();
    final isDark=Theme.of(context).brightness==Brightness.dark;
    dynamic fontcolor=isDark?grayColor:mainColor;
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    bool _isLoading = false;

    Future<void> _login() async {
      setState(() {
        _isLoading = true;
      });

      final url = Uri.parse('https://care-for-you-v1.000webhostapp.com/api/auth/login?');
      final response = await http.post(
        url,
        body: {
          'email': emailController.text.trim(),
          'password': passwordController.text.trim(),
        },
      );

      final responseData = json.decode(response.body);

      setState(() {
        _isLoading = false;
      });

      if (response.statusCode == 200) {  // Login successful
        // Save user data or token and navigate to the next screen
        print('Login successful!');
        var jsonResponse = jsonDecode(response.body);
        var token = jsonResponse['token'];
        Get.to(BNAVBAR());

      } else {  // Login failed
        final error = json.decode(response.body)['error'];
        final snackBar = SnackBar(
          content: Text(responseData['message'] ?? 'An error occurred.'),
          backgroundColor: Colors.red,
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    }

    return Scaffold(    appBar: PreferredSize(child:AppBar
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


    ),
        preferredSize: Size.fromHeight(70)),
      body:Container(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
        child: Form(
          key: FormKey,
          child: ListView(children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(child: Text("Care For You" , style: TextStyle(fontSize: 30 , fontWeight: FontWeight.bold,color: fontcolor ),)),
                SizedBox(height: 15,),
                Center(child: Text("Sign in".tr ,  style: TextStyle(fontSize: 28 , fontWeight: FontWeight.bold ,color: fontcolor),)),
                SizedBox(height: 15,),
                Center(child: Text("Nursing , Care , Help".tr , style: TextStyle(fontSize: 18 , fontWeight: FontWeight.w400 ,color: fontcolor ),)),
                SizedBox(height: 30,),
                // Row( mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     Text("Sign as a" , style: TextStyle(fontSize: 33 , fontWeight: FontWeight.bold , ),),
                //     Text(" Nusre" ,  style: TextStyle(fontSize: 33 , fontWeight: FontWeight.bold , color: mainColor),),
                //   ],
                // ),
              ],
            ),

            SizedBox(height: 30.0,),
            TextFormFieldScreen(controller: emailController,
              keyboardType: TextInputType.emailAddress, label:"Enter Your Email ".tr,
              prefix: Icons.email, validator: (value) { return
                ValidatorScreen(value!, 5, 90, "emailController");
              },),
            SizedBox(height: 20.0,),
            GetBuilder<ShowPasswordClass>(builder: (controller) {
              return TextFormFieldScreen(
                  obsureText: controller.isshowPassword,
                  controller: passwordController,
                  keyboardType: TextInputType.name,
                  label: "Enter Your Password".tr,
                  prefix: Icons.lock,
                  validator: (value) {
                    return ValidatorScreen(value!, 6, 90, "password");
                  },
                  suffixIcon:controller.isshowPassword?Icons
                      .visibility_outlined : Icons
                      .visibility_off_outlined,
                  onPressed:(){controller.showPassword();});
            }),
            Row(mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(child: Text(
                  'Forget Password?'.tr ,
                  style: TextStyle(fontSize: 15 , color: Colors.cyan),),onPressed: () {
                  Get.to(ForgetPassword());
                },),],),
            MaterialButtonScreen(titleOfButton: "LOGIN".tr,Icons: Icons.login_outlined , fontSize: 25 ,
              colorOfButton: mainColor,
              onPressed: () async {
                if (FormKey.currentState!.validate()) {
                  _login();}},),
            //await Future.delayed(Duration(seconds: 2));
            // final _email = emailController.text;
            //          final _password = passwordController.text;
            //          final success = await login(_email, _password);
            //          if (success) {
            //    Get.to(BNAVBAR());
            //          }  }
            //          else {
            //            ScaffoldMessenger.of(context).showSnackBar(
            //              SnackBar(content: Text('Invalid username or password')));}
            //
            //
            //        }
            //        ) ,


            SizedBox(height: 10,),
            Row(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Don\'t have any accout?".tr,style: TextStyle(color: fontcolor)),
                TextButton(child:Text("Sign Up".tr , style: TextStyle(color: fontcolor , fontWeight: FontWeight.bold ,     fontSize: 20 ,
                ),textAlign: TextAlign.end, ), onPressed: () {
                  Get.to(SignUpAsNurse());
                },),
              ],)
          ]),
        ),
      ),
    );
  }
}


Future<bool> login(String username, String password) async {
  final response = await http.post(
    Uri.parse("https://care-for-you-v1.000webhostapp.com/api/auth/login"),
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode({'email': username, 'password': password}),
  );
  if (response.statusCode == 200) {
    // Check if the login was successful

    final data = jsonDecode(response.body);
    return data['success'] == true;
  } else {
    // If the server did not return a success status code, throw an exception
    throw Exception('Failed to log in');
  }
}
