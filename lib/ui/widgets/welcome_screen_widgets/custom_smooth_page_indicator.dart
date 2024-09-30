import 'package:flutter/material.dart';
import 'package:ghajar_app/app/app_colors.dart';
import 'package:ghajar_app/app/app_spacing.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CustomSmoothPageIndicator extends StatelessWidget {
  const CustomSmoothPageIndicator({
    super.key,
    required this.pageController,
  });

  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return SmoothPageIndicator(
      controller: pageController,
      count: 3,
      effect: WormEffect(
        dotHeight: AppSpacing.value(10).h,
        dotWidth: AppSpacing.value(10).w,
        dotColor: AppColors.white,
        activeDotColor: AppColors.primary,
      ),
    );
  }
}
