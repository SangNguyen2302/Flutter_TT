import 'package:flutter/material.dart';

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
      ),
      home: const MyHomePage(title: 'Flutter Scaffold Example Of Nguyen Sang'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title,style: TextStyle(fontSize: 15),),
      ),
      persistentFooterButtons: <Widget>[
        // RaisedButton(
        //   onPressed: () {},
        //   color: Colors.blue,
        //   child: Icon(
        //     Icons.add,
        //     color: Colors.white,
        //   ),
        // ),
        // RaisedButton(
        //   onPressed: () {},
        //   color: Colors.green,
        //   child: Icon(
        //     Icons.clear,
        //     color: Colors.white,
        //   ),
        // ),
      ],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        fixedColor: Colors.grey,
        items: [
          BottomNavigationBarItem(
            title: Text("Home"),
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            title: Text("Search"),
            icon: Icon(Icons.search),
          ),
          BottomNavigationBarItem(
            title: Text("User Profile"),
            icon: Icon(Icons.account_circle),
          ),
        ],
        onTap: (int itemIndex){
          setState(() {
           // _currentIndex = itemIndex;
          });
        },
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                  color: Colors.indigoAccent,
                  image: DecorationImage(
                      image: NetworkImage('https://media-cdn.laodong.vn/storage/newsportal/2021/8/1/936984/Vu-Tru1.jpeg'),
                      fit: BoxFit.cover)),
              child: Stack(
                children: <Widget>[
                  Align(
                    alignment: Alignment.centerLeft,
                    child: CircleAvatar(
                      //  child: Text('S',style: TextStyle(fontSize: 30),),
                      backgroundImage: NetworkImage('https://lh3.googleusercontent.com/proxy/Q_7K3svMEVh403AQSqq-Dk3-GEtOlxDUmmhG6PkZObbMWA0XUvOvyOQlW6U8VhOE-5yCflE_DyzW_4fyqcK0UFhF1wrSBpXLj-YGFj0QaAvQGaKkUdV8jfFYLtyeUK1yVxX_m-gxSXIjAmps28so0JtttPy6'),
                      radius: 40,
                    ),
                  ),
                  Align(
                      alignment: Alignment.centerRight + Alignment(0,0),
                      child:
                      Text('Nguyen Sang', style: TextStyle(fontSize: 20,color: Colors.lightBlueAccent))),
                  Align(
                      alignment: Alignment.centerRight + Alignment(0, .8),
                      child: Text('sangnguyenphuoc2303@gmail.com', style: TextStyle(color: Colors.blueAccent))),
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.email),
              title: Text('All Mail Inbox'),
            ),
            Divider(
              height: 0.2,
            ),
            ListTile(
              leading: Icon(Icons.aspect_ratio),
              title: Text("Primary"),
            ),
            ListTile(
              leading: Icon(Icons.social_distance),
              title: Text("Social"),
            ),
            ListTile(
              leading: Icon(Icons.production_quantity_limits),
              title: Text("Promotions"),
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
             Text(
              'You have pushed the button this many $_counter times',
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
