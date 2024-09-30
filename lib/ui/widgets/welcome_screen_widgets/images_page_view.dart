import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ghajar_app/app/app_spacing.dart';

class ImagesPageView extends StatelessWidget {
  const ImagesPageView({
    super.key,
    required this.pageController,
    required this.pathImages,
  });

  final PageController pageController;
  final List<String> pathImages;

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: pageController,
      itemBuilder: (context, index) {
        return SvgPicture.asset(
          pathImages[index],
          width: AppSpacing.value(321).w,
          height: AppSpacing.value(261).h,
        );
      },
      itemCount: pathImages.length,
    );
  }
}
