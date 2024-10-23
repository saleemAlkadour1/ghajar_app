import 'package:flutter/material.dart';
import 'package:ghajar_app/app/app_spacing.dart';
import 'package:ghajar_app/app/my_strings.dart';
import 'package:ghajar_app/ui/widgets/custom_app_bar.dart';
import 'package:ghajar_app/ui/widgets/home_screen_widgets/product_item.dart';
import 'package:ghajar_app/utils/enums/app_page_route_enum.dart';
import 'package:ghajar_app/utils/navigation.dart';

class FavouriteScreen extends StatelessWidget implements AppPageRoute {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double heightScreen = MediaQuery.sizeOf(context).height;
    final double widthScreen = MediaQuery.sizeOf(context).width;
    return Scaffold(
      appBar: CustomAppBar(
        title: MyStrings.favorite,
        heightScreen: heightScreen,
        widthScreen: widthScreen,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          vertical: heightScreen * 0.02,
          horizontal: AppSpacing.value(23).w,
        ),
        child: GridView.builder(
          itemCount: 20,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 5,
            childAspectRatio: 2.465 / 3,
          ),
          itemBuilder: (context, index) {
            return ProductItem(
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
