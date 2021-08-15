import 'package:flutter/material.dart';
import 'package:insta/pages/root_app.dart';
import 'package:insta/provider/CommentProv.dart';
import 'package:insta/provider/CommentProvider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
// This widget is the root of your application.
@override
Widget build(BuildContext context) {
  return MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => CommentProvider()),
      ChangeNotifierProvider(create: (_) => CommentProv())
    ],
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      home: RootApp(),
    )
  );
}
}
