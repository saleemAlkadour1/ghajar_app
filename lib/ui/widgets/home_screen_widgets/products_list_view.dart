import 'package:flutter/material.dart';
import 'package:ghajar_app/ui/widgets/home_screen_widgets/product_item.dart';
import 'package:ghajar_app/utils/calculate_dimensions.dart';

class ProductsListView extends StatelessWidget {
  const ProductsListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height(230),
      width: widthScreen,
      child: ListView.builder(
        reverse: true,
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(
              horizontal: width(8),
            ),
            child: const ProductItem(),
          );
        },
      ),
    );
  }
}
