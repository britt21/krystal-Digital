import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

Widget blog_item(title, body, VoidCallback Onclickbookmark,OnclickShare) {


  return Padding(
    padding: const EdgeInsets.only(top: 15.0, left: 15, right: 15),
    child: Container(
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  title,
                  style: TextStyle(
                    color:  Colors.black,
                    fontSize: 20,
                    fontFamily: "Poppins",
                  ),
                  overflow: TextOverflow.visible,
                ),
              ),
            ],
          ),



          Row(
            children: [
              Expanded(
                child: Text(
                  body,
                  style: TextStyle(fontWeight: FontWeight.w400,color: Colors.black),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  softWrap: true,
                ),
              ),
              IconButton(
                  onPressed: Onclickbookmark,
                  icon: Icon(Icons.bookmark_add)),
              IconButton(
                  onPressed: OnclickShare,
                  icon: Icon(Icons.share))
            ],
          ),
        ],
      ),
    ),
  );
}
