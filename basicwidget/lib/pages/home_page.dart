import 'package:basicwidget/Model/movie_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'detail_page.dart';

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Nguyen Sang',
            style: TextStyle(fontFamily: 'Poppins'),
          ),
        ),
        body:SingleChildScrollView(
          child:
      Column(
          children: [
            //Header
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.all(10),
                    height: 200,
                    width: 135,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.9),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 5), // changes position of shadow
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset('film1.jpeg'),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    height: 200,
                    width: 135,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.9),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 5), // changes position of shadow
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset('film2.jpeg'),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    height: 200,
                    width: 135,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.9),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 5), // changes position of shadow
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset('film3.jpeg'),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    height: 200,
                    width: 135,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.9),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 5), // changes position of shadow
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset('avengers.jpeg'),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    height: 200,
                    width: 135,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.9),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 5), // changes position of shadow
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset('film_spider5.jpeg'),
                    ),
                  ),
                ],
              ),
            ),

            //categories
            Container(
                padding: EdgeInsets.only(left: 15),
                margin: EdgeInsets.only(top: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Categories',
                        style: TextStyle(fontFamily: 'Poppins', fontSize: 20)),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: <Widget>[
                          Container(
                              margin: EdgeInsets.only(top: 10),
                              height: 35,
                              width: 150,
                              decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.3),
                                    spreadRadius: 5,
                                    blurRadius: 7,
                                    offset: Offset(
                                        0, 5), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: Center(
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Text('Short stories')),
                              )),
                          Container(
                              margin: EdgeInsets.only(top: 10, left: 10),
                              height: 35,
                              width: 150,
                              decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.3),
                                    spreadRadius: 5,
                                    blurRadius: 7,
                                    offset: Offset(
                                        0, 5), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: Center(
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Text('Science fiction')),
                              )),
                          Container(
                              margin: EdgeInsets.only(top: 10, left: 10),
                              height: 35,
                              width: 170,
                              decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.3),
                                    spreadRadius: 5,
                                    blurRadius: 7,
                                    offset: Offset(
                                        0, 5), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: Center(
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: const Text('Action & Advanture')),
                              )),
                         Container(
                              margin: EdgeInsets.only(top: 10, left: 10),
                              height: 35,
                              width: 100,
                              decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.3),
                                    spreadRadius: 5,
                                    blurRadius: 7,
                                    offset: Offset(0, 5), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: Center(
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: const Text('Romantic')),
                              )),
                        ],
                      ),
                    )
                  ],
                )),
            // Recently Added
            Container(
                width: 500,
                height: 50,
                //color: Colors.blue,
                padding: EdgeInsets.only(left: 15),
                margin: EdgeInsets.only(top: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text('Recently Added',
                        style: TextStyle(fontFamily: 'Poppins', fontSize: 20)),
                  ],
                )),
            // render listview movie
            Container(
              margin: const EdgeInsets.only(left: 20.0),
              height: 280,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.vertical,
                itemCount: MovieModel.listMovie.length,
                itemBuilder: (context, i) =>
                    _ItemsNowCinemas(movieModel: MovieModel.listMovie[i]),
              ),
            ),
          ],
        )));
  }
}

class _ItemsNowCinemas extends StatelessWidget {
  final MovieModel movieModel;

  const _ItemsNowCinemas({Key? key, required this.movieModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (_) => DetailsMoviePage(movieModel: movieModel))),
      child: Padding(
        padding: const EdgeInsets.only(right: 15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //image movie
                  Hero(
                    tag: movieModel.id,
                    child: Container(
                      margin: EdgeInsets.only(bottom: 40),
                      height: 210,
                      width: 160,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(movieModel.image))),
                    ),
                  ),
                  const SizedBox(height: 15.0),

                  //description
                  Container(
                      padding: EdgeInsets.only(left: 15,top:18),
                      child: Column(
                        children: [
                          SizedBox(
                            width: 150,
                            height: 30,
                            child: Text(
                              movieModel.name,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                            ),
                          ),
                          SizedBox(
                            width: 150,
                            height: 30,
                            child: Text(
                              movieModel.author,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  color: Colors.blueAccent
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 150,
                            height: 80,
                            child: Text(
                              movieModel.description,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 4,
                            ),
                          ),
                          SizedBox(height: 5.0),
                          //rating
                          RatingBar.builder(
                              itemSize: 25,
                              initialRating: movieModel.qualification,
                              itemBuilder: (_, i) => Icon(
                                  Icons.star_rate_rounded,
                                  color: Colors.amber),
                              onRatingUpdate: (_) {})
                        ],
                      ))
                ],
              ),
            )
          ],
        )
      ),
    );
  }
}
