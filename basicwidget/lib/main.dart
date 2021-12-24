import 'package:basicwidget/pages/menu_bar.dart';
import 'package:flutter/material.dart';

import 'Model/movie_model.dart';

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
        primarySwatch: Colors.blue,
        fontFamily:'Poppins'
      ),
      home: MenuBar()
    );
  }
}


