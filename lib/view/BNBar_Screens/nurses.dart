import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
class nurses extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return
      Scaffold(
        body: ListView(
    children: [
      Container(decoration: BoxDecoration(color: Colors.grey,borderRadius: BorderRadius.circular(20)), margin:EdgeInsets.fromLTRB(10, 30, 10, 10),width: 100,height: 250,child:
         Expanded(child: Column(
           children: [
             Row(children: [SizedBox(width: 5,),
                CircleAvatar(backgroundImage:AssetImage("images/2.jpeg"),radius: 50),SizedBox(width: 15,),
                Column(children: [SizedBox(height:15,),
                  Text(("Mohamed Mahmod"),style: TextStyle(fontSize: 25,color:  Color(0xff19283f),fontWeight: FontWeight.bold),),
                  Text("Nurse at 6th district hospital",style: TextStyle(color:Color(0xff19283f)),),
           RatingBar.builder(
             initialRating: 4.5,
             minRating: 1,
             direction: Axis.horizontal,
             allowHalfRating: true,
             itemCount: 5,
             itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
             itemBuilder: (context, _) => Icon(
               Icons.star,
               color: Colors.amber,
             ),
             onRatingUpdate: (rating) {
               print(rating);
             },
           )


                  // Container(width:70,height:30,color: Colors.red,child: Text("book now",style: TextStyle(color: Colors.white),))


                ],)


      ]
                ,),
             SizedBox(height: 30,),
             Row(children: [
               Icon(Icons.location_on,color:Color(0xff19283f)),
               Text("6th of october city",style:TextStyle(color: Colors.white,fontSize: 20)),
               SizedBox(width: 50,),
               Container(decoration: BoxDecoration(color: Color(0xff19283f),borderRadius: BorderRadius.circular(20)),
                 height: 30,width: 90,child: Center(child: Text("Show More",style:TextStyle(color: Colors.white),)),)



             ],),
             SizedBox(height: 20,),
             Row(children: [
               Icon(Icons.price_change_rounded,color:Color(0xff19283f)),
               Text("100 \$",style:TextStyle(color: Colors.white,fontSize: 20)),
               SizedBox(width: 165,),
               Container(decoration: BoxDecoration(color: Color(0xff19283f),borderRadius: BorderRadius.circular(20)),
                 height: 30,width: 90,child: Center(child: Text("Book Now",style:TextStyle(color: Colors.white),)),)
             ],),





           ],
         ))
      )













      ,Container(decoration: BoxDecoration(color: Colors.grey,borderRadius: BorderRadius.circular(20)), margin:EdgeInsets.fromLTRB(10, 30, 10, 10),width: 100,height: 250,child:
      Expanded(child: Column(
        children: [
          Row(children: [SizedBox(width: 5,),
            CircleAvatar(backgroundImage:AssetImage("images/2.jpeg"),radius: 50),SizedBox(width: 15,),
            Column(children: [SizedBox(height:15,),
              Text(("Mohamed Mahmod"),style: TextStyle(fontSize: 25,color:  Color(0xff19283f),fontWeight: FontWeight.bold),),
              Text("Nurse at 6th district hospital",style: TextStyle(color:Color(0xff19283f)),),
              RatingBar.builder(
                initialRating: 4.5,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) => Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rating) {
                  print(rating);
                },
              )


              // Container(width:70,height:30,color: Colors.red,child: Text("book now",style: TextStyle(color: Colors.white),))


            ],)


          ]
            ,),
          SizedBox(height: 30,),
          Row(children: [
            Icon(Icons.location_on,color:Color(0xff19283f)),
            Text("6th of october city",style:TextStyle(color: Colors.white,fontSize: 20)),
            SizedBox(width: 50,),
            Container(decoration: BoxDecoration(color: Color(0xff19283f),borderRadius: BorderRadius.circular(20)),
              height: 30,width: 90,child: Center(child: Text("Show More",style:TextStyle(color: Colors.white),)),)



          ],),
          SizedBox(height: 20,),
          Row(children: [
            Icon(Icons.price_change_rounded,color:Color(0xff19283f)),
            Text("100 \$",style:TextStyle(color: Colors.white,fontSize: 20)),
            SizedBox(width: 165,),
            Container(decoration: BoxDecoration(color: Color(0xff19283f),borderRadius: BorderRadius.circular(20)),
              height: 30,width: 90,child: Center(child: Text("Book Now",style:TextStyle(color: Colors.white),)),)
          ],),





        ],
      ))
      )
















     , Container(decoration: BoxDecoration(color: Colors.grey,borderRadius: BorderRadius.circular(20)), margin:EdgeInsets.fromLTRB(10, 30, 10, 10),width: 100,height: 250,child:
      Expanded(child: Column(
        children: [
          Row(children: [SizedBox(width: 5,),
            CircleAvatar(backgroundImage:AssetImage("images/2.jpeg"),radius: 50),SizedBox(width: 15,),
            Column(children: [SizedBox(height:15,),
              Text(("Mohamed Mahmod"),style: TextStyle(fontSize: 25,color:  Color(0xff19283f),fontWeight: FontWeight.bold),),
              Text("Nurse at 6th district hospital",style: TextStyle(color:Color(0xff19283f)),),
              RatingBar.builder(
                initialRating: 4.5,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) => Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rating) {
                  print(rating);
                },
              )


              // Container(width:70,height:30,color: Colors.red,child: Text("book now",style: TextStyle(color: Colors.white),))


            ],)


          ]
            ,),
          SizedBox(height: 30,),
          Row(children: [
            Icon(Icons.location_on,color:Color(0xff19283f)),
            Text("6th of october city",style:TextStyle(color: Colors.white,fontSize: 20)),
            SizedBox(width: 50,),
            Container(decoration: BoxDecoration(color: Color(0xff19283f),borderRadius: BorderRadius.circular(20)),
              height: 30,width: 90,child: Center(child: Text("Show More",style:TextStyle(color: Colors.white),)),)



          ],),
          SizedBox(height: 20,),
          Row(children: [
            Icon(Icons.price_change_rounded,color:Color(0xff19283f)),
            Text("100 \$",style:TextStyle(color: Colors.white,fontSize: 20)),
            SizedBox(width: 165,),
            Container(decoration: BoxDecoration(color: Color(0xff19283f),borderRadius: BorderRadius.circular(20)),
              height: 30,width: 90,child: Center(child: Text("Book Now",style:TextStyle(color: Colors.white),)),)
          ],),





        ],
      ))
      )

















     , Container(decoration: BoxDecoration(color: Colors.grey,borderRadius: BorderRadius.circular(20)), margin:EdgeInsets.fromLTRB(10, 30, 10, 10),width: 100,height: 250,child:
      Expanded(child: Column(
        children: [
          Row(children: [SizedBox(width: 5,),
            CircleAvatar(backgroundImage:AssetImage("images/2.jpeg"),radius: 50),SizedBox(width: 15,),
            Column(children: [SizedBox(height:15,),
              Text(("Mohamed Mahmod"),style: TextStyle(fontSize: 25,color:  Color(0xff19283f),fontWeight: FontWeight.bold),),
              Text("Nurse at 6th district hospital",style: TextStyle(color:Color(0xff19283f)),),
              RatingBar.builder(
                initialRating: 4.5,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) => Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rating) {
                  print(rating);
                },
              )


              // Container(width:70,height:30,color: Colors.red,child: Text("book now",style: TextStyle(color: Colors.white),))


            ],)


          ]
            ,),
          SizedBox(height: 30,),
          Row(children: [
            Icon(Icons.location_on,color:Color(0xff19283f)),
            Text("6th of october city",style:TextStyle(color: Colors.white,fontSize: 20)),
            SizedBox(width: 50,),
            Container(decoration: BoxDecoration(color: Color(0xff19283f),borderRadius: BorderRadius.circular(20)),
              height: 30,width: 90,child: Center(child: Text("Show More",style:TextStyle(color: Colors.white),)),)



          ],),
          SizedBox(height: 20,),
          Row(children: [
            Icon(Icons.price_change_rounded,color:Color(0xff19283f)),
            Text("100 \$",style:TextStyle(color: Colors.white,fontSize: 20)),
            SizedBox(width: 165,),
            Container(decoration: BoxDecoration(color: Color(0xff19283f),borderRadius: BorderRadius.circular(20)),
              height: 30,width: 90,child: Center(child: Text("Book Now",style:TextStyle(color: Colors.white),)),)
          ],),





        ],
      ))
      )








    ]));}}