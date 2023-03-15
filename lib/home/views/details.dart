import 'package:flutter/material.dart';

class Details extends StatefulWidget {

  final title;
  final body;


  Details({required this.title, required this.body});

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SafeArea(child:
            Column( children: [
      Row(
        children: [
          Padding(
            padding: EdgeInsets.all(16),
            child: Container(
              height: 45,
              width: 45,
              child: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: (){
                  Navigator.pop(context);
                },
              )
              ),
            ),
          const Text(
            "Details",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: 'Poppins',
                fontSize: 17),
          ),

        ],
      ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0,top: 10,right: 20),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(widget.title,style: TextStyle(
                        fontSize: 22,fontFamily: "Poppins",color: Colors.black
                      ),),
                    )
                  ],
                ),
              ),

              Container(
                height: 400,
                  width: MediaQuery.of(context).size.width,
                  child: ListView(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Text(widget.body,style: TextStyle(
                              fontSize: 18,color: Colors.black
                          ),),
                        ),
                      )
                    ],
                  ))
    ],
      )
      ),
      );
  }
}
