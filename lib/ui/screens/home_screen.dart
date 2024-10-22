import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ghajar_app/app/app_spacing.dart';
import 'package:ghajar_app/app/app_text_styles.dart';
import 'package:ghajar_app/app/my_strings.dart';
import 'package:ghajar_app/providers/variables_provider.dart';
import 'package:ghajar_app/ui/screens/cart_screen.dart';
import 'package:ghajar_app/ui/screens/catalog_screen.dart';
import 'package:ghajar_app/ui/screens/favourite_screen.dart';
import 'package:ghajar_app/ui/widgets/home_screen_widgets/categories_list_view.dart';
import 'package:ghajar_app/ui/widgets/home_screen_widgets/custom_app_bar_in_home_view.dart';
import 'package:ghajar_app/ui/widgets/home_screen_widgets/custom_bottom_navigation_bar.dart';
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
    final double heightScreen = MediaQuery.sizeOf(context).height;
    final double widthScreen = MediaQuery.sizeOf(context).width;
    final PageController pageController = PageController();
    const List<Widget> screens = [
      FavouriteScreen(),
      CatalogScreen(),
      CartScreen(),
      HomeScreen(),
    ];
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: ref.watch(selectedIndexProvider) == 3
            ? SafeArea(
                child: Padding(
                  padding: REdgeInsets.symmetric(horizontal: 23),
                  child: Column(
                    children: [
                      AppSpacing.customHeight(heightScreen * 0.01),
                      const CustomAppBarInHomeView(),
                      AppSpacing.customHeight(heightScreen * 0.02),
                      SizedBox(
                        height: heightScreen * 0.07,
                        child: const CustomTextField(),
                      ),
                      AppSpacing.customHeight(heightScreen * 0.02),
                      CategoriesListView(
                        heightScreen: heightScreen,
                        widthScreen: widthScreen,
                      ),
                      //AppSpacing.value(18).inColumn,
                      const Spacer(),
                      OfferSlide(
                        pageController: pageController,
                        heightScreen: heightScreen,
                        widthScreen: widthScreen,
                      ),
                      const Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            MyStrings.more,
                            style: MyText
                                .appStyle.small.wRegular.reColorPrimary.style,
                          ),
                          Text(
                            MyStrings.centralHeating,
                            style: MyText.appStyle.l.wMedium.reColorText.style,
                          )
                        ],
                      ),
                      //AppSpacing.value(12).inColumn,
                      AppSpacing.customHeight(heightScreen * 0.03),
                      ProductsListView(
                        heightScreen: heightScreen,
                        widthScreen: widthScreen,
                      ),
                      //AppSpacing.value(24).inColumn,
                      AppSpacing.customHeight(heightScreen * 0.03),
                    ],
                  ),
                ),
              )
            : screens[ref.watch(selectedIndexProvider)],
        bottomNavigationBar: const CustomBottomNavigationBar());
  }

  @override
  Map<String, String?> get args => {};

  @override
  String get route => AppPageRouteEnum.homeScreen.routeName;
}
