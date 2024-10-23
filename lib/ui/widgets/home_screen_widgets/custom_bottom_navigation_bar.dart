import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ghajar_app/app/app_colors.dart';
import 'package:ghajar_app/app/my_strings.dart';
import 'package:ghajar_app/app/assets.dart';
import 'package:ghajar_app/providers/variables_provider.dart';
import 'package:ghajar_app/ui/bottom_navigation_bar_item.dart';

class CustomBottomNavigationBar extends ConsumerWidget {
  const CustomBottomNavigationBar({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Theme(
      data: Theme.of(context).copyWith(
          splashColor: Colors.transparent, highlightColor: Colors.transparent),
      child: BottomNavigationBar(
        backgroundColor: AppColors.white,
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: ref.watch(selectedIndexProvider),
        onTap: (index) {
          ref.watch(selectedIndexProvider.notifier).state = index;
        },
        items: [
          customBottomNavigationBarItem(
            index: 0,
            selectedIndex: ref.watch(selectedIndexProvider),
            title: MyStrings.favorite,
            pathImage: Assets.images.app_icons.heart_svg,
          ),
          customBottomNavigationBarItem(
            index: 1,
            selectedIndex: ref.watch(selectedIndexProvider),
            title: MyStrings.catalog,
            pathImage: Assets.images.app_icons.sort_svg,
          ),
          customBottomNavigationBarItem(
            index: 2,
            selectedIndex: ref.watch(selectedIndexProvider),
            title: MyStrings.cart,
            pathImage: Assets.images.app_icons.cart_svg,
          ),
          customBottomNavigationBarItem(
            index: 3,
            selectedIndex: ref.watch(selectedIndexProvider),
            title: MyStrings.main,
            pathImage: Assets.images.app_icons.home_svg,
          ),
        ],
      ),
    );
  }
}
