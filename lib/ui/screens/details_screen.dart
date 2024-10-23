// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ghajar_app/app/app_colors.dart';
import 'package:ghajar_app/app/app_radius.dart';
import 'package:ghajar_app/app/app_spacing.dart';
import 'package:ghajar_app/app/app_text_styles.dart';
import 'package:ghajar_app/app/assets.dart';
import 'package:ghajar_app/ui/widgets/custom_app_bar.dart';
import 'package:ghajar_app/ui/widgets/home_screen_widgets/product_item.dart';
import 'package:ghajar_app/ui/widgets/price_card.dart';
import 'package:ghajar_app/utils/enums/app_page_route_enum.dart';
import 'package:ghajar_app/utils/navigation.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailsScreen extends StatelessWidget implements AppPageRoute {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        onTap: () {
          AppNav.pop(context);
        },
        actions: [
          Container(
            width: AppSpacing.value(52).w,
            height: AppSpacing.value(52).h,
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(AppRadius.regular.v),
            ),
            child: Center(
              child: SvgPicture.asset(Assets.images.app_icons.share_svg),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppSpacing.value(23).w),
        child: ListView(
          children: [
            AppSpacing.value(25).inColumn,
            AspectRatio(
              aspectRatio: 328 / 218,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(AppRadius.xm.v),
                child: Image.asset(
                  'assets/images/products/product4.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            AppSpacing.value(33).inColumn,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SvgPicture.asset('assets/images/app_icons/favourite.svg'),
                Text(
                  'طاقة شمسية 1',
                  style: MyText.appStyle.l.wMedium.reColorText.style,
                ),
              ],
            ),
            AppSpacing.value(14).inColumn,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                starsByCount(3.5),
                PriceCard(
                  isDiscount: true,
                  price: 65.00,
                  oldPrice: 79.95,
                )
              ],
            ),
            AppSpacing.value(41).inColumn,
            Directionality(
              textDirection: TextDirection.rtl,
              child: ExpansionTile(
                tilePadding: EdgeInsets.zero,
                shape: RoundedRectangleBorder(
                  side: BorderSide.none,
                ),
                title: Text(
                  'الوصف',
                  style: MyText.appStyle.l.wRegular.reColorText.style,
                ),
                children: [
                  Text(
                    'القميص هو استثمار مربح في خزانة الملابس. والسبب هو:- القمصان تتناسب تمامًا مع أي جزء سفلي- القمصان المصنوعة من الأقمشة الطبيعية مناسبة لأي وقت من السنة.',
                    style: MyText.appStyle.m.wRegular.reColorXLightText.style,
                  )
                ],
              ),
            ),
            Directionality(
              textDirection: TextDirection.rtl,
              child: ExpansionTile(
                tilePadding: EdgeInsets.zero,
                shape: RoundedRectangleBorder(
                  side: BorderSide.none,
                ),
                title: Text(
                  'آراء العملاء',
                  style: MyText.appStyle.l.wRegular.reColorText.style,
                ),
                children: [
                  Text(
                    'القميص هو استثمار مربح في خزانة الملابس. والسبب هو:- القمصان تتناسب تمامًا مع أي جزء سفلي- القمصان المصنوعة من الأقمشة الطبيعية مناسبة لأي وقت من السنة.',
                    style: MyText.appStyle.m.wRegular.reColorXLightText.style,
                  )
                ],
              ),
            ),
            AppSpacing.value(25).inColumn,
            Text(
              'منتجات مماثلة',
              style: MyText.appStyle.l.wRegular.reColorText.style,
              textAlign: TextAlign.end,
            ),
            AppSpacing.value(18).inColumn,
            GridView.builder(
              shrinkWrap: true, // استخدام shrinkWrap
              physics: NeverScrollableScrollPhysics(), // منع التمرير
              itemCount: 20,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 15,
                crossAxisSpacing: 15,
                childAspectRatio: 2.465 / 3,
              ),
              itemBuilder: (context, index) {
                return ProductItem(
                  isDetailsScreen: true,
                );
              },
            )
          ],
        ),
      ),
    );
  }

  @override
  Map<String, String?> get args => {};

  @override
  String get route => AppPageRouteEnum.detailsScreen.routeName;
}

Widget starsByCount(double count) {
  List<Widget> stars = [];
  double countStars = 1.0;
  int intPartCount = count.toInt();
  double doublePartCount = count - intPartCount;

  if (count >= 1 && count <= 5) {
    countStars = intPartCount.toDouble();
  } else if (count > 5) {
    countStars = 5;
  } else if (count < 1) {
    countStars = 1;
  }
  for (int i = 1; i <= countStars; i++) {
    stars.add(
      Padding(
        padding: REdgeInsets.only(right: 5),
        child: Icon(
          FontAwesomeIcons.solidStar,
          color: AppColors.rating,
        ),
      ),
    );
  }
  if (count >= 1 && count <= 5 && doublePartCount == 0.5) {
    countStars += 0.5;
    stars.add(
      Padding(
        padding: REdgeInsets.only(right: 5),
        child: Icon(
          FontAwesomeIcons.starHalfStroke,
          color: AppColors.rating,
        ),
      ),
    );
  }

  for (int i = 1; i <= (5 - countStars).ceil() - 1; i++) {
    stars.add(
      Padding(
        padding: REdgeInsets.only(right: 5),
        child: Icon(
          FontAwesomeIcons.star,
          color: AppColors.rating,
        ),
      ),
    );
  }
  if (count < 1 || (count >= 1 && count <= 5 && doublePartCount != 0.5)) {
    stars.add(
      Padding(
        padding: REdgeInsets.only(right: 5),
        child: Icon(
          FontAwesomeIcons.star,
          color: AppColors.rating,
        ),
      ),
    );
  }
  stars.add(Padding(
    padding: REdgeInsets.only(left: 8),
    child: Text(
      countStars.toDouble().toString(),
      style: TextStyle(color: AppColors.rating, fontSize: 16.sp),
    ),
  ));
  return Row(
    children: stars,
  );
}
