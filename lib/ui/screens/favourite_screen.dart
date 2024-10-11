// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:ghajar_app/app/app_spacing.dart';
import 'package:ghajar_app/app/translations.dart';
import 'package:ghajar_app/ui/widgets/custom_app_bar.dart';
import 'package:ghajar_app/ui/widgets/home_screen_widgets/product_item.dart';
import 'package:ghajar_app/utils/enums/app_page_route_enum.dart';
import 'package:ghajar_app/utils/navigation.dart';

class FavouriteScreen extends StatelessWidget implements AppPageRoute {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: Translations.favorite,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
            vertical: AppSpacing.value(25).h,
            horizontal: AppSpacing.value(23).w),
        child: GridView.builder(
          itemCount: 20,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 15,
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
