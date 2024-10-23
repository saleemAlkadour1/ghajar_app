import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ghajar_app/app/app_colors.dart';
import 'package:ghajar_app/app/app_radius.dart';
import 'package:ghajar_app/app/app_text_styles.dart';
import 'package:ghajar_app/app/my_strings.dart';
import 'package:ghajar_app/app/assets.dart';
import 'package:ghajar_app/ui/screens/details_screen.dart';
import 'package:ghajar_app/utils/calculate_dimensions.dart';
import 'package:ghajar_app/utils/navigation.dart';

class ProductItem extends StatefulWidget {
  const ProductItem({
    super.key,
    this.isFavourite = false,
    this.isDetailsScreen = false,
  });
  final bool? isFavourite;
  final bool? isDetailsScreen;

  @override
  State<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  bool isTap = false;
  @override
  void initState() {
    super.initState();
    if (widget.isFavourite == true) {
      isTap = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: () {
            if (widget.isDetailsScreen == false) {
              AppNav.withoutRoot(context, const DetailsScreen()).pushPage();
            }
          },
          child: Container(
            decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(AppRadius.lg.v)),
            width: width(154),
            height: height(219.5),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    top: height(9),
                    left: width(6),
                    right: width(6),
                  ),
                  child: Center(
                    child: Image.asset(
                      Assets.images.imageitem_png,
                      width: width(142),
                      height: height(133),
                    ),
                  ),
                ),
                SizedBox(
                  height: height(24),
                ),
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
                      padding: EdgeInsets.all(
                        emp(6),
                      ),
                      child: Center(
                        child: Container(
                          width: width(44),
                          height: height(41),
                          decoration: BoxDecoration(
                            color: AppColors.primary,
                            borderRadius: BorderRadius.circular(AppRadius.m.v),
                          ),
                          padding: EdgeInsets.all(emp(10)),
                          child: SvgPicture.asset(
                            Assets.images.app_icons.buy_cart_svg,
                            width: width(24),
                            height: height(24),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: REdgeInsets.only(right: width(11)),
                      child: Text(
                        MyStrings.heating,
                        style: MyText.appStyle.ml.wRegular.reColorText.style,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
        Positioned(
            left: width(116),
            top: height(16),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  isTap = !isTap;
                });
              },
              child: Icon(
                isTap == false ? Icons.favorite_outline : Icons.favorite,
                color: AppColors.primary,
                size: emp(24),
              ),
            ))
      ],
    );
  }
}
