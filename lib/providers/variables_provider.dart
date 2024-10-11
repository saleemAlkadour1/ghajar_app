import 'package:flutter/material.dart';
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
final listPathImage = StateProvider<List<String>>((ref) => [
      'assets/images/categories/image1.png',
      'assets/images/categories/image2.png',
      'assets/images/categories/image3.png',
      'assets/images/categories/image4.png',
      'assets/images/categories/image5.png',
    ]);
final orderTotalProvider = StateProvider<double>((ref) {
  final listCartItem = ref.watch(listCartItemProvider);
  double orderTotal = 0;
  for (var cartItem in listCartItem) {
    orderTotal += (cartItem.price * cartItem.quantity);
  }
  return orderTotal;
});
final pageControllerProvider =
    StateProvider<PageController>((ref) => PageController());
final selectedIndexProvider = StateProvider<int>((ref) => 3);
