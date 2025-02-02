import 'package:flutter/material.dart';
import 'package:ghajar_app/app/my_strings.dart';
import 'package:ghajar_app/ui/widgets/custom_app_bar.dart';
import 'package:ghajar_app/ui/widgets/home_screen_widgets/product_item.dart';
import 'package:ghajar_app/utils/calculate_dimensions.dart';
import 'package:ghajar_app/utils/enums/app_page_route_enum.dart';
import 'package:ghajar_app/utils/navigation.dart';

class FavouriteScreen extends StatelessWidget implements AppPageRoute {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: MyStrings.favorite,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          vertical: height(26),
          horizontal: width(23),
        ),
        child: GridView.builder(
          itemCount: 20,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: height(22),
            childAspectRatio: 2.3 / 3,
          ),
          itemBuilder: (context, index) {
            return const ProductItem(
              isFavourite: true,
            );
          },
        ),
      ),
    );
  }

  @override
  Map<String, String?> get args => {};

  @override
  String get route => AppPageRouteEnum.favouriteScreen.routeName;
}
