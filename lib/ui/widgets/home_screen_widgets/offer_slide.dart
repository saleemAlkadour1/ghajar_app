import 'package:flutter/material.dart';
import 'package:ghajar_app/app/assets.dart';
import 'package:ghajar_app/utils/calculate_dimensions.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OfferSlide extends StatelessWidget {
  const OfferSlide({
    super.key,
    required this.pageController,
  });

  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SizedBox(
          width: widthScreen,
          height: height(124),
          child: Stack(
            children: [
              PageView.builder(
                controller: pageController,
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Image.asset(
                    Assets.images.offer_png,
                    width: widthScreen,
                    height: height(124),
                  );
                },
              ),
              Positioned(
                  child: Padding(
                padding: EdgeInsets.symmetric(vertical: height(12)),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: SmoothPageIndicator(
                    controller: pageController,
                    count: 3,
                    effect: WormEffect(
                      dotHeight: height(6),
                      dotWidth: width(6),
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
