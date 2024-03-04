import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/core/localization%20(languages%20of%20app)/change%20language%20by%20device%20lang.dart';
import 'package:graduation_project/core/localization%20(languages%20of%20app)/changelocale.dart';
import 'package:graduation_project/core/services/services.dart';
import 'package:graduation_project/core/services/theme_servier.dart';
import 'package:graduation_project/view/BNBar_Screens/all%20about%20BNAVBAR%20screens.dart';
import 'package:get/get.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
//await Firebase.initializeApp();
  await intialServices(); //// shared pref.
  runApp(MyApp());
}

// void initializeIndex() {
//   index =controller.data.length;
// }
class MyApp extends StatelessWidget {
  SettingServices settingServices = Get.put(SettingServices());
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        home: BNAVBAR(),
        locale: langController.language, //return the language device
        //locale: cont.intialLanguage,  //return the language device
        translations: mylocale(),
        theme: ThemeService().lightTheme,
        darkTheme: ThemeService().darkTheme,
        themeMode: ThemeService().getThemeMode());
  }
}
