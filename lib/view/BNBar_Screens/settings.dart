import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/core/localization%20(languages%20of%20app)/changelocale.dart';
import 'package:graduation_project/core/services/colors.dart';
import 'package:graduation_project/core/services/theme_servier.dart';
import 'all about BNAVBAR screens.dart';
import 'package:get/get.dart';

class MedicalSettingsPage extends StatefulWidget {
  @override

  _MedicalSettingsPageState createState() => _MedicalSettingsPageState();
}
class _MedicalSettingsPageState extends State<MedicalSettingsPage> {
  bool isDarkModeEnabled = false;
  bool isArabicLanguageSelected = false;
  String selectedCountry = '';
  String privacyPolicyUrl = '';

  void toggleDarkMode(bool value) {
    setState(() {
      isDarkModeEnabled = value;
    });
  }

  void toggleLanguage(bool value) {
    setState(() {
      isArabicLanguageSelected = value;
    });
  }

  void selectCountry(String country) {
    setState(() {
      selectedCountry = country;
    });
  }

  void openPrivacyPolicy() {
    // Add logic to open the privacy policy page
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    dynamic fontcolor = isDark ? Colors.white : Colors.black;
    return Scaffold(
      body: ListView(
        children: <Widget>[
          SizedBox(height: 20.0,),
          Center(child: Text('Settings'.tr , style: TextStyle(fontSize: 40 ,
              fontWeight: FontWeight.bold , fontFamily: "cairo" , color: mainColor))),

          ListTile(


            title: Text('mode'.tr,style: TextStyle(color: fontcolor),),
            trailing:
            IconButton(icon: Icon(Icons.brightness_2_outlined),
              onPressed: () {
                ThemeService().changeTheme();
              },
            ),


          ),          Divider(),
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(width: 15,),
          Text("Language".tr , style: TextStyle(color: fontcolor),
          ),
Spacer(),
          Row( mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(width: 95,
                child: MaterialButton( color: mainColor,
                    onPressed: () {
                      langController.changeLanguage("ar");
                      Get.to(BNAVBAR());
                    }, child: Text("Arabic".tr , style:
                    TextStyle( fontFamily: "cairo", fontSize: 18 ,color:grayColor ,fontWeight: FontWeight.bold, fontStyle:FontStyle.normal )
                    )),
              ),
              SizedBox(width: 10),
              Container(width: 105,
                child: MaterialButton( color: mainColor,onPressed: () {  langController.changeLanguage("en");
                Get.to(BNAVBAR());
                }, child: Text("English".tr , style:
                TextStyle( fontFamily: "cairo", fontSize: 17 ,color: grayColor ,fontWeight: FontWeight.bold, fontStyle:FontStyle.normal )
                )),
              ),
            ],
          ),


        ],
      ),
          Divider(),
          ListTile(
            title: Text('My profile '.tr , style: TextStyle(color: fontcolor)),
            onTap: () {

              // Add logic to navigate to the patient information page
            },
          ),
          Divider(),
          ListTile(
            title: Text('Privacy policy'.tr , style: TextStyle(color: fontcolor)),
            onTap: openPrivacyPolicy,
          ),
        ],
      ),
    );
  }
// Add other state variables and methods as needed
}
class settingsDetailsScreen extends StatelessWidget {

  Widget build(BuildContext context) {
    return Scaffold(body:  Container(height: double.maxFinite,child: MedicalSettingsPage()),);
  }
}


