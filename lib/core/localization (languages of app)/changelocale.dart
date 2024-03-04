import 'dart:ui';
import 'package:get/get.dart';
import 'package:graduation_project/core/services/services.dart';



class LocaleController extends GetxController{
  Locale? language ;
  SettingServices settingServices = Get.find();

  changeLanguage (String languageCode) async {
    Locale locale =  Locale(languageCode);
    settingServices.sharedPrefer?.setString("language", languageCode);
    Get.updateLocale(locale); }

void onInit(){ // method thats open his facilities when you open the app again...
  //   String? sharedPrefLanguage =settingServices.sharedPrefer?.getString("language") ;
if(language=="ar"){language =Locale("ar");}
else if(language=="en"){language =Locale("en");}
else{language =Locale(Get.deviceLocale!.languageCode); }
  super.onInit();
  }
}
LocaleController langController = Get.put(LocaleController());

