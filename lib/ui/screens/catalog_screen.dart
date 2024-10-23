import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ghajar_app/app/my_strings.dart';
import 'package:ghajar_app/providers/variables_provider.dart';
import 'package:ghajar_app/ui/widgets/catalog_screen_widgets/catalog_item.dart';
import 'package:ghajar_app/ui/widgets/custom_app_bar.dart';
import 'package:ghajar_app/utils/calculate_dimensions.dart';
import 'package:ghajar_app/utils/enums/app_page_route_enum.dart';
import 'package:ghajar_app/utils/navigation.dart';

class CatalogScreen extends ConsumerWidget implements AppPageRoute {
  const CatalogScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<String> pathImages = ref.watch(listPathImage);
    return Scaffold(
        appBar: CustomAppBar(
          title: MyStrings.catalog,
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(
            vertical: height(24),
            horizontal: width(23),
          ),
          child: ListView.builder(
            itemCount: pathImages.length,
            itemBuilder: (context, index) {
              return CatalogItem(
                heightScreen: heightScreen,
                widthScreen: widthScreen,
                sort: index + 1,
                title: MyStrings.categoryTitles[index],
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
