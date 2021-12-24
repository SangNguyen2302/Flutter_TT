import 'package:basicwidget/pages/home_page.dart';
import 'package:basicwidget/pages/test_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class MenuBar extends StatefulWidget {
  const MenuBar({Key ?key}) : super(key: key);

  @override
  _MenuBarState createState() => _MenuBarState();
}

class _MenuBarState extends State<MenuBar> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body:  Stack(
        children: <Widget>[
           Offstage(
            offstage: index != 0,
            child:  TickerMode(
              enabled: index == 0,
              child:  MaterialApp(home:  MyHomePage()),
            ),
          ),
           Offstage(
            offstage: index != 1,
            child:  TickerMode(
              enabled: index == 1,
              child:  MaterialApp(home: MyStatefulWidget()),
            ),
          ),
          Offstage(
            offstage: index != 2,
            child:  TickerMode(
              enabled: index == 2,
              child:  MaterialApp(home: MyStatefulWidget()),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Colors.red,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.explore),
            label: 'Explore',
            backgroundColor: Colors.green,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Setting',
            backgroundColor: Colors.purple,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Account',
            backgroundColor: Colors.pink,
          ),
        ],
        selectedItemColor: Colors.amber[600],
        currentIndex: index,
        onTap: (int index) { setState((){ this.index = index; });},
      ),
    );
  }
}
