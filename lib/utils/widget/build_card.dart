import 'package:flutter/material.dart';

Widget buildCard(title,bool hasBorder){
  if(hasBorder){

 return Padding(
   padding: const EdgeInsets.only(left: 8.0,right: 8),
   child: Container(

      child: Center(child: Text(title,style: TextStyle(color: Colors.white,fontFamily: "Poppins"),)),
      width: 150,
      height: 30,
      decoration: BoxDecoration(
          color: Colors.deepPurpleAccent.shade100,
          borderRadius: BorderRadius.circular(20)
      )
   ),
 );
 }else{
    return Padding(
      padding: const EdgeInsets.only(left: 8.0,right: 8),
      child: Container(

          child: Center(child: Text(title,style: TextStyle(color: Colors.black,fontFamily: "Poppins"),)),
          width: 150,
          height: 30,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            border: Border.all(width: 1,color: Colors.black26)
          )
      ),
    );
  }
}

