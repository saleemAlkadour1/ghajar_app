import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ghajar_app/app/app_colors.dart';
import 'package:ghajar_app/app/app_radius.dart';
import 'package:ghajar_app/app/app_spacing.dart';
import 'package:ghajar_app/app/app_text_styles.dart';
import 'package:ghajar_app/providers/variables_provider.dart';
import 'package:ghajar_app/ui/widgets/custom_icon.dart';

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
          width: AppSpacing.value(26).w,
          height: AppSpacing.value(21.48).h,
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
                size: 15.sp,
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: AppSpacing.value(7).w),
          child: Text(
            quantity.toString(),
            style: MyText.appStyle.small.wRegular.reColorText.style,
          ),
        ),
        Container(
          width: AppSpacing.value(26).w,
          height: AppSpacing.value(21.48).h,
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
                size: 15.sp,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
