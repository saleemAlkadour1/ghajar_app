import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ghajar_app/app/my_strings.dart';
import 'package:ghajar_app/providers/variables_provider.dart';
import 'package:ghajar_app/ui/widgets/cart_screen_widgets/details_item.dart';
import 'package:ghajar_app/utils/calculate_dimensions.dart';

class PaymentSummaryCard extends ConsumerWidget {
  const PaymentSummaryCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    double orderTotal = ref.watch(orderTotalProvider);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DetailsItem(title: MyStrings.totalPrice, value: orderTotal.toString()),
        SizedBox(
          height: height(6),
        ),
        DetailsItem(title: MyStrings.discount, value: '0'),
        SizedBox(
          height: height(6),
        ),
        DetailsItem(title: MyStrings.estimatedDeliveryCharges, value: '0'),
      ],
    );
  }
}
