import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ghajar_app/app/app_spacing.dart';
import 'package:ghajar_app/assets.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OfferSlide extends StatelessWidget {
  const OfferSlide({
    super.key,
    required this.pageController,
    required this.heightScreen,
    required this.widthScreen,
  });

  final PageController pageController;
  final double heightScreen;
  final double widthScreen;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SizedBox(
          width: double.infinity,
          height: heightScreen * 0.16,
          child: Stack(
            children: [
              PageView.builder(
                controller: pageController,
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Image.asset(
                    Assets.images.offer_png,
                    width: AppSpacing.value(329).w,
                    height: AppSpacing.value(124).h,
                    fit: BoxFit.fill,
                  );
                },
              ),
              Positioned(
                  child: Padding(
                padding: EdgeInsets.symmetric(vertical: 12.h),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: SmoothPageIndicator(
                    controller: pageController,
                    count: 3,
                    effect: WormEffect(
                      dotHeight: AppSpacing.value(6).h,
                      dotWidth: AppSpacing.value(6).w,
                      dotColor: const Color(0XFFD9D9D9),
                      activeDotColor: const Color(0XFFFFBA5F),
                    ),
                  ),
                ),
              ))
            ],
          )),
    );
  }
}
