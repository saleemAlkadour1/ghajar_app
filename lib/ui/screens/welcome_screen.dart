import 'package:flutter/material.dart';
import 'package:ghajar_app/app/app_spacing.dart';
import 'package:ghajar_app/app/my_strings.dart';
import 'package:ghajar_app/assets.dart';
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
  late final PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    final double heightScreen = MediaQuery.sizeOf(context).height;
    final double widthScreen = MediaQuery.sizeOf(context).width;
    final List<String> pathImages = [
      Assets.images.page_view_images.page_view_image_1_svg,
      Assets.images.page_view_images.page_view_image_2_svg,
      Assets.images.page_view_images.page_view_image_2_svg,
    ];
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppSpacing.value(23).w),
          child: Stack(
            children: [
              Column(
                children: [
                  Expanded(
                    child: CustomPageView(
                      heightScreen: heightScreen,
                      widthScreen: widthScreen,
                      pageController: pageController,
                      pathImages: pathImages,
                      titles: MyStrings.titlesPageView,
                      details: MyStrings.detailsPageView,
                    ),
                  ),
                  CustomButton(
                    heightScreen: heightScreen,
                    widthScreen: widthScreen,
                    text: MyStrings.btnToStartNow,
                    onTap: () {
                      AppNav.withoutRoot(context, const HomeScreen())
                          .pushReplacementPage();
                    },
                  ),
                  AppSpacing.customHeight(heightScreen * 0.02)
                ],
              ),
              Positioned(
                top: heightScreen / 1.97,
                left: widthScreen / 2.7,
                child:
                    CustomSmoothPageIndicator(pageController: pageController),
              )
            ],
          ),
        ),
      ),
    );
  }
}
