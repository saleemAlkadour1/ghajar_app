// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ghajar_app/app/app_spacing.dart';
import 'package:ghajar_app/app/translations.dart';
import 'package:ghajar_app/providers/variables_provider.dart';
import 'package:ghajar_app/ui/widgets/catalog_screen_widgets/catalog_item.dart';
import 'package:ghajar_app/ui/widgets/custom_app_bar.dart';
import 'package:ghajar_app/utils/enums/app_page_route_enum.dart';
import 'package:ghajar_app/utils/navigation.dart';

class CatalogScreen extends ConsumerWidget implements AppPageRoute {
  const CatalogScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<String> pathImages = ref.watch(listPathImage);
    return Scaffold(
        appBar: CustomAppBar(title: Translations.catalog),
        body: Padding(
          padding: EdgeInsets.symmetric(
              vertical: AppSpacing.value(25).h,
              horizontal: AppSpacing.value(23).w),
          child: ListView.builder(
            itemCount: pathImages.length,
            itemBuilder: (context, index) {
              return CatalogItem(
                sort: index + 1,
                title: Translations.categoryTitles[index],
                pathImage: pathImages[index],
              );
            },
          ),
        ));
  }

  @override
  Map<String, String?> get args => {};

  @override
  String get route => AppPageRouteEnum.catalogScreen.routeName;
}
