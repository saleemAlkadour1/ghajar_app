import 'package:flutter/material.dart';
import 'package:ghajar_app/app/app_spacing.dart';
import 'package:ghajar_app/ui/widgets/home_screen_widgets/category_item.dart';

class CategoriesListView extends StatelessWidget {
  const CategoriesListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSpacing.value(50).h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) {
          return const CategoryItem();
        },
      ),
    );
  }
}
