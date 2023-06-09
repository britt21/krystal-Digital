import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:krystal_digital/home/views/details.dart';

import '../../home/model/BlogModel.dart';

Widget searchBox(){

  return Container(
    height: 50,
    child: TextField(
      onChanged: (value){
        // searchlist(value)
      },
      decoration: InputDecoration(

        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        hintText: "Search this blog",
          suffixIcon: Icon(Icons.search)
      ),
    ),
  );
}

Widget searchSuggestBox(List<BlogModel> blogmodel){
  return Padding(
    padding: const EdgeInsets.all(10),
    child: ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: blogmodel.length,
      itemBuilder: (BuildContext context, int index) {
      return Container(
        height: 70,
        width: 500,
        child: ListTile(
          title: GestureDetector(
            onTap: (){
              Get.to(Details(title: blogmodel[index].title, body: blogmodel[index].body));
            },
            child: Text(
              "${blogmodel[index].title}",style: TextStyle(color: Colors.black,
            fontFamily: "Poppins"),),
          ),

        ),
        color: Colors.white,
      );
    },),
  );
}