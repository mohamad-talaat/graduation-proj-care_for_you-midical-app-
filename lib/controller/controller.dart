import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
class getxController extends GetxController{
 bool isshowPassword=true ;
 String locationField="";
 showPassword(){
  // isshowPassword = isshowPassword == true ? false : true;
isshowPassword!= isshowPassword;
  update(); }
  int selectedIndex = 0; //New
  void onItemTapped(int index) {
      selectedIndex = index;
  update();
  }
 bool darkMode = false ;
 void isDark(){
   darkMode =! darkMode ;
   update();
 }
 late List data = [];
 double lat = 0;
 double lang = 0;
 Future<void> getAll() async {
   if (data.isNotEmpty) data.clear();

   QuerySnapshot querySnapshot =
   await FirebaseFirestore.instance.collection("provider").get();
   querySnapshot.docs.forEach((doc) {
     data.add(doc.data());
     update();   });
 }
 Future<void> highestSpeed() async {
   if (data.isNotEmpty) {
     data.clear();
   }

   QuerySnapshot querySnapshot = await FirebaseFirestore.instance
       .collection("provider")
       .orderBy("speed")
       .get();
   querySnapshot.docs.forEach((doc) {
     data.add(doc.data());
     update();   });
 }
 Future<void> lowestPrice() async {
   if (data.isNotEmpty) {
     data.clear();
   }

   QuerySnapshot querySnapshot = await FirebaseFirestore.instance
       .collection("provider")
       .orderBy("price")
       .get();
   querySnapshot.docs.forEach((doc) {
     data.add(doc.data());
     update();   });
 }
 Future<void> getMale() async {
   if (data.isNotEmpty) {
     data.clear();
   }

   QuerySnapshot querySnapshot = await FirebaseFirestore.instance
       .collection("provider")
       .where("gender", isEqualTo: "1")
       .get();
   querySnapshot.docs.forEach((doc) {
     data.add(doc.data());
     update();   });
 }
 Future<void> getFemale() async {
   if (data.isNotEmpty) data.clear();

   QuerySnapshot querySnapshot = await FirebaseFirestore.instance
       .collection("provider")
       .where("gender", isEqualTo: "0")
       .get();
   querySnapshot.docs.forEach((doc) {
     data.add(doc.data());
     update();   });
 }
 void highestRate() {
   data.sort((a, b) => a['rate'].compareTo(b['rate']));
   data.reversed;
   update(); }
 Future<void> getActive() async {
   if (data.isNotEmpty) data.clear();

   QuerySnapshot querySnapshot = await FirebaseFirestore.instance
       .collection("provider")
       .where('status', isEqualTo: "1")
       .get();
   querySnapshot.docs.forEach((doc) {
     data.add(doc.data());
     update();   });
 }
 Future<void> getLocation() async {
   bool service;

   LocationPermission per;

   service = await Geolocator.isLocationServiceEnabled();

   if (!service) {
     // return Future.error('Location permissions are denied');
   }
   per = await Geolocator.checkPermission();
   if (per == LocationPermission.denied) {
     per = await Geolocator.requestPermission();

     if (per == LocationPermission.denied) {
       return Future.error('Location permissions are denied');
     }
   }

   if (per == LocationPermission.deniedForever) {
     // Permissions are denied forever, handle appropriately.
     return Future.error(
         'Location permissions are permanently denied, we cannot request permissions.');
   }

   Position s = await Geolocator.getCurrentPosition(
       desiredAccuracy: LocationAccuracy.high)
       .then((value) => value);
   lat = s.latitude;
   lang = s.longitude;
   print('---------------------------');
   print(lat);
 }
 Future<double> distanceFrom(double latitude, double langitude) async {
   double distanceInMeters =
   await Geolocator.distanceBetween(latitude, langitude, lat, lang);
   return distanceInMeters / 1000;
 }
 Future<void> getLoc() async {

   getLocation().then((_){
     getLocationHelper().then((value) async {
       for (int i = 0; i < value.length; i++) {
         double distance = await distanceFrom(value[i]["lat"], value[i]["lang"]);
         value[i]["distance"] = distance;
       }
       value.sort((a, b) => a["distance"].compareTo(b["distance"]));
       data=List.from(value);
       update();     });});






 }
 Future<List<dynamic>> getLocationHelper() async {

   late List<dynamic> distances=[];

   QuerySnapshot querySnapshot =
   await FirebaseFirestore.instance.collection("provider").get();
   querySnapshot.docs.forEach((doc) {
     distances.add(doc.data());

   });
   return distances;
 }
 Future<String> getAddressFromLatLng() async {
   final List<Placemark> placemarks =
   await placemarkFromCoordinates(lat, lang);
   if (placemarks != null && placemarks.isNotEmpty) {
     final Placemark pos = placemarks[0];
     return ' ${pos.subThoroughfare} ${pos.thoroughfare}, ${pos.locality}, ${pos.subAdministrativeArea} , ${pos.administrativeArea},${pos.country}';



   }
   return "";
 }
 Future<void> getAddress()async{
   getLocation().then((_) async {

     locationField= await getAddressFromLatLng();

   }

   );




 }

}
 getxController controller = Get.put(getxController());
 final FController = Get.find<getxController>();

