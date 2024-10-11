import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ghajar_app/app/app_spacing.dart';
import 'package:ghajar_app/app/translations.dart';
import 'package:ghajar_app/providers/variables_provider.dart';
import 'package:ghajar_app/ui/widgets/home_screen_widgets/category_item.dart';

class CategoriesListView extends ConsumerWidget {
  const CategoriesListView({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<String> pathImages = ref.watch(listPathImage);

    return SizedBox(
      height: AppSpacing.value(50).h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: pathImages.length,
        itemBuilder: (context, index) {
          return CategoryItem(
            pathImage: pathImages[index],
            title: Translations.categoryTitles[index],
          );
        },
      ),
    );
  }
}
