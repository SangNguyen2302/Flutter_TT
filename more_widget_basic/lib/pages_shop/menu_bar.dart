import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'home_page.dart';

class MenuBar extends StatefulWidget {
  const MenuBar({Key ?key}) : super(key: key);

  @override
  _MenuBarState createState() => _MenuBarState();
}

class _MenuBarState extends State<MenuBar> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Stack(
        children: <Widget>[
          Offstage(
            offstage: index != 0,
            child:  TickerMode(
              enabled: index == 0,
              child:  MaterialApp(home: HomePage()),
            ),
          ),
          // Offstage(
          //   offstage: index != 1,
          //   child:  TickerMode(
          //     enabled: index == 1,
          //     child:  MaterialApp(home:  RattingPage()),
          //   ),
          // ),

        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items:  <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home,color: Colors.black,),
            label: 'Home',
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.explore,color: Colors.black,),
            label: 'Explore',
            backgroundColor: Colors.green,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings,color: Colors.black,),
            label: 'Setting',
            backgroundColor: Colors.purple,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle,color: Colors.black,),
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
