import 'dart:ui';

import 'package:assignment5_http/models/film.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../models/details.dart';

class DetailPage extends StatefulWidget {
  int id;
   DetailPage({Key ?key,required this.id}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  late Future<Detail> detail_film;
  @override
  void initState() {
    super.initState();
    detail_film = fetchDetailFilm(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        extendBodyBehindAppBar: true,// appbar chàn lên Scaffold
        appBar: AppBar(

          backgroundColor: Colors.transparent,// background đổ bóng trong suốt
          elevation: 0.0, // độ đậm nahtj trong suốt
        ),
        body:FutureBuilder<Detail>(
          future: detail_film,
          builder: (context, snapshot){
           if(snapshot.hasData){
             return  Stack(
               children: [
                 Container(
                     height: size.height,
                     width: size.width,
                     color: Color(0xff21242C)
                 ),
                 Container(
                   height: size.height * .6,
                   width: size.width,
                   child: Hero(
                       tag: '',
                       child: Container(
                         decoration: BoxDecoration(
                             image: DecorationImage(
                                 fit: BoxFit.cover,
                                 image: NetworkImage('${snapshot.data!.image}')
                             )
                         ),
                         child: Container(
                           decoration: BoxDecoration(
                             gradient: LinearGradient(
                                 begin: Alignment.bottomRight,
                                 colors: [
                                   Color(0xff21242C),
                                   Color(0xff21242C).withOpacity(.8),
                                   Color(0xff21242C).withOpacity(.1),
                                 ]
                             ),
                           ),
                         ),
                       )
                   ),
                 ),
                 Positioned(
                   top: 510,
                   width: MediaQuery.of(context).size.width,
                   child: Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       //image
                       SizedBox(
                           height: 40,
                           //width: size.width,
                           child:Text('${snapshot.data!.name}',style: TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.normal,),)
                       ),
                       //network and day
                       Row(
                         children: [
                           Text('${snapshot.data!.network}',style: TextStyle(color: Colors.white54,fontSize: 15,),),
                            SizedBox(
                             width: 5,
                           ),
                           Text('|',style: TextStyle(color: Colors.white54,fontSize: 13),),
                           SizedBox(
                             width: 5,
                           ),
                           Text('${snapshot.data!.startDate}',style: TextStyle(color: Colors.white54,fontSize: 15),)
                         ],
                       ),
                       SingleChildScrollView(
                         scrollDirection: Axis.vertical,
                         child: Container(
                         margin:  EdgeInsets.only(top: 20),
                           child: Text(
                             snapshot.data!.description,
                             style: const TextStyle(
                                 color: Colors.white,
                                 decoration: TextDecoration.none,
                                 fontSize: 15,
                                 fontWeight: FontWeight.normal),
                           ),
                         ),
                       )
                     ],
                   ),
                 ),

               ],
             );
           }else if(snapshot.hasError){
             return Text('${snapshot.error}');
           }
           return Center(
             child: CircularProgressIndicator()
           );
          },
        )
    );
  }
}
