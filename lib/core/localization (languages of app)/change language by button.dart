import 'dart:ui';
import 'package:get/get.dart';
import '../services/services.dart';

class buttonLanguageChange extends GetxController{
Locale intialLanguage = sharedPrefer?.getString('language') == 'ar'? Locale('ar'):Locale('en' );
   void changeLanguage (String _languageCode){
     Locale _locale =  Locale(_languageCode);
     sharedPrefer!.setString('language', _languageCode);
     Get.updateLocale(_locale); }}

// in main class 
    buttonLanguageChange cont = Get.put(buttonLanguageChange());


// in main method
  // locale: Get.deviceLocale, //return the language device
  //    locale: cont.intialLanguage,  //return the language device
  //     translations: mylocale(), // return the class of translation // the initial language
