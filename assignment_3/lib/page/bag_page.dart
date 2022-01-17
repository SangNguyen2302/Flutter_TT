
import 'package:assignment_3/controller/cart_controller.dart';
import 'package:assignment_3/models/cart_provider.dart';
import 'package:assignment_3/models/drink_model.dart';
import 'package:assignment_3/models/drinks.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class DetailPage extends StatelessWidget {
 // final CartController controller = Get.find(); // tim controller de tao
  DetailPage({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    final cartsData = Provider.of<Cart>(context);
    final carts = cartsData.items;
    final drinks=Provider.of<Drinks>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('hello'),
      ),
      body:
      Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            height: 600,
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: carts.length,
              itemBuilder: (context, index) => ChangeNotifierProvider.value(
                  value: carts.values.toList()[index],
                  child: CartDrink()),
            ),
          ),
          //total price
          Container(
              height: 50,
              width: 170,
              alignment: Alignment.center,
              padding: EdgeInsets.only(left: 15),
              decoration: BoxDecoration(
                  color: Colors.indigo,
                  borderRadius: BorderRadius.circular(200)
              ),
              child: Row(
                children: [
                  Container(
                    alignment: Alignment.center,
                    width:30,
                    height: 25,
                    margin: EdgeInsets.only(right: 5),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20)
                    ),
                    child: Text('\$',style: TextStyle(color: Colors.indigo,fontWeight: FontWeight.bold,fontSize: 20),),
                  ),
                  Container(
                    width: 100,
                    child:Text('${cartsData.totalAmount} vnd',style:TextStyle(color: Colors.white),maxLines: 1,overflow:TextOverflow.ellipsis,) ,
                  )

                ],
              )
          ),
        ],
      ),
        // Obx(()=>//Obx cho phep thay doi ui khi co cap nhat moi
        //        Column(
        //          crossAxisAlignment: CrossAxisAlignment.end,
        //          children: [
        //            Container(
        //              height: 600,
        //              child: ListView.builder(
        //                  itemCount: controller.someFakeDrinksData.length,
        //                  itemBuilder: (BuildContext context, int index) {
        //                    return CartDrink(
        //                      controller: controller,
        //                      drink: controller.someFakeDrinksData.keys.toList()[index],
        //                      quantity: controller.someFakeDrinksData.values.toList()[index],
        //                      index: index ,
        //                    );
        //                  }),
        //            ),
        //            // price
        //       Container(
        //           height: 50,
        //           width: 170,
        //           alignment: Alignment.center,
        //           padding: EdgeInsets.only(left: 15),
        //           decoration: BoxDecoration(
        //               color: Colors.indigo,
        //               borderRadius: BorderRadius.circular(200)
        //           ),
        //           child: Row(
        //             children: [
        //               Container(
        //                 alignment: Alignment.center,
        //                 width:25,
        //                 height: 25,
        //                 margin: EdgeInsets.only(right: 5),
        //                 decoration: BoxDecoration(
        //                     color: Colors.white,
        //                     borderRadius: BorderRadius.circular(20)
        //                 ),
        //                 child: Text('\$',style: TextStyle(color: Colors.indigo,fontWeight: FontWeight.bold,fontSize: 20),),
        //               ),
        //               Container(
        //                 width: 100,
        //                 child:Text('${controller.total} vnd',style:TextStyle(color: Colors.white),maxLines: 1,overflow:TextOverflow.ellipsis,) ,
        //               )
        //
        //             ],
        //           )
        //       ),
        //          ],
        //        )
        //     ),
    );
  }
}

class CartDrink extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    final cartItem = Provider.of<Drink>(context);
    final drinks=Provider.of<Drinks>(context);
    return Row(
      children: [
        Container(
          width: 100,
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                  image: NetworkImage(cartItem.imageUrl,),
                  fit: BoxFit.fill),
            )
        ),
        Container(
          margin: EdgeInsets.only(left: 10),
          width: 150,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(cartItem.title,style: TextStyle(fontSize: 15),),
              const SizedBox(height: 5),
              Text('${cartItem.price*cartItem.quantity} vnd',style: TextStyle(color: Colors.grey),),
            ],
          ),
        ),
        Row(
          children: [
            IconButton(
              onPressed: (){
                if (cartItem.quantity == 1) {
                  cart.removeItem(cartItem.id);
                  drinks.removeItem(cartItem.id);
                } else {
                  cart.less(cartItem.id);
                }
              },
              icon: Icon(Icons.remove),
            ),
            Text('${cartItem.quantity}',style: TextStyle(fontSize: 20 ),),
            IconButton(
              onPressed: (){
                cart.addAmount(cartItem.id);
              },
              icon: Icon(Icons.add),
            ),
          ],
        )
      ],
    );
  }
}
