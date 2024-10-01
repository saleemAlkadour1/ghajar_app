// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:ghajar_app/app/app_spacing.dart';
import 'package:ghajar_app/app/my_strings.dart';
import 'package:ghajar_app/ui/widgets/catalog_screen_widgets/catalog_item.dart';
import 'package:ghajar_app/ui/widgets/custom_app_bar.dart';
import 'package:ghajar_app/utils/enums/app_pages_route.dart';
import 'package:ghajar_app/utils/navigation.dart';

class CatalogScreen extends StatelessWidget implements AppPageRoute {
  const CatalogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> pathImages = [
      'assets/images/categories/image1.png',
      'assets/images/categories/image2.png',
      'assets/images/categories/image3.png',
      'assets/images/categories/image4.png',
      'assets/images/categories/image5.png',
    ];
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSpacing.value(23).w),
      child: Scaffold(
          appBar: CustomAppBar(title: MyStrings.catalog),
          body: Padding(
            padding: EdgeInsets.symmetric(vertical: AppSpacing.value(25).h),
            child: ListView.builder(
              itemCount: pathImages.length,
              itemBuilder: (context, index) {
                return CatalogItem(
                  sort: index + 1,
                  title: MyStrings.categoryTitles[index],
                  pathImage: pathImages[index],
                );
              },
            ),
          )),
    );
  }

  @override
  Map<String, String?> get args => {};

  @override
  String get route => AppPageRouteEnum.catalogScreen.routeName;
}
