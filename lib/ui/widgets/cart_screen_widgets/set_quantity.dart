import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ghajar_app/app/app_colors.dart';
import 'package:ghajar_app/app/app_radius.dart';
import 'package:ghajar_app/app/app_text_styles.dart';
import 'package:ghajar_app/providers/variables_provider.dart';
import 'package:ghajar_app/ui/widgets/custom_icon.dart';
import 'package:ghajar_app/utils/calculate_dimensions.dart';

class SetQuantity extends ConsumerStatefulWidget {
  const SetQuantity({
    super.key,
    required this.newQuantity,
    required this.index,
  });
  final Function(int) newQuantity;
  final int index;

  @override
  ConsumerState<SetQuantity> createState() => _SetQuantityState();
}

class _SetQuantityState extends ConsumerState<SetQuantity> {
  @override
  Widget build(BuildContext context) {
    int quantity = ref.watch(listCartItemProvider)[widget.index].quantity;
    return Row(
      children: [
        Container(
          width: width(26),
          height: height(21.48),
          decoration: BoxDecoration(
              color: AppColors.bg,
              borderRadius: BorderRadius.circular(AppRadius.sm.v)),
          child: Center(
            child: CustomIcon(
              onTap: () {
                setState(() {
                  if (quantity >= 1 && quantity < 99) {
                    quantity += 1;
                  }
                  widget.newQuantity(quantity);
                });
              },
              icon: Icon(
                Icons.add,
                color: AppColors.primary,
                size: emp(15),
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width(10.76)),
          child: Text(
            quantity.toString(),
            style: MyText.appStyle.small.wRegular.reColorText.style,
          ),
        ),
        Container(
          width: width(26),
          height: height(21.48),
          decoration: BoxDecoration(
              color: AppColors.bg,
              borderRadius: BorderRadius.circular(AppRadius.sm.v)),
          child: Center(
            child: CustomIcon(
              onTap: () {
                setState(() {
                  if (quantity > 1 && quantity <= 99) {
                    quantity -= 1;
                  }
                  widget.newQuantity(quantity);
                });
              },
              icon: Icon(
                Icons.remove,
                color: AppColors.primary,
                size: emp(15),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
