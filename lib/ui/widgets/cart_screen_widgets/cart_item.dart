import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ghajar_app/app/app_colors.dart';
import 'package:ghajar_app/app/app_radius.dart';
import 'package:ghajar_app/app/app_text_styles.dart';
import 'package:ghajar_app/models/cart_item_model.dart';
import 'package:ghajar_app/ui/widgets/cart_screen_widgets/set_quantity.dart';
import 'package:ghajar_app/utils/calculate_dimensions.dart';

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
        vertical: height(10),
        horizontal: width(9),
      ),
      margin: EdgeInsets.only(
        bottom: height(10),
      ),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(AppRadius.xm.v),
      ),
      width: widthScreen,
      height: height(92),
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
          SizedBox(
            width: width(8.49),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                cartItemModel.name,
                style: MyText.appStyle.ml.wMedium.reColorText.style,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(
                height: height(14),
              ),
              Text(
                cartItemModel.price.toString() + r' $',
                style: MyText.appStyle.l.wRegular.reColorXXLightText.style,
              ),
            ],
          ),
          SizedBox(
            width: width(10),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(AppRadius.regular.v),
            child: AspectRatio(
              aspectRatio: 84 / 73,
              child: Image.asset(
                fit: BoxFit.cover,
                cartItemModel.imagePath!,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
