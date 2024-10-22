import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ghajar_app/app/app_colors.dart';
import 'package:ghajar_app/app/app_radius.dart';
import 'package:ghajar_app/app/app_text_styles.dart';
import 'package:ghajar_app/app/my_strings.dart';
import 'package:ghajar_app/assets.dart';
import 'package:ghajar_app/ui/screens/details_screen.dart';
import 'package:ghajar_app/utils/navigation.dart';

class ProductItem extends StatefulWidget {
  const ProductItem({
    super.key,
    this.isFavourite = false,
    this.isDetailsScreen = false,
    required this.heightScreen,
    required this.widthScreen,
  });
  final bool? isFavourite;
  final bool? isDetailsScreen;
  final double heightScreen;
  final double widthScreen;

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
            width: widget.widthScreen * 0.4,
            height: widget.heightScreen * 0.24,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(widget.heightScreen * 0.01),
                  child: Center(
                    child: Image.asset(
                      Assets.images.imageitem_png,
                      fit: BoxFit.cover,
                    ),
                  ),
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
                      padding: EdgeInsets.all(widget.heightScreen * 0.004),
                      child: Center(
                        child: Container(
                          decoration: BoxDecoration(
                            color: AppColors.primary,
                            borderRadius:
                                BorderRadius.circular(AppRadius.regular.v),
                          ),
                          padding: EdgeInsets.all(widget.widthScreen * 0.01),
                          child: SvgPicture.asset(
                            Assets.images.app_icons.buy_cart_svg,
                            width: widget.widthScreen * 0.055,
                            height: widget.widthScreen * 0.055,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: REdgeInsets.only(right: 11),
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
            left: widget.widthScreen * 0.30,
            top: widget.heightScreen * 0.02,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  isTap = !isTap;
                });
              },
              child: Icon(
                isTap == false ? Icons.favorite_outline : Icons.favorite,
                color: AppColors.primary,
                size: 25.sp,
              ),
            ))
      ],
    );
  }
}
