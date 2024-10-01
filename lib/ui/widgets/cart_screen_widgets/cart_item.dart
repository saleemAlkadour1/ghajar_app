import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ghajar_app/app/app_colors.dart';
import 'package:ghajar_app/app/app_radius.dart';
import 'package:ghajar_app/app/app_spacing.dart';
import 'package:ghajar_app/app/app_text_styles.dart';
import 'package:ghajar_app/models/cart_item_model.dart';
import 'package:ghajar_app/ui/widgets/cart_screen_widgets/set_quantity.dart';

class CartItem extends ConsumerWidget {
  const CartItem(
      {super.key,
      required this.cartItemModel,
      required this.newQuantity,
      required this.index});
  final CartItemModel cartItemModel;
  final Function(int) newQuantity;
  final int index;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: AppSpacing.value(10).h,
        horizontal: AppSpacing.value(9).w,
      ),
      margin: EdgeInsets.only(bottom: AppSpacing.value(10).h),
      decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(AppRadius.xm.v)),
      height: AppSpacing.value(92).h,
      child: Row(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: SetQuantity(
              index: index,
              newQuantity: (value) {
                newQuantity(value);
              },
            ),
          ),
          AppSpacing.value(21).inRow,
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                cartItemModel.name,
                style: MyText.appStyle.ml.wMedium.reColorText.style,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const Spacer(),
              Text(
                cartItemModel.price.toString() + r' $',
                style: MyText.appStyle.l.wRegular.reColorXXLightText.style,
              ),
            ],
          ),
          AppSpacing.value(10).inRow,
          ClipRRect(
            borderRadius: BorderRadius.circular(AppRadius.regular.v),
            child: Image.asset(
              fit: BoxFit.cover,
              cartItemModel.imagePath!,
              width: AppSpacing.value(84).w,
              height: AppSpacing.value(73).h,
            ),
          ),
        ],
      ),
    );
  }
}
