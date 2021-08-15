import 'dart:convert';
import 'package:insta/provider/CommentProv.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:insta/util/CommentsModel.dart';
import 'package:http/http.dart' as http;

class CommentPage extends StatefulWidget {
  const CommentPage({Key key}) : super(key: key);

  @override
  _CommentPageState createState() => _CommentPageState();
}

class _CommentPageState extends State<CommentPage> {
  @override
  Widget build(BuildContext context) {
    fetchComments();
    return Consumer<CommentProv>(builder: (context, commentProvider, child) {
      return Scaffold(
        appBar: AppBar(
          elevation: 1,
          backgroundColor: new Color(0xfff8faf8),
          leading: IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.pop(context);
              }),
          title: Text(
            'Comments',
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: ListView.builder(
            shrinkWrap: true,
            itemCount: commentProvider.count,
            itemBuilder: (context,index){
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: CircleAvatar(
                        backgroundImage: NetworkImage("https://i.ytimg.com/vi/8PXzYtpPOX0/maxresdefault.jpg"),
                        radius: 20,
                      ),
                    ),
                    SizedBox(
                      width: 15.0,
                    ),
                    Row(
                      children: <Widget>[
                        Text(commentProvider.items[index].username,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            )),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text(commentProvider.items[index].comments),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          );
        })
      );
    });
  }

  void fetchComments() async {
    List<Comment> list;
    var url = Uri.parse('http://cookbookrecipes.in/test.php');
    final http.Response response = await http.get(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    list = (json.decode(response.body) as List)
        .map((data) => new Comment.fromJson(data))
        .toList();
    print(jsonEncode(response.body));
    Provider.of<CommentProv>(context, listen: false).setComment(list);
  }
}
