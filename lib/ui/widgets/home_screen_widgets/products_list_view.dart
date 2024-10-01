import 'package:flutter/material.dart';
import 'package:ghajar_app/ui/widgets/home_screen_widgets/product_item.dart';

class ProductsListView extends StatelessWidget {
  const ProductsListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 210,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) {
          return const ProductItem();
        },
      ),
    );
  }
}
