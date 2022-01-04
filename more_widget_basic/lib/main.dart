import 'package:flutter/material.dart';
import 'package:more_widget_basic/model/categories.dart';
import 'package:more_widget_basic/pages_shop/home_page.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:more_widget_basic/pages_shop/menu_bar.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      home: HomePage()
    );
  }
}
