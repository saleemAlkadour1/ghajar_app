import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ghajar_app/ui/widgets/home_screen_widgets/product_item.dart';

class ProductsListView extends StatelessWidget {
  const ProductsListView({
    super.key,
    required this.heightScreen,
    required this.widthScreen,
  });
  final double heightScreen;
  final double widthScreen;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: heightScreen * 0.235,
      child: ListView.builder(
        reverse: true,
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) {
          return Padding(
            padding: REdgeInsets.symmetric(horizontal: 4),
            child: ProductItem(
              heightScreen: heightScreen,
              widthScreen: widthScreen,
            ),
          );
        },
      ),
    );
  }
}
