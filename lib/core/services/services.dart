
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';
import 'package:shared_preferences/shared_preferences.dart';

SharedPreferences? sharedPrefer;
class SettingServices extends GetxService{
  SharedPreferences? sharedPrefer;
  Future<SettingServices> init() async {
    sharedPrefer = await SharedPreferences.getInstance();
    return this ; // because of the error , but not usefull
  }

}

intialServices() {
  Get.putAsync(()=>SettingServices().init());

}
