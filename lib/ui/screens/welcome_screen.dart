// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:ghajar_app/app/app_config.dart';
import 'package:ghajar_app/app/app_spacing.dart';
import 'package:ghajar_app/app/translations.dart';
import 'package:ghajar_app/ui/screens/home_screen.dart';
import 'package:ghajar_app/ui/widgets/custom_button.dart';
import 'package:ghajar_app/ui/widgets/welcome_screen_widgets/custom_page_view.dart';
import 'package:ghajar_app/ui/widgets/welcome_screen_widgets/custom_smooth_page_indicator.dart';
import 'package:ghajar_app/utils/enums/app_page_route_enum.dart';
import 'package:ghajar_app/utils/navigation.dart';

class WelcomeScreen extends StatefulWidget implements AppPageRoute {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();

  @override
  Map<String, String?> get args => {};

  @override
  String get route => AppPageRouteEnum.welcomeScreen.routeName;
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  late PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    List<String> pathImages = [
      'assets/images/page_view_images/page_view_image_1.svg',
      'assets/images/page_view_images/page_view_image_2.svg',
      'assets/images/page_view_images/page_view_image_2.svg',
    ];
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                Expanded(
                  child: CustomPageView(
                    pageController: pageController,
                    pathImages: pathImages,
                    titles: Translations.titlesPageView,
                    details: Translations.detailsPageView,
                  ),
                ),
                CustomButton(
                  text: Translations.btnToStartNow,
                  onTap: () {
                    AppNav.withoutRoot(context, HomeScreen())
                        .pushReplacementPage();
                  },
                ),
                AppSpacing.value(10).inColumn
              ],
            ),
            Positioned(
                top: AppConfig.designSize.height / 2,
                bottom: AppConfig.designSize.height / 2.8,
                left: AppConfig.designSize.width / 2,
                right: AppConfig.designSize.width / 2,
                child:
                    CustomSmoothPageIndicator(pageController: pageController))
          ],
        ),
      ),
    );
  }
}
