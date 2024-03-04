import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class priceOfServant extends StatelessWidget {
  const priceOfServant({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

body:SingleChildScrollView(
  child:   Column(
      //mainAxisAlignment: MainAxisAlignment.center,
      children: [
    Padding(
      padding: const EdgeInsets.only(right: 40 , left: 10),
      child: Column(
        children: [
          SizedBox(height: 100,),
  Row( textBaseline: TextBaseline.alphabetic,
    children: [
    Text('Service Price:', style: TextStyle(color:Colors.black87 ,fontWeight: FontWeight.bold , fontSize: 30),),
          Spacer(),
          Text("2.4 \$", style: TextStyle(color:Colors.lightGreen[300] ,fontWeight: FontWeight.bold , fontSize: 25),),],),
            SizedBox(height: 30,),
            Row(children: [Text("Fees: ", style: TextStyle(color:Colors.black87 ,fontWeight: FontWeight.bold , fontSize: 30),),   Spacer(),
              Text("2 \$", style: TextStyle(color:Colors.lightGreen[300] ,fontWeight: FontWeight.bold , fontSize: 25),),],),
            SizedBox(height: 30,),
            Center(child: Text("----------------------------------------------------------------" , maxLines: 1 , overflow: TextOverflow.ellipsis,)),
          SizedBox(height: 10,),
            Row(children: [Text("Total Budget", style: TextStyle(color:Colors.black87 ,fontWeight: FontWeight.bold , fontSize: 30),),   Spacer(),
              Text("4.4 \$", style: TextStyle(color:Colors.lightGreen[300] ,fontWeight: FontWeight.bold , fontSize: 25),),],),
  SizedBox(height: 50,),
        ],
      ),
    ),
        Padding(
          padding: const EdgeInsets.only(left: 10 , right: 25),
          child: Column( children: [
            Stack(
              children: [
                Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(8) ,
                  color: Colors.grey[400],),
                  height: 80 ,width: double.infinity,),

                Center( heightFactor: 2,
                  child:TextField(
                    style:TextStyle(color: Colors.cyan  ,fontSize: 22 ,fontWeight: FontWeight.bold ),

                    decoration: InputDecoration( contentPadding: EdgeInsets.only(left: 20 , bottom: 15),
                      hintText: 'Enter your Full Name',

                      border: InputBorder.none,
                    ),
                  ),
                )
              ],
            ) ,
            SizedBox(height: 10,) ,
          ],),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10 , right: 25),
          child: Column( children: [
            Stack(
              children: [
                Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(8) ,
                  color: Colors.grey[400],),
                  height: 80 ,width: double.infinity,),

                Center( heightFactor: 2,
                  child:TextField(
                    style:TextStyle(color: Colors.cyan  ,fontSize: 22 ,fontWeight: FontWeight.bold ),

                    decoration: InputDecoration( contentPadding: EdgeInsets.only(left: 20 , bottom: 15),
                      hintText: 'Enter your Cridit Card',

                      border: InputBorder.none,
                    ),
                  ),
                )
              ],
            ) ,
            SizedBox(height: 15,) ,
          ],),
        ),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: MaterialButton(onPressed: (){} ,
              child: Container(width:double.infinity , height:50.0 ,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10) , color: Colors.black87 ),
                  child: Row( mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Submit',style: TextStyle(color: Colors.white , fontSize: 25 , fontWeight: FontWeight.bold),),
                    ],
                  )
              )),
        )


      ]),
)  );

  }
}
