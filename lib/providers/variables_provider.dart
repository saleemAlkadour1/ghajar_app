import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ghajar_app/models/cart_item_model.dart';

final listCartItemProvider = StateProvider<List<CartItemModel>>((ref) => [
      CartItemModel(
          name: 'طاقة شمسية 1',
          price: 250,
          quantity: 1,
          imagePath: 'assets/images/products/product1.png'),
      CartItemModel(
          name: 'طاقة شمسية 2',
          price: 250,
          quantity: 1,
          imagePath: 'assets/images/products/product2.png'),
      CartItemModel(
          name: 'طاقة شمسية 3',
          price: 250,
          quantity: 1,
          imagePath: 'assets/images/products/product3.png'),
    ]);
final orderTotalProvider = StateProvider<double>((ref) {
  final listCartItem = ref.watch(listCartItemProvider);
  double orderTotal = 0;
  for (var cartItem in listCartItem) {
    orderTotal += (cartItem.price * cartItem.quantity);
  }
  return orderTotal;
});
