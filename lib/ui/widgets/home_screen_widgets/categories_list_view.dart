import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ghajar_app/app/my_strings.dart';
import 'package:ghajar_app/providers/variables_provider.dart';
import 'package:ghajar_app/ui/widgets/home_screen_widgets/category_item.dart';

class CategoriesListView extends ConsumerWidget {
  const CategoriesListView({
    required this.heightScreen,
    required this.widthScreen,
    super.key,
  });
  final double heightScreen;
  final double widthScreen;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<String> pathImages = ref.watch(listPathImage);

    return SizedBox(
      height: heightScreen * 0.07,
      child: ListView.builder(
        reverse: true,
        scrollDirection: Axis.horizontal,
        itemCount: pathImages.length,
        itemBuilder: (context, index) {
          return CategoryItem(
            pathImage: pathImages[index],
            title: MyStrings.categoryTitles[index],
          );
        },
      ),
    );
  }
}
