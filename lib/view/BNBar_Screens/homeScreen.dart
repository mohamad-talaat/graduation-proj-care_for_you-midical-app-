import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/core/services/colors.dart';
import 'package:graduation_project/view/Doctor%20details.dart';
import '../widget/widgets screen (all widgets).dart';
import 'Services_App_Screen/priceOfServent.dart';
import 'package:url_launcher/url_launcher.dart';

class homeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<homeScreen> {
  int currentIndex = 0;
  List<String> names = [
    "Eslam Elmahallawy",
    "Ahmed Elmahallawy",
    "Adam Smith",
    "Emily Johnson"
  ];
  List<String> locations = [
    "New York, USA",
    "London, UK",
    "Paris, France",
    "Sydney, Australia"
  ];
  List<double> prices = [25.0, 30.0, 20.0, 40.0];
  List<double> ratings = [4.5, 3.5, 5.0, 4.0];
  List<String> images = [
    "assets/images/avatar3.png",
    "assets/images/avatar4.jpg",
    "assets/images/avatar.jpg",
    "assets/images/avatar2.jpg"
  ];

  @override
  Widget build(BuildContext context) {
    final isDark=Theme.of(context).brightness==Brightness.dark;
    dynamic cardcolor=isDark?Colors.black:grayColor;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 2),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.zero,
                ),
                width: double.infinity,
                child: Column(
                  children: [
                    Image(image: AssetImage("assets/images/logoHome.png"), fit: BoxFit.fill),
                    SizedBox(height: 20),
                    Center(
                      child: Text(
                        "Love Your Soul".tr,
                        style: TextStyle(
                          fontSize: 22.0,
                          fontFamily: "cairo",
                          color: mainColor,
                        ),
                      ),
                    ),
                    SizedBox(height: 2),
                    Text(
                      "we pour love and care in every patient".tr,
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      style: TextStyle(
                        fontSize: 28.0,
                        fontFamily: "cairo",
                        color: mainColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.arrow_right_alt, size: 30, color: mainColor),
                        Text(
                          "we make you never lose hope".tr,
                          style: TextStyle(
                            fontSize: 20.0,
                            fontFamily: "cairo",
                            color: mainColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
            ),
            SizedBox(height: 30),
            Text(
              "Top Ordered ".tr,
              style: TextStyle(
                fontSize: 40.0,
                fontFamily: "cairo",
                color: Colors.yellow[600],
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Column(
                children: [
                  Container(
                    height: 500,
                    decoration: BoxDecoration(
                      gradient: SweepGradient(
                        center: Alignment.centerLeft,
                        colors: [cardcolor, mainColor],
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: 140),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  currentIndex = currentIndex == 0 ? 3 : currentIndex - 1;
                                });
                              },
                              icon: Icon(Icons.arrow_back_ios, size: 50, color: mainColor),
                            ),
                            Spacer(),
                            Center(
                              child: Stack(
                                alignment: AlignmentDirectional.center,
                                children: [
                                  CircleAvatar(backgroundColor: mainColor, radius: 80),
                                  CircleAvatar(backgroundColor: Colors.white, radius: 75),
                                  CircleAvatar(
                                    backgroundImage: AssetImage("${images[currentIndex]}"),
                                    radius: 72,
                                  ),
                                ],
                              ),
                            ),
                            Spacer(),
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  currentIndex = currentIndex == 3 ? 0 : currentIndex + 1;
                                });
                              },
                              icon: Icon(Icons.arrow_forward_ios, size: 50, color: mainColor),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              names[currentIndex],
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: mainColor,
                              ),
                            ),
                            SizedBox(height: 7),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Location : ".tr,
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: mainColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "${locations[currentIndex]}",
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: mainColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(width: 5),
                                Icon(Icons.location_history),
                              ],
                            ),
                            SizedBox(height: 5),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Price : ".tr,
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: mainColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "${prices[currentIndex]}",
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: mainColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Icon(Icons.attach_money),
                              ],
                            ),
                            SizedBox(width: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Rate : ".tr,
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: mainColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "${ratings[currentIndex]}",
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: mainColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Icon(Icons.star),
                              ],
                            ),
                            SizedBox(height: 20),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16.0),
                              child: Row(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      color: mainColor,
                                    ),
                                    height: 40,
                                    width: 150,
                                    child: MaterialButton(
                                      onPressed: () {Get.to(DoctorProfilePage());},
                                      child: Text(
                                        "show more".tr,
                                        style: TextStyle(
                                          color: grayColor,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Spacer(),
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      color: mainColor,
                                    ),
                                    height: 40,
                                    width: 150,
                                    child: MaterialButton(
                                      onPressed: () {
                                        Get.to(priceOfServant());
                                      },
                                      child: Text(
                                        "order".tr,
                                        style: TextStyle(
                                          color: grayColor,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 22,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 40),
            Container(
              height: 160,
              width: double.infinity,
              child: Column(mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            Text(
                              "500+ ",
                              style: TextStyle(
                                fontSize: 25.0,
                                fontFamily: "cairo",
                                color: mainColor,
                                fontWeight: FontWeight.bold,

                              ),
                            ),
                            Text(
                              " patient every day ".tr,
                              style: TextStyle(
                                fontSize: 18.0,
                                fontFamily: "cairo",
                                color: mainColor,
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              "100+ ",
                              style: TextStyle(
                                fontSize: 25.0,
                                fontFamily: "cairo",
                                color: mainColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              " Experience Nurses ".tr,
                              style: TextStyle(
                                fontSize: 18.0,
                                fontFamily: "cairo",
                                color: mainColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Text(
                              "2000+ ",
                              style: TextStyle(
                                fontSize: 25.0,
                                fontFamily: "cairo",
                                color: mainColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              " Patient Capacity ".tr,
                              style: TextStyle(
                                fontSize: 18.0,
                                fontFamily: "cairo",
                                color: mainColor,
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              "500+ ",
                              style: TextStyle(
                                fontSize: 25.0,
                                fontFamily: "cairo",
                                color: mainColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              " Years Experience ".tr,
                              style: TextStyle(
                                fontSize: 18.0,
                                fontFamily: "cairo",
                                color: mainColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.zero),
                color: mainColor,
              ),
              height: 200,
              width: double.infinity,
              child: Column(
                children: [
                  Image(
                    image: AssetImage("assets/images/logoWhite.png"),
                    height: 60,
                    color: Colors.grey[300],
                  ),
                  SizedBox(height: 5),
                  Text(
                    "Our job is to make you comfortable and save your life".tr,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 15.0,
                      fontFamily: "cairo",
                      color: Colors.grey[300],
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20),
                  socialMediaAccountWebsite()           ],
              ),
            ),
            SizedBox(height: 40),
          ],
        ),
      ),
    );
  }


}
