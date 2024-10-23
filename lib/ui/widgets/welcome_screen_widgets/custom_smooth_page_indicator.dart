import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ghajar_app/app/app_colors.dart';
import 'package:ghajar_app/utils/calculate_dimensions.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CustomSmoothPageIndicator extends ConsumerWidget {
  const CustomSmoothPageIndicator({
    super.key,
    required this.pageController,
  });

  final PageController pageController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SmoothPageIndicator(
      controller: pageController,
      count: 3,
      effect: WormEffect(
        dotHeight: height(10),
        dotWidth: width(10),
        dotColor: AppColors.white,
        activeDotColor: AppColors.primary,
      ),
    );
  }
}
