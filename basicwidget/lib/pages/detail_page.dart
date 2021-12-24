import 'package:basicwidget/Model/movie_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailsMoviePage extends StatelessWidget {
  final MovieModel movieModel;

  const DetailsMoviePage({Key? key, required this.movieModel})
      : super(key: key);

  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    //final cinemaBloc = BlocProvider.of<CinemaBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('${movieModel.name}'),
        backwardsCompatibility: true,
      ),
      body: Column(
        children: [
          //Header
          //image, name , author, download buttoon
          Row(
            children: <Widget>[
              Container(
                child: Text('${movieModel.id}'),
                //có hiện id,nếu k muốn thì dùng thẻ Hero(tad:...) để ẩn
                margin: const EdgeInsets.only(top: 10, left: 10),
                height: 200,
                width: 135,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover, image: AssetImage(movieModel.image)),
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.9),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 5), // changes position of shadow
                    ),
                  ],
                ),
              ),
              //name,author,...
              Container(
                margin: const EdgeInsets.only(top: 10, left: 15),
                height: 200,
                width: 220,

                //name , author
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(movieModel.name,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        )),
                    Text(movieModel.author,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: Colors.grey)),

                    // categories
                    Row(
                      children: [
                        Container(
                            margin: EdgeInsets.only(
                              top: 10,
                            ),
                            height: 35,
                            width: 100,
                            decoration: BoxDecoration(
                              //color: Colors.blue,
                              border: Border.all(color: Colors.blue, width: 2),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                            ),
                            child: Center(
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: const Text('Fiction',
                                      style: TextStyle(
                                          color: Colors.blue, fontSize: 12))),
                            )),
                        Container(
                            margin: EdgeInsets.only(top: 10, left: 10),
                            height: 35,
                            width: 100,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.blue, width: 2),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                            ),
                            child: Center(
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: const Text('Literay',
                                      style: TextStyle(
                                          color: Colors.blue, fontSize: 12))),
                            )),
                      ],
                    ),

                    //Download
                    Container(
                        margin: EdgeInsets.only(
                          top: 30,
                        ),
                        height: 35,
                        width: 250,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          border: Border.all(color: Colors.blue, width: 2),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        child: Center(
                            child: Container(
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
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    IconButton(
                                      color: Colors.white,
                                      icon: new Icon(Icons.download),
                                      padding: new EdgeInsets.only(
                                          left: 30, right: 10),
                                      onPressed: () {},
                                    ),
                                    const Text('Download Movie',
                                        style: TextStyle(color: Colors.white)),
                                  ],
                                )))),
                  ],
                ),
              )
            ],
          ),

          // movie Description
          Container(
            margin: EdgeInsets.only(top: 30),
            width: 360,
            height: 45,
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(
              color: Colors.grey,
              width: 1,
            ))),
            child: Text(
              'Movie Descripton',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.lightBlueAccent),
            ),
          ),

          //Description
          Container(
              padding: EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    movieModel.description,
                    style: TextStyle(fontSize: 15, color: Colors.grey),
                  ),
                  Text(
                    'show less',
                    style: TextStyle(fontSize: 12, color: Colors.lightBlue),
                  )
                ],
              )),

        ],
      ),
    );
  }
}
