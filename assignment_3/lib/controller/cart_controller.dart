import 'package:assignment_3/models/drink_model.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  var _drink = {}.obs;

  void addDrink(Drink drink) {
    // add card & tang so luong
    if (_drink.containsKey(drink)) {
      // kiem tra san pham da dc them ds _drink chua
      _drink[drink] += 1; // co thi +1
    } else {
      _drink[drink] = 1;
    }
    Get.snackbar("Drink Added", "You have add the ${drink.title}to the cart",
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 1));
  }

  get someFakeDrinksData => _drink;

// giam so luong dan pham
  void removeDrink(Drink drink) {

    if (_drink.containsKey(drink) && _drink[drink] == 1) {
      // kt ton tai trong drink ch va co =1 k?
      _drink.removeWhere((key, value) => key == drink);//xoa key value san pham
     // _drink.firstWhere((key,value) => key == drink, orElse: () => print('No matching element.'));
    } else {
      _drink[drink] -= 1; // >1 sl-1
    }
  }

  get drinkSubTotal => _drink.entries
      .map((drink) => drink.key.price * drink.value)
      .toList();// lay cac gia tri ben trong  kt tung gia tri roi nhan lai

  get total =>_drink.entries
      .map((drink) => drink.key.price * drink.value)
      .toList().reduce((value, element) => value + element,
     ).toStringAsFixed(2);// cong lai cac ptu
}
