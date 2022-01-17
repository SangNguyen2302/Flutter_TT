import 'package:assignment_3/models/cart_provider.dart';
import 'package:assignment_3/models/drinks.dart';
import 'package:assignment_3/models/drink_model.dart';
import 'package:assignment_3/overview/bage.dart';
import 'package:assignment_3/page/bag_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   // final Size = MediaQuery.of(context).size;
    final drinksData = Provider.of<Drinks>(context);
    final drinks = drinksData.drinks;
    return Scaffold(
        appBar: AppBar(
          title: Text('SangNguyen'),
            actions: <Widget>[
              Consumer<Cart>(
                builder: (_, cart, ch) => Badge(
                    value: cart.itemCount.toString(),
                    child: IconButton(
                        icon: const Icon(Icons.shopping_cart), onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailPage()));
                    })),
              )
            ]
          // actions: [
          //   IconButton(
          //       onPressed: () {
          //         Navigator.push(context,
          //             MaterialPageRoute(builder: (context) => DetailPage()));
          //       },
          //       icon: Icon(
          //         Icons.shopping_bag,
          //       ))
          // ],
        ),
        body: GridView.builder(
                itemCount: drinks.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  // crossAxisSpacing: 15,//khoang cach ngang
                  // mainAxisSpacing: 20.0, //khoang cach doc
                  childAspectRatio: MediaQuery.of(context).size.width /
                      (MediaQuery.of(context).size.height / 1.7),
                ),
                itemBuilder: ( context,  i) =>
                    ChangeNotifierProvider.value(
                      value: drinks[i],
                      child: ItemProducts(
                      ),
                    ))
          );
  }
}

// ignore: must_be_immutable
class ItemProducts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final item = Provider.of<Drink>(context);
   final cart = Provider.of<Cart>(context, listen:  false);
    return InkWell(
        child: Container(
            padding: EdgeInsets.all(10),
            child: Stack(
              children: [
                Container(
            decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
              image: NetworkImage(
                item.imageUrl,
              ),
              fit: BoxFit.fill),
        ),
                    child: Container(
                        margin: EdgeInsets.only(top: 170),
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                tileMode: TileMode.mirror,
                                colors: [
                                  Color(0xff21242C).withOpacity(.45),
                                  Color(0xff21242C).withOpacity(.45),
                                ]),
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(10),
                                bottomRight: Radius.circular(10))),
                        child: Row(
                          children: [
                            // title, price
                            Container(
                              width: 100,
                              margin: EdgeInsets.only(top: 15, left: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    item.title,
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 13),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  Text('${item.price} vnd',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 13)),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            IconButton(
                              onPressed: () {
                                item.toggleAddToCardStatus();
                                cart.addItem(
                                    item.id, item.title, item.price, item.imageUrl);
                              },
                              icon: Icon(item.isChoose ? Icons.check : Icons.add),
                            )
                          ],
                        )),
                   ),
              ],
            )));
  }
}

// class _AddButton extends StatelessWidget {
//   final Drink drink;
//
//   const _AddButton({required this.drink, Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     // The context.select() method will let you listen to changes to
//     // a *part* of a model. You define a function that "selects" (i.e. returns)
//     // the part you're interested in, and the provider package will not rebuild
//     // this widget unless that particular part of the model changes.
//     //
//     // This can lead to significant performance improvements.
//     var isInCart = context.select<DrinkProvider, bool>(
//       // Here, we are only interested whether [item] is inside the cart.
//       (cart) => cart.drinks.contains(drink),
//     );
//
//     return TextButton(
//       onPressed: isInCart
//           ? null
//           : () {
//               // If the item is not in cart, we let the user add it.
//               // We are using context.read() here because the callback
//               // is executed whenever the user taps the button. In other
//               // words, it is executed outside the build method.
//               var cart = context.read<DrinkProvider>();
//               cart.add(drink);
//             },
//       style: ButtonStyle(
//         overlayColor: MaterialStateProperty.resolveWith<Color?>((states) {
//           if (states.contains(MaterialState.pressed)) {
//             return Theme.of(context).primaryColor;
//           }
//           return null; // Defer to the widget's default.
//         }),
//       ),
//       child: isInCart
//           ? const Icon(Icons.check, semanticLabel: 'ADDED')
//           : const Text('ADD'),
//     );
//   }
// }
