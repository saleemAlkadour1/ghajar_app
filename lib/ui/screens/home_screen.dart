// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ghajar_app/app/app_colors.dart';
import 'package:ghajar_app/app/app_spacing.dart';
import 'package:ghajar_app/app/app_text_styles.dart';
import 'package:ghajar_app/app/translations.dart';
import 'package:ghajar_app/providers/variables_provider.dart';
import 'package:ghajar_app/ui/bottom_navigation_bar_item.dart';
import 'package:ghajar_app/ui/screens/cart_screen.dart';
import 'package:ghajar_app/ui/screens/catalog_screen.dart';
import 'package:ghajar_app/ui/screens/favourite_screen.dart';
import 'package:ghajar_app/ui/widgets/home_screen_widgets/categories_list_view.dart';
import 'package:ghajar_app/ui/widgets/home_screen_widgets/custom_app_bar_in_home_view.dart';
import 'package:ghajar_app/ui/widgets/home_screen_widgets/custom_text_field.dart';
import 'package:ghajar_app/ui/widgets/home_screen_widgets/offer_slide.dart';
import 'package:ghajar_app/ui/widgets/home_screen_widgets/products_list_view.dart';
import 'package:ghajar_app/utils/enums/app_page_route_enum.dart';
import 'package:ghajar_app/utils/navigation.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends ConsumerWidget implements AppPageRoute {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final PageController pageController = PageController();
    final List<Widget> screens = [
      FavouriteScreen(),
      CatalogScreen(),
      CartScreen(),
      HomeScreen(),
    ];
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: ref.watch(selectedIndexProvider) == 3
            ? SafeArea(
                child: Column(
                  children: [
                    AppSpacing.value(20).inColumn,
                    CustomAppBarInHomeView(),
                    AppSpacing.value(21).inColumn,
                    CustomTextField(),
                    AppSpacing.value(26).inColumn,
                    CategoriesListView(),
                    //AppSpacing.value(18).inColumn,
                    Spacer(),
                    OfferSlide(pageController: pageController),
                    AppSpacing.value(24).inColumn,
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 23.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            Translations.more,
                            style: MyText
                                .appStyle.small.wRegular.reColorPrimary.style,
                          ),
                          Text(
                            Translations.centralHeating,
                            style: MyText.appStyle.l.wMedium.reColorText.style,
                          )
                        ],
                      ),
                    ),
                    //AppSpacing.value(12).inColumn,
                    Spacer(),
                    ProductsListView(),
                    //AppSpacing.value(24).inColumn,
                    Spacer(),
                  ],
                ),
              )
            : screens[ref.watch(selectedIndexProvider)],
        bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent),
          child: BottomNavigationBar(
            backgroundColor: AppColors.white,
            type: BottomNavigationBarType.fixed,
            currentIndex: ref.watch(selectedIndexProvider),
            onTap: (index) {
              ref.watch(selectedIndexProvider.notifier).state = index;
            },
            items: [
              customBottomNavigationBarItem(
                index: 0,
                selectedIndex: ref.watch(selectedIndexProvider),
                title: Translations.favorite,
                pathImage: 'assets/images/app_icons/heart.svg',
              ),
              customBottomNavigationBarItem(
                index: 1,
                selectedIndex: ref.watch(selectedIndexProvider),
                title: Translations.catalog,
                pathImage: 'assets/images/app_icons/sort.svg',
              ),
              customBottomNavigationBarItem(
                index: 2,
                selectedIndex: ref.watch(selectedIndexProvider),
                title: Translations.cart,
                pathImage: 'assets/images/app_icons/cart.svg',
              ),
              customBottomNavigationBarItem(
                index: 3,
                selectedIndex: ref.watch(selectedIndexProvider),
                title: Translations.main,
                pathImage: 'assets/images/app_icons/home.svg',
              ),
            ],
          ),
        ));
  }

  @override
  Map<String, String?> get args => {};

  @override
  String get route => AppPageRouteEnum.homeScreen.routeName;
}
