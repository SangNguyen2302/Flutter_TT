import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:more_widget_basic/model/categories.dart';
import 'package:more_widget_basic/model/item_product.dart';
import 'package:more_widget_basic/pages_shop/test_page.dart';
import 'detail_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key ?key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Products(),

    MyStatefulWidget(),
    Text(
      'Index 3: Setting',
      style: optionStyle,
    ),
    Text(
      'Index 3: Account',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: false,
        title: Text(
          'Home',
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.black,
            ),
            onPressed: () {
              // do something
            },
          )
        ],
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        //type: BottomNavigationBarType.fixed,
        iconSize: 20,
        items:  <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home,color: Colors.black,),
            label: '',
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.explore,color: Colors.black,),
            label: '',
            backgroundColor: Colors.green,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings,color: Colors.black,),
            label: '',
            backgroundColor: Colors.purple,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle,color: Colors.black,),
            label: '',
            backgroundColor: Colors.pink,
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            //back Drawer
            InkWell(
              child: Align(
                alignment: Alignment.topLeft + Alignment(0.1, 0),
                child: Icon(Icons.close),
              ),
              onTap: () => Navigator.pop(context),
            ),
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Stack(
                children: <Widget>[
                  Column(
                    children: [
                      //avatar
                      Align(
                          alignment: Alignment.center,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                    blurRadius: 5, // độ dày của shadow
                                    color: Colors.black,
                                    spreadRadius: 2 // đậm nhạt
                                )
                              ],
                            ),
                            child: CircleAvatar(
                              //  child: Text('S',style: TextStyle(fontSize: 30),),
                              backgroundImage: AssetImage('ic_user.png'),
                              radius: 40,
                            ),
                          )),
                      //name
                      SizedBox(
                        height: 10,
                      ),
                      //name
                      Align(
                          alignment: Alignment.center + Alignment(0, 0),
                          child: Text('Nguyen Sang',
                              style: TextStyle(
                                fontSize: 20,
                              ))),
                      //
                    ],
                  )
                ],
              ),
            ),
            //My Oder
            Container(
              height: 60,
              color: Colors.black12,
              padding: EdgeInsets.all(10),
              // alignment: Alignment.center,
              child: Row(
                children: [
                  Expanded(
                      flex: 5,
                      child: Column(
                        children: [
                          Text(
                            '08',
                            style: TextStyle(color: Colors.purple),
                          ),
                          Text('My Order')
                        ],
                      )),
                  Expanded(
                      flex: 5,
                      child: Column(
                        children: [
                          Text('07', style: TextStyle(color: Colors.purple)),
                          Text('Wishlist')
                        ],
                      )),
                ],
              ),
            ),

            ListTile(
              leading: Image.asset(
                'ic_men.png',
                height: 25,
              ),
              title: Text('Men'),
            ),
            ListTile(
              leading: Image.asset(
                'ic_woman.png',
                height: 25,
              ),
              title: Text("Women"),
            ),
            ListTile(
              leading: Image.asset(
                'ic_kids.png',
                height: 25,
              ),
              title: Text("Baby & Kids"),
            ),
            ListTile(
              leading: Image.asset(
                'ic_bag.png',
                height: 25,
              ),
              title: Text("Bags"),
            ),
            ListTile(
              leading: Image.asset(
                'ic_decor.png',
                height: 25,
              ),
              title: Text("Decor"),
            ),
            ListTile(
              leading: Image.asset(
                'ic_sports.png',
                height: 25,
              ),
              title: Text("Sport"),
            ),
            Divider(
              height: 90,
            ),
            ListTile(
              leading: Image.asset(
                'user.png',
                height: 25,
              ),
              title: Text("Account"),
            ),
            ListTile(
              leading: Image.asset(
                'settings.png',
                height: 25,
              ),
              title: Text("Settings"),
            ),
          ],
        ),
      ),
    );
  }
}

