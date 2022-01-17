import 'package:assignment_3/models/drinks.dart';
import 'package:assignment_3/page/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/cart_provider.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: Drinks()),
        ChangeNotifierProvider.value(value: Cart()),
      ],
      child: const MaterialApp(
        title: "My shop",
        home: HomePage(),
      ),
    );
  }
}