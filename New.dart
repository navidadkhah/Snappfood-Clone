import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:snappfood_app/Menu.dart';
import 'package:snappfood_app/main.dart';

tags(String name,String photo){
  return Container(
      margin: EdgeInsets.all(20.0),
      padding: EdgeInsets.all(0.0),
      alignment: Alignment.topRight,
      width: 600,
      height: 350,
      decoration: BoxDecoration(
        color: Colors.grey,
        border: Border.all(),
      ),
    child: Column(
     // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.network(photo,height: 200.0,width: 600.0,alignment: Alignment.topRight,),
        Text(name,textAlign: TextAlign.center,style: TextStyle(decoration: TextDecoration.underline,fontWeight: FontWeight.w900,fontSize: 22.0,color: Colors.black),),
     Padding(
         padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
             child:  Row(
       mainAxisAlignment: MainAxisAlignment.center,
       crossAxisAlignment: CrossAxisAlignment.center,
       children: [

               RaisedButton(
                 child: Text("سفارش مجدد",style: TextStyle(fontWeight:FontWeight.bold,color: Colors.white),),
                 onPressed: null,
                 shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0))
         ),
               Spacer(),
               RaisedButton(
                child: Text("مشاهده فاکتور",style: TextStyle(fontWeight:FontWeight.bold,color: Colors.white),),
                   onPressed: null,
                shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(50.0))
         )

       ],
     ),
     )
    
      ],
    )
  );
}
