import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ghajar_app/models/cart_item_model.dart';
import 'package:ghajar_app/providers/variables_provider.dart';
import 'package:ghajar_app/ui/widgets/cart_screen_widgets/cart_item.dart';

class CustomListViewInCartScreen extends ConsumerWidget {
  const CustomListViewInCartScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<CartItemModel> listCartItemModel =
        ref.watch(listCartItemProvider);
    return ListView.builder(
      itemBuilder: (context, index) {
        return CartItem(
          index: index,
          cartItemModel: listCartItemModel[index],
          newQuantity: (value) {
            ref.read(listCartItemProvider.notifier).update((state) {
              final updateList = List<CartItemModel>.from(state);
              updateList[index].quantity = value;
              return updateList;
            });
          },
        );
      },
      itemCount: listCartItemModel.length,
    );
  }
}
