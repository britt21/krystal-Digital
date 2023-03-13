import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:blurry_modal_progress_hud/blurry_modal_progress_hud.dart';
import 'package:krystal_digital/home/profile_image.dart';
import 'package:krystal_digital/utils/build_card.dart';
import 'package:krystal_digital/utils/utils.dart';
import '../utils/text_field.dart';


class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isLoading = true;

  List tabs = <Widget>[];

  @override
  void initState() {
    tabs.add(buildCard("Labor party", true));
    tabs.add(buildCard("Lifestyle", false));
    tabs.add(buildCard("Comedy", false));
    tabs.add(buildCard("Crime", false));
    tabs.add(buildCard("Bitcoin", false));
    tabs.add(buildCard("Tech", false));


    Future.delayed(Duration(milliseconds: 1500), () {
      setState(() {
        _isLoading = false;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.all(16),
                  child: Container(
                    height: 45,
                    width: 45,
                    child: ProfileImage(
                      imageUrl: homeicon,
                      isLoading: _isLoading,
                    ),
                  ),
                ),
                Text(
                  "Welcome, ",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins',
                      fontSize: 14),
                ),
                Text(
                  "Anonymous",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins',
                      color: Colors.deepPurpleAccent.shade200,
                      fontSize: 19),
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.only(right: 5.0),
                  child: IconButton(
                    icon: Icon(Icons.notifications),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: LabelTextFormField(
                hintText: 'Search this blog',
                suffixIcon: const Icon(
                  Icons.search,
                  color: Colors.deepPurple,
                ),
                onChanged: (value) {
                  if (value.length > 2) {}
                },
                validator: (value) {},
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 0.0, left: 20),
              child: Text(
                "Explore",
                style: TextStyle(
                    color: Colors.black, fontSize: 25, fontFamily: "Poppins"),
              ),
            ),
            Container(
              width: 100,
              height: 70,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: tabs.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                    onTap: (){
                      print("${tabs[index]}");
                      },
                    child:  tabs[index]
                    );
                  },
                )
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15.0,left: 15,right: 15),
              child: Container(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            "Peter obi wins 2023 Presidential Election reaching us form Arise News",
                            style: TextStyle(
                              fontSize: 20,
                              fontFamily: "Poppins",
                            ),
                            overflow: TextOverflow.visible,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 12,),
                    Expanded(
                      child: Text(
                        "they are or do repels provide blacked out except the option criticize",
                        style: TextStyle(
                          fontWeight: FontWeight.w400
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ),

                  ],
                ),
                height: 150,
                width: MediaQuery.of(context).size.width,
              ),
            ),
     Padding(
              padding: const EdgeInsets.only(top: 15.0,left: 15,right: 15),
              child: Container(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            "Peter obi wins 2023 Presidential Election reaching us form Arise News",
                            style: TextStyle(
                              fontSize: 20,
                              fontFamily: "Poppins",
                            ),
                            overflow: TextOverflow.visible,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 12,),
                    Expanded(
                      child: Text(
                        "they are or do repels provide blacked out except the option criticize",
                        style: TextStyle(
                          fontWeight: FontWeight.w400
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ),

                  ],
                ),
                height: 150,
                width: MediaQuery.of(context).size.width,
              ),
            )

          ],
        ),
      ),
    );
  }
}
