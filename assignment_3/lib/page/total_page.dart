// import 'package:assignment_3/controller/cart_controller.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:get/get.dart';
//
// class CartTotal extends StatelessWidget {
//   final CartController controller = Get.find();
//    CartTotal({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return  Container(
//         height: 50,
//         width: 170,
//         alignment: Alignment.center,
//         padding: EdgeInsets.only(left: 15),
//         decoration: BoxDecoration(
//             color: Colors.indigo,
//             borderRadius: BorderRadius.circular(200)
//         ),
//         child: Row(
//           children: [
//             Container(
//               alignment: Alignment.center,
//               width:25,
//               height: 25,
//               margin: EdgeInsets.only(right: 5),
//               decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(20)
//               ),
//               child: Text('\$',style: TextStyle(color: Colors.indigo,fontWeight: FontWeight.bold,fontSize: 20),),
//             ),
//             Container(
//               width: 100,
//               child:Text('${controller.total} vnd',style:TextStyle(color: Colors.white),maxLines: 1,overflow:TextOverflow.ellipsis,) ,
//             )
//
//           ],
//         )
//     );
//   }
// }
