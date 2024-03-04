//                   Container(
//                     height: 160,
//                     width: double.infinity,
//                     child: Column(
//                       children: [
//                         Row(
//                           children: [
//                             Expanded(
//                               child: Column(
//                                 children: [
//                                   myInkwell("All".tr, () {
//                                     controller.getAll();
//                                   }),
//                                   myInkwell("Location".tr, () {
//                                     controller.getLoc();
//                                   }),
//
//                                 ],
//                               ),
//                             ),
//                             Expanded(
//                               child: Column(
//                                 children: [
//
//                                       myInkwell("Price".tr, () {
//                                         controller.lowestPrice();
//                                       }),
//                                       myInkwell("Active".tr, () {
//                                         controller.getActive();
//                                       })
//                                 ],
//                               ),
//                             ),
//                             Expanded(
//                               child: Column(
//                                 children: [
//                                   myInkwell("Male".tr, () {
//                                     controller.getMale();
//                                   }),
//                                   myInkwell("Female".tr, () {
//                                     controller.getFemale();
//                                   }),
//                                 ],
//                               ),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//  //filters
//
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/controller/controller.dart';
import 'package:graduation_project/core/services/colors.dart';
import 'package:graduation_project/view/BNBar_Screens/Services_App_Screen/priceOfServent.dart';
import 'package:graduation_project/view/Doctor%20details.dart';

class Location extends StatelessWidget {
  getxController controller = Get.put(getxController());

  Widget build(BuildContext context) {
    return GetBuilder<getxController>(
      builder: (controller) {
        return Scaffold(
          body: Column(
            children: [
              SizedBox(
                height: 40,
              ),
              Container(
                height: 160,
                width: double.infinity,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              myInkwell("All".tr, () {
                                controller.getAll();
                              }),
                              myInkwell("Location".tr, () {
                                controller.getLoc();
                              }),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              myInkwell("Price".tr, () {
                                controller.lowestPrice();
                              }),
                              myInkwell("Active".tr, () {
                                controller.getActive();
                              })
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              myInkwell("Male".tr, () {
                                controller.getMale();
                              }),
                              myInkwell("Female".tr, () {
                                controller.getFemale();
                              }),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              //filters

              Center(
                child: Container(
                  height: 550,
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: controller.data.length,
                    itemBuilder: (context, i) {
                      return Container(
                        child: detailsOfPersona(
                          context,
                          controller.data[i]["image"],
                          controller.data[i]["name"],
                          controller.data[i]["adress"],
                          controller.data[i]["price"].toString(),
                          controller.data[i]["rate"].toString(),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget myInkwell(String text, VoidCallback onTab) {
    return InkWell(
      onTap: () {
        onTab();
      },
      child: Container(
          child: Center(
              child: Text(
            text,
            style: TextStyle(color: Colors.grey[200], fontSize: 20),
          )),
          width: 100.0,
          height: 50,
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Color(0xff026670),
            borderRadius: BorderRadius.circular(20),
          )),
    );
  }
}

Widget detailsOfPersona(
  BuildContext context,
  String image,
  String name,
  String location,
  String price,
  String rate,
) {
  final isDark = Theme.of(context).brightness == Brightness.dark;
  dynamic cardcolor = isDark ? Colors.black : grayColor;

  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      children: [
        Container(
          height: 510,
          decoration: BoxDecoration(
            gradient: SweepGradient(
              center: Alignment.centerLeft,
              colors: [cardcolor, mainColor],
            ),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 140,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Spacer(),
                  Center(
                    child: Stack(
                      alignment: AlignmentDirectional.center,
                      children: [
                        CircleAvatar(backgroundColor: mainColor, radius: 80),
                        CircleAvatar(backgroundColor: Colors.white, radius: 75),
                        CircleAvatar(
                          backgroundImage: NetworkImage(image), //pictures
                          radius: 72,
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                ],
              ),
              Column(
                children: [
                  Text(
                    (name),
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: mainColor,
                    ),
                  ),
                  SizedBox(height: 7),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Text(
                            "Location :".tr,
                            style: TextStyle(
                              fontSize: 18,
                              color: mainColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              "$location",
                              textAlign: TextAlign.center,
                              maxLines: 2,
                              style: TextStyle(
                                fontSize: 12,
                                color: mainColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 5,
                      ),
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
                        "${price}",
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
                        "${rate}",
                        style: TextStyle(
                          fontSize: 18,
                          color: mainColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Icon(Icons.star),
                    ],
                  ),
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
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          DoctorProfilePage()));
                            },
                            child: Text(
                              "show more".tr,
                              style: TextStyle(
                                  color: grayColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22),
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
                                    fontSize: 22),
                              )),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
      ],
    ),
  );
}
