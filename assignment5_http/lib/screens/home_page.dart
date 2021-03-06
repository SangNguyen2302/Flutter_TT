import 'dart:async';

import 'package:assignment5_http/models/film.dart';
import 'package:assignment5_http/request_network/request_data.dart';
import 'package:assignment5_http/screens/search_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'detail_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static const String routeName = '/HomePage';
  List<TvShows>? tvShows;

  // bool _isLoading= true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  Future<void> getData() async {
    tvShows = await fetchdata();
    setState(() {
      // _isLoading=true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fetch Data Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: Container(
          color: Colors.black,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //search bar
                Container(
                  margin: EdgeInsets.only(top: 60, bottom: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: TextField(
                    onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=> Jobs()));},
                    //textInputAction: TextInputAction.search,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(
                             color: Colors.grey,
                            ),
                      ),
                      // push TextField
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(
                          color: Colors.blue,
                        ),
                      ),
                      suffixIcon: InkWell(
                        child: Icon(Icons.search),
                        onTap:(){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> Jobs()));
                        }
                      ),
                      contentPadding: EdgeInsets.all(15.0),
                      hintText: 'Search ...',
                    ),
                  ),
                ),

              Container(
                margin: EdgeInsets.only(top: 10),
                padding: EdgeInsets.all(5),
                height: 40,
                child: Text(
                  'Top 10 Tv Shows',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
              //Top 10 TvSHow
              Container(
                height: 220,
                child: FutureBuilder(
                  future: fetchdata(),
                  builder: (context, snapShot) {
                    if (snapShot.hasData) {
                      return ListView.builder(
                          scrollDirection: Axis.horizontal,
                          //lay 10 item dau tien
                          itemCount: tvShows == null
                              ? 0
                              : (tvShows!.length > 10 ? 10 : tvShows!.length),
                          //tvShows == null ? 0 : tvShows!.length,
                          itemBuilder: (BuildContext context, int index) {
                           TvShows tvShow = tvShows![index];
                            return InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            DetailPage(id:tvShows![index].id)),
                                  );
                                },
                              child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  margin: EdgeInsets.all(10),
                                  height: 190,
                                  width: 125,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20)),
                                      boxShadow: [
                                        BoxShadow(
                                          // color:
                                          // Colors.grey.withOpacity(0.9),
                                          // spreadRadius: 5,
                                          // blurRadius: 7,
                                          // offset: Offset(0,
                                          //     5), // changes position of shadow
                                        ),
                                      ],
                                      image: DecorationImage(
                                          image: NetworkImage(
                                              '${tvShows![index].imageThumbnailPath}'),
                                          fit: BoxFit.cover)),
                                  child: Text('${tvShows![index].name}'),
                                ),
                              ],
                            ),
                              );

                          });
                    } else if (snapShot.hasError) {
                      return Container(
                        child: Text('Faild'),
                      );
                    } else {
                      return Container(
                          child: Center(
                        child: CircularProgressIndicator(),
                      ));
                    }
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                padding: EdgeInsets.all(5),
                height: 40,
                child: Text(
                  'Most Popular Tv Shows',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
              //Most Popular
              Container(
                height: 310,
                padding: EdgeInsets.all(10),
                child: FutureBuilder(
                  future: fetchdata(),
                  builder: (context, snapShot) {
                    if (snapShot.hasData) {
                      return GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: MediaQuery.of(context).size.width /
                              (MediaQuery.of(context).size.height / 1.6),
                        ),
                        itemCount: tvShows!.length,
                        itemBuilder: (BuildContext context, int index) {
                          TvShows tvShow = tvShows![index];
                          return  InkWell(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailPage(id: tvShows![index].id,)));
                            },
                            child: Container(
                              margin: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(20)),
                                  boxShadow: [
                                    // BoxShadow(
                                    //   color:
                                    //   Colors.grey.withOpacity(0.9),
                                    //   spreadRadius: 5,
                                    //   blurRadius: 7,
                                    //   offset: Offset(0,
                                    //       5), // changes position of shadow
                                    // ),
                                  ],
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          '${tvShows![index].imageThumbnailPath}'),
                                      fit: BoxFit.cover)),
                              //  child: Text('${userLists![index].name}'),
                            ),
                          );

                        },
                      );
                    } else if (snapShot.hasError) {
                      return Container(
                        child: Text('Faild'),
                      );
                    } else {
                      return Container(
                          child: Center(
                        child: CircularProgressIndicator(),
                      ));
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
