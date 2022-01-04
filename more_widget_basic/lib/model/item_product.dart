class ShopModel {
  int id;
  final String name;
  late String description;
  late String image;
  late String cost;
  late int categoryId;
  List<String> size = <String>[];
  ShopModel(
      {required this.id,
      required this.name,
      required this.description,
      required this.image,
      required this.cost,
      required this.size,
      required this.categoryId});

  static List<ShopModel> listShop = [
    //Newest
    ShopModel(
        id:17,
        name: 'Dress 1',
        description: 'Váy , thoáng mát, dễ sử dụng và phù hợp với công ty, du lịch, ngắn,Váy , thoáng mát, dễ sử dụng và phù hợp với công ty, du lịch, ngắn,Váy , thoáng mát, dễ sử dụng và phù hợp với công ty, du lịch, ngắn,Váy , thoáng mát, dễ sử dụng và phù hợp với công ty, du lịch, ngắn,...',
        image: 'dress_1.jpeg',
        cost: "20",
        size:['X       ','L       ','S       ','XL'],
        categoryId: 5
    ),
    ShopModel(
        id:18,
        name: 'Watch 1',
        description: 'Váy , thoáng mát, dễ sử dụng và phù hợp với công ty, du lịch, ngắn,...',
        image: 'images/watch_1.jpg',
        cost: "80",
        size:['X       ','L       ','S'],
        categoryId: 5
    ),
    ShopModel(
        id:19,
        name: 'Watch 2',
        description: 'Váy , thoáng mát, dễ sử dụng và phù hợp với công ty, du lịch, ngắn,...',
        image: 'images/watch_2.jpeg',
        cost: "90",
        size:['X       ','L       ','S       ','XL'],
        categoryId: 5
    ),
    //dress
    ShopModel(
      id:1,
      name: 'dress 1',
      description: 'Váy , thoáng mát, dễ sử dụng và phù hợp với công ty, du lịch, ngắn,...',
      image: 'dress_1.jpeg',
      cost: "20",
        size:['X       ','L       ','S       ','XL'],
      categoryId: 1
    ),
    ShopModel(
        id:2,
        name: 'dress 2',
        description: 'Váy , thoáng mát, dễ sử dụng và phù hợp với công ty, du lịch, ngắn,...',
        image: 'dress_2.jpeg',
        cost: "20",
        size:['X       ','L       ','S       ','XL'],
        categoryId: 1
    ),
    ShopModel(
        id:4,
        name: 'dress 6',
        description: 'Váy , thoáng mát, dễ sử dụng và phù hợp với công ty, du lịch, ngắn,...',
        image: 'dress_6.jpeg',
        cost: "20",
        size:['X       ','L       ','S       ','XL'],
        categoryId: 1
    ),

    //decor
    ShopModel(
        id:6,
        name: 'decor 1',
        description: 'Thiết kế hiện đại sang trọng, phù hợp cho dân phòng',
        image: 'decor_1.jpg',
        cost: "50",
        size:['X       ','L       ','S       ','XL'],
        categoryId: 2
    ),
    ShopModel(
        id:7,
        name: 'decor 2',
        description: 'Thiết kế hiện đại sang trọng, phù hợp cho dân phòng',
        image: 'decor_2.jpg',
        cost: "50",
        size:['X       ','L       ','S       ','XL'],
        categoryId: 2
    ),
    ShopModel(
        id:8,
        name: 'decor 3',
        description: 'Thiết kế hiện đại sang trọng, phù hợp cho dân phòng.',
        image: 'decor_3.jpg',
        cost: "50",
        size:['X       ','L       ','S       s','XL'],
        categoryId: 2
    ),

    // shoes
    ShopModel(
        id:15,
        name: 'shoe 1',
        description: 'Thiết kế hiện đại sang trọng, phù hợp cho dân phòng,Váy , thoáng mát, dễ sử dụng và phù hợp với công ty, du lịch, ngắn,Váy , thoáng mát, dễ sử dụng và phù hợp với công ty, du lịch, ngắn,Váy , thoáng mát, dễ sử dụng và phù hợp với công ty, du lịch, ngắn',
        image: 'images/shoes/shoe_1.jpeg',
        cost: "30",
        size:['X       ','L       ','S       ','XL'],
        categoryId: 3
    ),
    ShopModel(
        id:9,
        name: 'shoes 2',
        description: 'Thiết kế hiện đại sang trọng, phù hợp cho dân phòng, giúp người mang có cảm giác thoải mái khi mang, chống ẩm ướt do mô ',
        image: 'images/shoes/shoe_2.jpeg',
        cost: "40",
        size:['X       ','L       ','S       ','XL'],
        categoryId: 3
    ),
    ShopModel(
        id:10,
        name: 'shoes 3',
        description: 'Thiết kế hiện đại sang trọng, phù hợp cho dân phòng,giúp người mang có cảm giác thoải mái khi mang, chống ẩm ướt do mô',
        image: 'images/shoes/shoe_3.jpeg',
        cost: "46",
        size:['X       ','L       ','S       ','XL'],
        categoryId: 3
    ),
    //dress
  ];
}
// ignore: non_constant_identifier_names
