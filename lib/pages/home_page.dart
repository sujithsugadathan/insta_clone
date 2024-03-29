import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart' as http;
import 'package:insta/pages/Comments.dart';
import 'package:insta/provider/CommentProvider.dart';
import 'package:insta/theme/colors.dart';
import 'package:insta/util/commentmodel.dart';
import 'package:insta/util/constant.dart';
import 'package:insta/util/new_feed_json.dart';
import 'package:insta/util/story_json.dart';
import 'package:provider/provider.dart';

import 'chat_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String firstHalf;
  String secondHalf;

  bool flag = true;

  int index = 0;

  @override
  Widget build(BuildContext context) {
    fetchProducts();
    var size = MediaQuery.of(context).size;
    return Consumer<CommentProvider>(
        builder: (context, commentProvider, child) {
      return Scaffold(
        appBar: getAppBar(),
        body: getBody(size, commentProvider),
      );
    });
  }

  Widget getAppBar() {
    return PreferredSize(
      preferredSize: Size.fromHeight(55),
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SvgPicture.asset("assets/images/logo.svg", width: 90),
              IconButton(
                  splashRadius: 15,
                  icon: Icon(FontAwesome5Brands.facebook_messenger),
                  onPressed: () {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (_) => ChatPage()));
                  })
            ],
          ),
        ),
      ),
    );
  }

  Widget getBody(
    size,
    CommentProvider commentProvider,
  ) {
    if (commentProvider.items[index].title.length > 50) {
      firstHalf = commentProvider.items[index].title.substring(0, 50);
      secondHalf = commentProvider.items[index].title
          .substring(50, commentProvider.items[index].title.length);
    } else {
      firstHalf = commentProvider.items[index].title;
      secondHalf = "";
    }
    return ListView(
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.only(top: 5, left: 5, right: 5),
          child: Row(
              children: List.generate(stories.length, (index) {
            return Padding(
              padding: const EdgeInsets.all(3.0),
              child: Container(
                width: 80,
                child: Column(
                  children: [
                    Stack(
                      children: [
                        stories[index]['isStory']
                            ? Container(
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    gradient:
                                        LinearGradient(colors: bgStoryColors)),
                                child: Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: Container(
                                    height: 70,
                                    width: 70,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                            width: 2, color: bgWhite),
                                        image: DecorationImage(
                                            image: NetworkImage(
                                                stories[index]['imageUrl']),
                                            fit: BoxFit.cover)),
                                  ),
                                ),
                              )
                            : Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: Container(
                                  height: 70,
                                  width: 70,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border:
                                          Border.all(width: 1, color: bgGrey),
                                      image: DecorationImage(
                                          image: NetworkImage(
                                              stories[index]['imageUrl']),
                                          fit: BoxFit.cover)),
                                ),
                              ),
                        stories[index]['isAdd']
                            ? Positioned(
                                right: 5,
                                bottom: 0,
                                child: Container(
                                  height: 20,
                                  width: 20,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle, color: primary),
                                  child: Center(
                                    child: Icon(
                                      Icons.add,
                                      color: bgWhite,
                                      size: 20,
                                    ),
                                  ),
                                ),
                              )
                            : Container(),
                      ],
                    ),
                    SizedBox(height: 5),
                    Text(
                      stories[index]['username'],
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 12),
                    ),
                  ],
                ),
              ),
            );
          })),
        ),
        Divider(),
        Column(
            children: List.generate(newFeeds.length, (index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.only(left: 15, right: 15, bottom: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              gradient: LinearGradient(colors: bgStoryColors),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(1.3),
                              child: Container(
                                height: 35,
                                width: 35,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border:
                                        Border.all(width: 1, color: bgWhite),
                                    image: DecorationImage(
                                        image: NetworkImage(commentProvider
                                            .items[index].lowThumbnail),
                                        fit: BoxFit.cover)),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            commentProvider.items[index].channelname,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Icon(FontAwesome.ellipsis_v, size: 15),
                    ],
                  ),
                ),
                Container(
                  height: 400,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                              commentProvider.items[index].highThumbnail),
                          fit: BoxFit.cover)),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 8, right: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          IconButton(
                            splashRadius: 15,
                            icon: newFeeds[index]['isLike']
                                ? SvgPicture.asset(
                                    "assets/images/heart_red.svg",
                                    width: 25,
                                    height: 25,
                                  )
                                : SvgPicture.asset(
                                    "assets/images/heart.svg",
                                    width: 25,
                                    height: 25,
                                  ),
                            onPressed: () {},
                          ),
                          IconButton(
                            splashRadius: 15,
                            icon: Icon(FontAwesome.comment_o, size: 25),
                            onPressed: () {},
                          ),
                          IconButton(
                            splashRadius: 15,
                            icon: SvgPicture.asset(
                              "assets/images/share.svg",
                              width: 20,
                              height: 20,
                            ),
                            onPressed: () {},
                          ),
                        ],
                      ),
                      IconButton(icon: Icon(Feather.bookmark), onPressed: () {})
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 15, right: 15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${newFeeds[index]['likes']} likes',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 5),
                      Text(
                          flag ? (firstHalf + "...") : (firstHalf + secondHalf),
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      InkWell(
                        onTap: () {
                          setState(() {
                            flag = !flag;
                          });
                        },
                        child: Text(
                          flag ? "more" : "less",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.grey),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        newFeeds[index]['comments'],
                        style: TextStyle(color: textGrey),
                      ),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          Container(
                            width: (size.width - 30) * 0.7,
                            child: Row(
                              children: [
                                Container(
                                  height: 28,
                                  width: 28,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border:
                                          Border.all(width: 1, color: bgGrey),
                                      image: DecorationImage(
                                          image: NetworkImage(profile),
                                          fit: BoxFit.cover)),
                                ),
                                Container(
                                  height: 25,
                                  width: (size.width - 70) * 0.7,
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        top: 10, left: 10, right: 10),
                                    child: TextField(
                                      cursorColor: textBlack.withOpacity(0.5),
                                      decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: "Add a comment",
                                          hintStyle: TextStyle(
                                              fontSize: 14,
                                              color:
                                                  textBlack.withOpacity(0.5))),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: (size.width - 30) * 0.3,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                SizedBox(width: 8),
                                Text("😎"),
                                SizedBox(width: 8),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                CommentPage()));
                                  },
                                  child: Icon(
                                    Icons.add_circle_outline,
                                    size: 20,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 5),
                      Text(
                        newFeeds[index]['dateTime'],
                        style: TextStyle(fontSize: 12, color: textGrey),
                      )
                    ],
                  ),
                )
              ],
            ),
          );
        })),
      ],
    );
  }

  void fetchProducts() async {
    List<CommentModel> list;
    var url = Uri.parse(
        'https://hiit.ria.rocks/videos_api/cdn/com.rstream.crafts?versionCode=40&lurl=Canvas%20painting%20ideas');
    final http.Response response = await http.get(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    list = (json.decode(response.body) as List)
        .map((data) => new CommentModel.fromJson(data))
        .toList();
    print(jsonEncode(response.body));
    Provider.of<CommentProvider>(context, listen: false).setComment(list);
  }
}
