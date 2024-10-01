// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:ghajar_app/app/app_spacing.dart';
import 'package:ghajar_app/app/my_strings.dart';
import 'package:ghajar_app/ui/screens/home_screen.dart';
import 'package:ghajar_app/ui/widgets/custom_button.dart';
import 'package:ghajar_app/ui/widgets/welcome_screen_widgets/custom_smooth_page_indicator.dart';
import 'package:ghajar_app/ui/widgets/welcome_screen_widgets/images_page_view.dart';
import 'package:ghajar_app/ui/widgets/welcome_screen_widgets/text_page_view.dart';
import 'package:ghajar_app/utils/enums/app_page_route_enum.dart';
import 'package:ghajar_app/utils/navigation.dart';

class WelcomeScreen extends StatelessWidget implements AppPageRoute {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    PageController pageController = PageController();
    List<String> pathImages = [
      'assets/images/page_view_images/page_view_image_1.svg',
      'assets/images/page_view_images/page_view_image_2.svg',
      'assets/images/page_view_images/page_view_image_2.svg',
    ];
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            AppSpacing.value(158).inColumn,
            Expanded(
              child: Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: AppSpacing.value(21).w),
                child: ImagesPageView(
                    pageController: pageController, pathImages: pathImages),
              ),
            ),
            AppSpacing.value(28).inColumn,
            CustomSmoothPageIndicator(pageController: pageController),
            AppSpacing.value(38).inColumn,
            Expanded(
              child: TextPageView(
                controller: PageController(),
                titles: MyStrings.titlesPageView,
                details: MyStrings.detailsPageView,
              ),
            ),
            AppSpacing.value(133).inColumn,
            CustomButton(
              text: MyStrings.btnToStartNow,
              onTap: () {
                AppNav.withoutRoot(context, HomeScreen()).pushReplacementPage();
              },
            ),
            AppSpacing.value(10).inColumn
          ],
        ),
      ),
    );
  }

  @override
  // TODO: implement args
  Map<String, String?> get args => {};

  @override
  // TODO: implement route
  String get route => AppPageRouteEnum.welcomeScreen.routeName;
}