class Products extends StatelessWidget {
  const Products({Key ?key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child:Container(
        color: Color(0xFFE7EFFC),
        child:  Column(
          children: [
            Container(
              color: Colors.red,
              width: MediaQuery.of(context).size.width, // max width
              // height: MediaQuery.of(context).size.height,
              height: 210,
              child: Image(
                image: AssetImage('b1.jpg'),
              ),
            ),
            //category
            Container(
              //color: Colors.grey,
              padding: EdgeInsets.only(top: 20),
              margin: const EdgeInsets.only(left: 7.0),
              height: 100,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: Category.listCategory.length,
                itemBuilder: (context, i) =>
                    _ItemCategory(category: Category.listCategory[i]),
              ),
            ),
            //Text Dress view all
            Container(
              margin: EdgeInsets.only(top: 5),
              padding: EdgeInsets.all(7),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Newest Arrivals",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 150, top: 5),
                    child: Text(
                      'View all',
                      style: TextStyle(fontSize: 15),
                    ),
                  )
                ],
              ),
            ),
            //list item Dress
            Container(
              //x color: Colors.grey,
              padding: EdgeInsets.only(top: 10),
              margin: const EdgeInsets.only(left: 7.0),
              height: 200,
              child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: ShopModel.listShop.length,
                  itemBuilder: (context, i) => _ItemNewest(
                    shopModel: ShopModel.listShop[i],
                  )),
            ),
            //Text Featured
            Container(
              margin: EdgeInsets.only(top: 5),
              padding: EdgeInsets.all(7),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Featured Products",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 125, top: 5),
                    child: Text(
                      'View all',
                      style: TextStyle(fontSize: 15),
                    ),
                  )
                ],
              ),
            ),
            //list Featured
            Container(
              //x color: Colors.grey,
              padding: EdgeInsets.only(top: 10),
              margin: const EdgeInsets.only(left: 7.0),
              height: 200,
              child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: ShopModel.listShop.length,
                  itemBuilder: (context, i) => _ItemFeatures(
                    shopModel: ShopModel.listShop[i],
                  )),
            ),

          ],
        ),
      )
    );
  }
}

// item category
class _ItemCategory extends StatelessWidget {
  final Category category;

  const _ItemCategory({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color _color = this.category.color;
    return InkWell(
      // onTap: () => Navigator.push(
      //     context,
      //     MaterialPageRoute(
      //         builder: (_) => DetailsMoviePage(movieModel: movieModel))),
      child: Padding(
          padding: const EdgeInsets.only(right: 25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Hero(
                      tag: category.id,
                      child: Container(
                        width: 40,
                        height: 40,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                _color.withOpacity(0.2),
                                _color // độ đậm màu bắt đầu
                              ],
                              begin: Alignment.topRight,
                              // vị trí băt đầu đậm dần
                              end: Alignment.bottomLeft, // vị trí kết thúc
                            ),
                            color: _color,
                            borderRadius: BorderRadius.circular(100)),
                        child: SizedBox(
                          // margin: EdgeInsets.only(right: 20),
                          child: Image.asset(
                            category.icon,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),

                    Container(
                      padding: EdgeInsets.only(top: 10),
                      child: Text(
                        category.content,
                        style: TextStyle(color: _color),
                      ),
                    )
                    //description
                  ],
                ),
              )
            ],
          )),
    );
  }
}

class _ItemNewest extends StatelessWidget {
  final ShopModel shopModel;

  const _ItemNewest({Key? key, required this.shopModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget child;
    if (shopModel.categoryId == 5) {
      return Column(
        children: [
          //image
          InkWell(
            onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>
              DetailPage(shopModel: shopModel)
            )),
            child: Container(
                margin: EdgeInsets.only(left: 20),
                width: 110,
                height: 150,
               // color: Colors.redAccent,
                child: Image.asset(shopModel.image)),
          ),

          //name & cost
          Container(
            width: 115,
            margin: EdgeInsets.only(top: 7, left: 20),
            child: Row(
              children: [
                Text(shopModel.name),
                Container(
                    margin: EdgeInsets.only(left: 30),
                    child: Text(
                      '\$ ${shopModel.cost}',
                      style: TextStyle(color: Colors.redAccent),
                    ))
              ],
            ),
          )
        ],
      );
    }
    return Container();
  }
}

class _ItemFeatures extends StatelessWidget {
  final ShopModel shopModel;

  const _ItemFeatures({Key? key, required this.shopModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget child;
    if (shopModel.categoryId == 3) {
      return Column(
        children: [
          InkWell(
          onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>
          DetailPage(shopModel: shopModel)
      )),
          //image
         child: Container(
              margin: EdgeInsets.only(left: 20),
              width: 110,
              height: 150,
              child: Image.asset(shopModel.image))),
          //name & cost
          Container(
            width: 115,
            margin: EdgeInsets.only(top: 7, left: 20),
            child: Row(
              children: [
                Text(shopModel.name),
                Container(
                    margin: EdgeInsets.only(left: 30),
                    child: Text(
                      '\$ ${shopModel.cost}',
                      style: TextStyle(color: Colors.redAccent),
                    ))
              ],
            ),
          )
        ],
      );
    }
    return Container();
  }
}
