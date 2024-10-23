import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ghajar_app/app/my_strings.dart';
import 'package:ghajar_app/app/assets.dart';
import 'package:ghajar_app/models/cart_item_model.dart';

final listCartItemProvider = StateProvider<List<CartItemModel>>((ref) => [
      CartItemModel(
          name: MyStrings.solarEnergy1,
          price: 250,
          quantity: 1,
          imagePath: Assets.images.products.product1_png),
      CartItemModel(
          name: MyStrings.solarEnergy2,
          price: 250,
          quantity: 1,
          imagePath: Assets.images.products.product2_png),
      CartItemModel(
          name: MyStrings.solarEnergy3,
          price: 250,
          quantity: 1,
          imagePath: Assets.images.products.product3_png),
    ]);
final listPathImage = StateProvider<List<String>>((ref) => [
      Assets.images.categories.image1_png,
      Assets.images.categories.image2_png,
      Assets.images.categories.image3_png,
      Assets.images.categories.image4_png,
      Assets.images.categories.image5_png,
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
