
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:graduation_project/controller/controller.dart';
import 'package:graduation_project/core/services/colors.dart';
import '../reg&login_Screen (auth)/signIn.dart';
import 'settings.dart';
import 'Services_App_Screen/serviceScreen.dart';
import 'doctorDetailsOfProfile.dart';
import 'homeScreen.dart';


List screens = [
  homeScreen(),
  serviceScreen(),
  doctorDetailsOfProfile(),
  settingsDetailsScreen(),
];
final bool isRegistered = false;
File? _image;


class BNAVBAR extends StatelessWidget {

  getxController controller = Get.put(getxController());

  Widget build(BuildContext context) {
    return GetBuilder<getxController>(builder: (controller) {
      return Scaffold(
        extendBody: true,
        appBar: PreferredSize(
          child: AppBar(
            backgroundColor: mainColor,
            leading:   Row(
              children: [SizedBox(width: 10,),

                if (isRegistered == false)
                  Stack( fit: StackFit.passthrough,
                    children: [
                      CircleAvatar(child:IconButton(onPressed: () {
                        Get.to(SignInAsNurse());
                      }, icon:Icon(Icons.login_sharp) ),
                        backgroundColor: Colors.grey[300],) ,

                    ],
                  ),
                if (isRegistered && _image != null)
                  CircleAvatar(
                    backgroundImage: FileImage(_image!),
                  ),
              ],
            ),
            title: Center(
              child: Image(
                image: AssetImage("assets/images/logoWhite.png"),
                height: 60,
                color: Colors.grey[300],
              ),
            ),


          ),
          preferredSize: Size.fromHeight(70),
        ),


        // appBar:

       body: screens[controller.selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,

            backgroundColor: mainColor,
            selectedItemColor: Colors.black,
             unselectedItemColor: grayColor,
            // unselectedLabelStyle: TextStyle(color:grayColor),
            // showUnselectedLabels: true,

             currentIndex: controller!.selectedIndex,
            onTap: controller?.onItemTapped,

            items: [

              BottomNavigationBarItem(
                icon: Icon(Icons.home, size: 35,), label: 'home'.tr),
              BottomNavigationBarItem(
                  icon: Icon(Icons.medical_services, size: 33 ,), label: 'Services'.tr),
              BottomNavigationBarItem(
                 icon: Icon(Icons.flash_on, size: 33,), label: 'personal Page'.tr),
              BottomNavigationBarItem(
                  icon: Icon(Icons.arrow_circle_down_rounded, size: 33, ), label: 'About'.tr),

            ] ,),
      );
    });
  }
}



