import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ghajar_app/app/app_colors.dart';
import 'package:ghajar_app/app/app_radius.dart';
import 'package:ghajar_app/app/app_spacing.dart';
import 'package:ghajar_app/app/app_text_styles.dart';
import 'package:ghajar_app/app/translations.dart';
import 'package:ghajar_app/ui/screens/details_screen.dart';
import 'package:ghajar_app/utils/navigation.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({
    super.key,
    this.isFavourite = false,
  });
  final bool? isFavourite;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        AppNav.withoutRoot(context, const DetailsScreen()).pushPage();
      },
      child: Container(
        decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(AppRadius.lg.v)),
        width: 154.w,
        height: 203.h,
        margin: EdgeInsets.symmetric(horizontal: 8.w),
        child: Column(
          children: [
            AppSpacing.value(9).inColumn,
            Stack(
              children: [
                Center(child: Image.asset('assets/images/imageItem.png')),
                Positioned(
                    child: Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                      padding: EdgeInsets.only(top: 7.h, right: 14.w),
                      child: Icon(
                        isFavourite == false
                            ? Icons.favorite_outline
                            : Icons.favorite,
                        color: AppColors.primary,
                      )),
                ))
              ],
            ),
            AppSpacing.value(18).inColumn,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.bg,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(AppRadius.m.v),
                      bottomRight: Radius.circular(AppRadius.m.v),
                    ),
                  ),
                  padding: EdgeInsets.all(6.sp),
                  child: Center(
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColors.primary,
                        borderRadius: BorderRadius.circular(AppRadius.m.v),
                      ),
                      padding: EdgeInsets.all(6.sp),
                      child: SvgPicture.asset(
                          'assets/images/app_icons/buy_cart.svg'),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 11.w),
                  child: Text(
                    Translations.heating,
                    style: MyText.appStyle.ml.wRegular.reColorText.style,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
