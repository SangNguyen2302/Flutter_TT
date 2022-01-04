
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Category {
  late final int id;
  late final String content;
  final String icon;
  final Color color;
  Category({required this.id, required this.content, required this.icon, required this.color});
  static List<Category> listCategory=[
    Category(id: 1, content: 'Dress',icon: 'icons/ic_woman.png',color: Colors.redAccent),
    Category(id: 2, content: 'Decor',icon: 'icons/ic_decor.png',color: Colors.green),
    Category(id: 3, content: 'Shoes',icon: 'icons/ic_men.png',color: Colors.yellow),
    Category(id: 4, content: 'Baby & Kid',icon: 'icons/ic_kids.png',color: Colors.amber),
    Category(id: 5, content: 'Bags',icon: 'icons/ic_bag.png',color: Colors.orange),
    Category(id: 6, content: 'Shoes',icon: 'icons/ic_men.png',color: Colors.grey),
  ] ;
}