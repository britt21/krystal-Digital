import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:blurry_modal_progress_hud/blurry_modal_progress_hud.dart';
import 'package:krystal_digital/home/profile_image.dart';
import 'package:krystal_digital/utils/widget/blog_items.dart';
import 'package:krystal_digital/utils/widget/build_card.dart';
import 'package:krystal_digital/utils/widget/utils.dart';
import '../utils/widget/text_field.dart';
import 'package:share_plus/share_plus.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isLoading = true;

  List tabs = <Widget>[];
  List blogs = <Widget>[];

  @override
  void initState() {
    tabs.add(buildCard("Labor party", true));
    tabs.add(buildCard("Lifestyle", false));
    tabs.add(buildCard("Comedy", false));
    tabs.add(buildCard("Crime", false));
    tabs.add(buildCard("Bitcoin", false));
    tabs.add(buildCard("Tech", false));

    blogs.add(blog_item("Peter obi wins 2023 Presidential Election reaching us form Arise News",
        "they are or do repels provide blacked out except the option criticize",
            () {
      print("BLACKBOB");
    }, (){
      Share.share("they are or do repels provide blacked out except the option criticize");
    }));
    blogs.add(blog_item("Peter obi wins 2023 Presidential Election reaching us form Arise News",
        "they are or do repels provide blacked out except the option criticize",
            () {
      print("BLACKBOB");
    }, (){
      Share.share("they are or do repels provide blacked out except the option criticize");
    }));

    blogs.add(blog_item("Peter obi wins 2023 Presidential Election reaching us form Arise News",
        "they are or do repels provide blacked out except the option criticize",
            () {
      print("BLACKBOB");
    }, (){
      Share.share("they are or do repels provide blacked out except the option criticize");
    }));
    blogs.add(blog_item("Peter obi wins 2023 Presidential Election reaching us form Arise News",
        "they are or do repels provide blacked out except the option criticize",
            () {
      print("BLACKBOB");
    }, (){
      Share.share("they are or do repels provide blacked out except the option criticize");
    }));

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
                const Text(
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
                          onTap: () {
                            print("${tabs[index]}");
                          },
                          child: tabs[index]);
                    },
                  )),
            ),
            Container(
              width: 300,
              height: 550,
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: blogs.length,
                itemBuilder: (BuildContext context, int index) {
                  return blogs[index];
                },
              ),
            ),

          ],
        ),
      ),
    );
  }
}
