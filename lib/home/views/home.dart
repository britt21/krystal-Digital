import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:blurry_modal_progress_hud/blurry_modal_progress_hud.dart';
import 'package:krystal_digital/home/controller/blog_controller.dart';
import 'package:krystal_digital/home/model/BlogModel.dart';
import 'package:krystal_digital/home/profile_image.dart';
import 'package:krystal_digital/home/views/details.dart';
import 'package:krystal_digital/utils/widget/blog_items.dart';
import 'package:krystal_digital/utils/widget/build_card.dart';
import 'package:krystal_digital/utils/widget/utils.dart';
import '../../utils/theme.dart';
import '../../utils/widget/search_box.dart';
import '../../utils/widget/text_field.dart';
import 'package:share_plus/share_plus.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isLoading = true;
  List tabs = <Widget>[];
  List blogs = <Widget>[];
  List<BlogModel> allblogs = [];
  List<BlogModel> neulist = [];
  List<BlogModel> emptylist = [];

  BlogController blogController = BlogController();

  @override
  void initState() {
    blogController.getAlBlogs();
    tabs.add(buildCard("Labor party", true));
    tabs.add(buildCard("Lifestyle", false));
    tabs.add(buildCard("Comedy", false));
    tabs.add(buildCard("Crime", false));
    tabs.add(buildCard("Bitcoin", false));
    tabs.add(buildCard("Tech", false));

    getblogList();

    Future.delayed(Duration(milliseconds: 1500), () {
      setState(() {
        _isLoading = false;
      });
    });
    super.initState();
  }

  Future getblogList() async {
    var bloglist = await blogController.getAlBlogs();
    print("BANANA: ${bloglist}");
    if (bloglist.isNotEmpty) {
      setState(() {
        allblogs = bloglist;
        print("blogsgo!! ${allblogs}");
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => BlurryModalProgressHUD(
          progressIndicator: SpinKitDualRing(
            color: appPurple,
            // Set the color of the loading spinner to purple
            size: 100.0, // Set the size of the loading spinner
          ),
          inAsyncCall: blogController.isLoading.value,
          child: Scaffold(
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
                        if (value.length > 0) {
                          updateList(value);
                          // searchSuggestBox();
                        }
                      },
                    ),
                  ),
                  neulist.isEmpty ?

                  Padding(
                    padding: const EdgeInsets.only(top: 0.0, left: 20),
                    child: Text(
                      "Explore",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                          fontFamily: "Poppins"),
                    ),
                  ) : Container(
                      color: Colors.white,
                      height: 200, width: 400, child: searchSuggestBox(neulist)),
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
                      itemCount: allblogs.length,
                      itemBuilder: (BuildContext context, int index) {
                        print("HAPPYBLOGS ${allblogs}}");
                        return GestureDetector(
                          onTap: () {
                            Get.to(Details(title: allblogs[index].title,body: allblogs[index].body,));
                            print("BACKBLOG ${allblogs[index].id}");
                          },
                          child: blog_item(allblogs[index].title,
                              allblogs[index].body, () {}, () async {
                            await Share.share(
                                "${allblogs[index].title} \n ${allblogs[index].body}");
                          }),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }

  updateList(String val){
    if(val.length < 0 ){
      setState(() {
        neulist = emptylist;

      });
    }else{
      setState(() {
        neulist = allblogs.where((element) => element.title!.toLowerCase().contains(val.toString().toLowerCase())).toList();


      });
    }
  }
}
