import 'dart:ffi';
import 'dart:ui';

import 'package:badges/badges.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:more_widget_basic/model/item_product.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:readmore/readmore.dart';

class DetailPage extends StatefulWidget {
  final ShopModel shopModel;

  const DetailPage({Key? key, required this.shopModel}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int countFavourites = 0;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: Container(
            margin: EdgeInsets.only(top: 8),
            child: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () => Navigator.of(context).pop(),
            )),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        actions: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 8),
            child: IconButton(
              icon: Icon(
                Icons.favorite_border,
              ),
              color: Colors.black,
              onPressed: () {},
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 10, top: 8),
            child: Badge(
              // padding: EdgeInsets.all(1),
              toAnimate: true,
              badgeContent: Text(
                '$countFavourites',
                style: TextStyle(
                    //fontSize: 15,
                    // fontWeight: FontWeight.bold,
                    ),
              ),
              child: IconButton(
                icon: Icon(
                  Icons.shopping_cart_outlined,
                  color: Colors.black,
                ),
                onPressed: () => setState(() => countFavourites += 1),
              ),
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          Container(
            height: size.height,
            width: size.width,
            //  margin: EdgeInsets.only(bottom:30),
            // color: Color(0xffffffff)
          ),
          //image
          Container(
            height: size.height * .35,
            width: size.width,
            child: Hero(
                tag: "null",
                child: Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(widget.shopModel.image))),
                  child: Container(
                    decoration: BoxDecoration(
                      gradient:
                          LinearGradient(begin: Alignment.bottomRight, colors: [
                        Color(0xff21242C),
                        Color(0xff21242C).withOpacity(.8),
                        Color(0xff21242C).withOpacity(.1),
                      ]),
                    ),
                  ),
                )),
          ),
          //name ,cost
          Positioned(
              top: 300,
              child: Container(
                padding: EdgeInsets.only(left: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10.0),
                    //name, cost
                    Row(
                      children: [
                        Text(
                          widget.shopModel.name,
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 230),
                          child: Text('\$${widget.shopModel.cost}',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.orange)),
                        )
                      ],
                    ),
                    SizedBox(height: 10.0),
                    //ratting,viewer
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.orange),
                          padding: EdgeInsets.only(left: 9),
                          margin: EdgeInsets.only(right: 10),
                          width: 70,
                          height: 30,
                          child: Row(
                            children: [
                              Text(
                                '3.0',
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white),
                              ),
                              Icon(
                                Icons.star,
                                size: 15,
                                color: Colors.white,
                              )
                            ],
                          ),
                        ),
                        Text(
                          '6 Reviewer',
                          style: TextStyle(fontSize: 18, color: Colors.grey),
                        ),
                      ],
                    ),
                    //Description,Review
                  ],
                ),
              )),
          //tabbar
          Positioned(
              top: 390,
              child: Container(
                child: Container(
                  color: Color(0xFFE7EFFC),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: DefaultTabController(
                      length: 3, // length of tabs
                      initialIndex: 0,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            Container(
                              color: Colors.white,
                              margin: EdgeInsets.only(
                                  left: 15, right: 15, bottom: 10),
                              child: TabBar(
                                labelColor: Colors.orange,
                                unselectedLabelColor: Colors.black,
                                indicatorColor: Colors.orange,
                                tabs: [
                                  Tab(text: 'Description'),
                                  Tab(text: 'More Info'),
                                  Tab(text: 'Review'),
                                ],
                              ),
                            ),
                            Container(
                                height: 400, //height of TabBarView
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 0, color: Color(0xFFCFD8DC)),
                                ),
                                child: TabBarView(children: <Widget>[
                                  //DeScription
                                  Container(
                                      margin: EdgeInsets.only(left: 15),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          //description
                                          SizedBox(
                                            height: 100,
                                            child:ReadMoreText(
                                              widget.shopModel.description,
                                              trimLines: 1,
                                              colorClickableText: Colors.pink,
                                              trimMode: TrimMode.Line,
                                              trimCollapsedText: 'Show more',
                                              trimExpandedText: 'Show less',
                                              style: TextStyle(fontSize: 14,color:Colors.black),
                                              lessStyle: TextStyle(fontSize: 14,color:Colors.black,fontWeight: FontWeight.bold),
                                              moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold,color: Colors.black),
                                            )
                                          ),

                                          Container(
                                            margin: EdgeInsets.only(top: 20),
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                //description
                                                Container(
                                                  alignment: Alignment.center,
                                                  height: 35,
                                                  child: Text('Pincode'),
                                                  decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color:
                                                              Colors.black12)),
                                                ),

                                                Container(
                                                  margin: EdgeInsets.only(
                                                      right: 20),
                                                  alignment: Alignment.center,
                                                  height: 35,
                                                  child: Text(
                                                      'Check Availability'),
                                                  decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color:
                                                              Colors.black12)),
                                                ),
                                                Column(
                                                  children: [
                                                    Text('Delivery By,'),
                                                    Text(
                                                      '25 June, Monday ',
                                                      style: TextStyle(
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    )
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                          //color
                                          Container(
                                            margin: EdgeInsets.only(top: 25),
                                            child: Text(
                                              'Colors',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 15),
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              Container(
                                                margin: EdgeInsets.only(
                                                    top: 15, right: 20),
                                                width: 15,
                                                height: 15,
                                                decoration: BoxDecoration(
                                                  color: Colors.black,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          100),
                                                ),
                                              ),
                                              Container(
                                                margin: EdgeInsets.only(
                                                    top: 15, right: 20),
                                                width: 15,
                                                height: 15,
                                                decoration: BoxDecoration(
                                                  color: Colors.yellow,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          100),
                                                ),
                                              ),
                                              Container(
                                                margin:
                                                    EdgeInsets.only(top: 15),
                                                width: 15,
                                                height: 15,
                                                decoration: BoxDecoration(
                                                  color: Colors.redAccent,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          100),
                                                ),
                                              )
                                            ],
                                          ),
                                          //size
                                          Container(
                                            margin: EdgeInsets.only(
                                                top: 25, bottom: 0),
                                            child: Text(
                                              'Size',
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),

                                          Expanded(
                                              child: Container(
                                            margin: EdgeInsets.only(top: 15),
                                            child: ListView.builder(
                                                physics:
                                                    const BouncingScrollPhysics(),
                                                scrollDirection:
                                                    Axis.horizontal,
                                                itemCount: widget
                                                    .shopModel.size.length,
                                                itemBuilder: (context, index) {
                                                  String size = widget
                                                      .shopModel.size[index];
                                                  return Text(
                                                    size,
                                                    style:
                                                        TextStyle(fontSize: 15),
                                                  );
                                                }),
                                          ))
                                        ],
                                      )),
                                  //More Info
                                  Container(
                                      margin: EdgeInsets.only(left: 15),
                                      child: Text('Text More info')),
                                  //Review
                                  SingleChildScrollView(
                                    child: Container(
                                        margin:
                                            EdgeInsets.only(left: 15, top: 40),
                                        child: Row(
                                          children: [
                                            Container(
                                                padding: EdgeInsets.only(
                                                    left: 36,
                                                    top: 42,
                                                    bottom: 36,
                                                    right: 36),
                                                margin:
                                                    EdgeInsets.only(top: 30),
                                                width: 150,
                                                height: 150,
                                                decoration: BoxDecoration(
                                                    color: Colors.white24,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            100)),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Text(
                                                          '3.0',
                                                          style: TextStyle(
                                                              fontSize: 30,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                        Icon(Icons.star,
                                                            color:
                                                                Colors.orange),
                                                      ],
                                                    ),
                                                    Text(
                                                      '6 Review',
                                                      style: TextStyle(
                                                          fontSize: 18),
                                                    ),
                                                  ],
                                                )),
                                            Container(
                                              margin: EdgeInsets.only(left: 20),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                      padding: EdgeInsets.only(
                                                          top: 20),
                                                      child: Row(
                                                        children: [
                                                          Text(
                                                            '5',
                                                            style: TextStyle(
                                                                fontSize: 20,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                          Icon(
                                                            Icons.star,
                                                            color:
                                                                Colors.orange,
                                                          ),
                                                          LinearPercentIndicator(
                                                            width: 150,
                                                            animation: true,
                                                            lineHeight: 13.0,
                                                            animationDuration:
                                                                2000,
                                                            percent: 0.2,
                                                            linearStrokeCap:
                                                                LinearStrokeCap
                                                                    .roundAll,
                                                            progressColor:
                                                                Colors.green,
                                                          ),
                                                        ],
                                                      )),
                                                  Padding(
                                                      padding: EdgeInsets.only(
                                                          top: 15),
                                                      child: Row(
                                                        children: [
                                                          Text(
                                                            '4',
                                                            style: TextStyle(
                                                                fontSize: 20,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                          Icon(
                                                            Icons.star,
                                                            color:
                                                                Colors.orange,
                                                          ),
                                                          LinearPercentIndicator(
                                                            width: 150,
                                                            animation: true,
                                                            lineHeight: 13.0,
                                                            animationDuration:
                                                                2000,
                                                            percent: 0.2,
                                                            linearStrokeCap:
                                                                LinearStrokeCap
                                                                    .roundAll,
                                                            progressColor:
                                                                Colors.green,
                                                          ),
                                                        ],
                                                      )),
                                                  Padding(
                                                      padding: EdgeInsets.only(
                                                          top: 15),
                                                      child: Row(
                                                        children: [
                                                          Text(
                                                            '3',
                                                            style: TextStyle(
                                                                fontSize: 20,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                          Icon(
                                                            Icons.star,
                                                            color:
                                                                Colors.orange,
                                                          ),
                                                          LinearPercentIndicator(
                                                            width: 150,
                                                            animation: true,
                                                            lineHeight: 13.0,
                                                            animationDuration:
                                                                2000,
                                                            percent: 0.4,
                                                            linearStrokeCap:
                                                                LinearStrokeCap
                                                                    .roundAll,
                                                            progressColor:
                                                                Colors.orange,
                                                          ),
                                                        ],
                                                      )),
                                                  Padding(
                                                      padding: EdgeInsets.only(
                                                          top: 15),
                                                      child: Row(
                                                        children: [
                                                          Text(
                                                            '2',
                                                            style: TextStyle(
                                                                fontSize: 20,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                          Icon(
                                                            Icons.star,
                                                            color:
                                                                Colors.orange,
                                                          ),
                                                          LinearPercentIndicator(
                                                            width: 150,
                                                            animation: true,
                                                            lineHeight: 13.0,
                                                            animationDuration:
                                                                2000,
                                                            percent: 0.2,
                                                            linearStrokeCap:
                                                                LinearStrokeCap
                                                                    .roundAll,
                                                            progressColor:
                                                                Colors.orange,
                                                          ),
                                                        ],
                                                      )),
                                                  Padding(
                                                      padding: EdgeInsets.only(
                                                          top: 15),
                                                      child: Row(
                                                        children: [
                                                          Text(
                                                            '1',
                                                            style: TextStyle(
                                                                fontSize: 20,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                          Icon(
                                                            Icons.star,
                                                            color:
                                                                Colors.orange,
                                                          ),
                                                          LinearPercentIndicator(
                                                            width: 150,
                                                            animation: true,
                                                            lineHeight: 13.0,
                                                            animationDuration:
                                                                2000,
                                                            percent: 0.2,
                                                            linearStrokeCap:
                                                                LinearStrokeCap
                                                                    .roundAll,
                                                            progressColor:
                                                                Colors.red,
                                                          ),
                                                        ],
                                                      )),
                                                ],
                                              ),
                                            )
                                          ],
                                        )),
                                  )
                                ]))
                          ])),
                ),
              )),
          // Buy products
          Positioned(
            left: 0,
            right: 180,
            bottom: 0,
            child: InkWell(
              onTap: () => setState(() => countFavourites += 1),
              child: Container(
                child: Text('Add to Cart',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                alignment: Alignment.center,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.9),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 5), // changes position of shadow
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            left: 190,
            right: 0,
            bottom: 0,
            child: InkWell(
              onTap: () => setState(() => countFavourites += 1),
              child: Container(
                child: Text('Buy Now',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white)),
                alignment: Alignment.center,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.orange[700],
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.9),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(5, 0), // changes position of shadow
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
