import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ghajar_app/app/my_strings.dart';
import 'package:ghajar_app/ui/widgets/cart_screen_widgets/custom_list_view_in_cart_screen.dart';
import 'package:ghajar_app/ui/widgets/cart_screen_widgets/payment_summary_card.dart';
import 'package:ghajar_app/ui/widgets/custom_app_bar.dart';
import 'package:ghajar_app/ui/widgets/custom_button.dart';
import 'package:ghajar_app/utils/calculate_dimensions.dart';
import 'package:ghajar_app/utils/enums/app_page_route_enum.dart';
import 'package:ghajar_app/utils/navigation.dart';

class CartScreen extends ConsumerWidget implements AppPageRoute {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: CustomAppBar(
        title: MyStrings.shoppingCart,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: width(23),
        ),
        child: Column(
          children: [
            SizedBox(
              height: height(24),
            ),
            SizedBox(
              height: height(296),
              child: const CustomListViewInCartScreen(),
            ),
            SizedBox(
              height: height(31),
            ),
            const PaymentSummaryCard(),
            const Spacer(),
            CustomButton(
              text: MyStrings.completeTheRequest,
            ),
            SizedBox(
              height: height(20),
            )
          ],
        ),
      ),
    );
  }

  @override
  Map<String, String?> get args => {};

  @override
  String get route => AppPageRouteEnum.cartScreen.routeName;
}
