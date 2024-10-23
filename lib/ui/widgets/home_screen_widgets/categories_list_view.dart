import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ghajar_app/app/my_strings.dart';
import 'package:ghajar_app/providers/variables_provider.dart';
import 'package:ghajar_app/ui/widgets/home_screen_widgets/category_item.dart';
import 'package:ghajar_app/utils/calculate_dimensions.dart';

class CategoriesListView extends ConsumerWidget {
  const CategoriesListView({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<String> pathImages = ref.watch(listPathImage);

    return SizedBox(
      height: height(50),
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
